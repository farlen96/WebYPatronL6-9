-- Borrar la base de datos en el caso que existiera
/*drop database if exists Proyecto;*/

-- Borrar el usuario en caso de que exista
/* drop user if exists 'Administrador'@'localhost';*/

-- Borrar alguna tabla en caso de que exista 
/* drop table  Proyecto.producto ;*/

-- Crear la base de datos Proyecto
CREATE DATABASE Proyecto;

-- Crear el usuario Administrador con la contraseña Tienda2024
CREATE USER 'Administrador'@'localhost' IDENTIFIED BY 'Tienda2024';

-- Otorgar todos los privilegios al usuario Administrador sobre la base de datos Proyecto
GRANT ALL PRIVILEGES ON Proyecto.* TO 'Administrador'@'localhost';

-- Aplicar los cambios
FLUSH PRIVILEGES;


-- Crear tabla para Categoria
CREATE TABLE Proyecto.Categoria (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(255) NOT NULL,
    descripcion_categoria varchar(255) not null,
    ruta_imagen varchar(1024),
    activo bool,
	PRIMARY KEY (id_categoria))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4;
    
  ------------------------------------------- Crear tabla para producto-----------
    create table Proyecto.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(1080) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- Crear tabla para Conozcanos
CREATE TABLE Proyecto.Conozcanos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    fecha DATE
);

-- Crear tabla para Contactenos
CREATE TABLE Proyecto.Contactenos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    mensaje TEXT,
    fecha DATE
);

-- Crear tabla para Mapa
CREATE TABLE Proyecto.Mapa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8)
);

-- Crear tabla para Politicas
CREATE TABLE Proyecto.Politicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    fecha DATE
);

  ------------------------------------------- Crear tabla para usuario-----------
  CREATE TABLE Proyecto.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
  ------------------------------------------- Crear tabla para factura-----------
create table Proyecto.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
  ------------------------------------------- Crear tabla para venta-----------
create table Proyecto.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_factura (id_factura) references factura(id_factura),
  foreign key fk_ventas_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

  ------------------------------------------- Crear tabla para producto-----------
create table Proyecto.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
------------------------------------------- Inserccion de datos en las tablas ------------------------------------------

   
/*Se insertan 3 registros en la tabla cliente como ejemplo */
INSERT INTO Proyecto.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'JOAN ','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','JOAN ', 'GONZALEZ   MORA  ',    'jgonzalez@gmail.com',    '4556-8978', 'https://consorciodeneuropsicologia.org/wp-content/images/IMG_2306-scaled.jpg',true),
(2,'ALEXANDRA ','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','ALEXANDRA ',  'ALPIZAR   ZELAYA ', 'alpizarzey@gmail.com', '5456-8789','https://media.licdn.com/dms/image/C4E03AQGLrHOkqBzlRQ/profile-displayphoto-shrink_200_200/0/1660596756139?e=2147483647&v=beta&t=QxuWXvU729qKScuncczt04tjflBTqYj09rzezbQFl9k',true),
(3,'ESTEBAN ','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','ESTEBAN ', 'QUESADA  ALPIZAR ',     'Equesadaal@gmail.com',      '7898-8936','https://cl2.buscafs.com/www.tomatazos.com/public/uploads/images/425542/425542_600x315.jpg',true);

/*Se insertan 6 categorias de productos como ejemplo */
INSERT INTO Proyecto.categoria (id_categoria,categoria,descripcion_categoria,ruta_imagen,activo) VALUES 
('1','camisa Hombre','Camisas para hombres casual', 'https://caterpillarcr.com/cdn/shop/files/2610628_12815_Standard-Stone.jpg?v=1695391085',   true), 
('2','jeans Hombre', 'Pantalones para homnbre', 'https://pantalonesdemezclilla.mx/cdn/shop/files/Rotos-Slim-Jeans-Azules-Para-Hombre_2_60615d8d-585c-4a8e-bfd5-025f796acd41.jpg?v=1706759586&width=1445',   true),
('3','medias','Medias Unisex','https://assets.adidas.com/images/w_600,f_auto,q_auto/093e37f991c247d6a765a9d300acca3e_9366/Medias_de_Corte_Bajo_3_Pares_UNISEX_Gris_DZ9400_03_standard.jpg',true),
('4','Gorras','Gorras Unisex','https://caterpillarcr.com/cdn/shop/files/300806310_1024x1024.jpg?v=1714066869', false),
('5','camisa mujer','Camisas para Mujeres','https://textilesjb.com/wp-content/uploads/2018/09/BLUSA-Cuello-V-Naranja2-Frente.jpg', false),
('6','jeans mujer','Jeans para Mujeres','https://mixdenim.co/cdn/shop/files/WhatsAppImage2023-09-02at12.43.07PM_4.jpg?v=1693676616', false);
/*Se insertan 20 productos por categoria */ 

INSERT INTO Proyecto.producto (id_producto,id_categoria,descripcion,detalle,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'camisa botones blanca',' 100% poliéster ,Regalo preferido: esta camiseta para hombre es un gran regalo de vacaciones para familiares, cónyuges y amigos. Siluetas y diseños favorecedores acentúan tus curvas.Ocasión: esta camiseta para hombre es perfecta para citas, bodas, cumpleaños, cócteles, fiestas, clubes, cenas, salidas nocturnas, playa, vacaciones, vacaciones y uso diario. ',22500,15,'https://m.media-amazon.com/images/I/71e4hbC6e3L.jpg',true),
(2,1,' Camisas de manga corta ','estilo casual, ajustadas, de golf, cuello abatible, con cremallera, secado rápido, camisas activas',26.377,22,'https://m.media-amazon.com/images/I/61ma7quGNeL._AC_UL1500_.jpg',true),
(3,1,'Camisa Hombre Foundation L/S Denim','Esta espectacular denim shirt de Caterpillar es la mezcla perfecta de estilo y durabilidad. Confeccionado con tejido resistente y un diseño clásico, es una pieza imprescindible para cualquier armario.',28450,5,'https://coliseum.vteximg.com.br/arquivos/ids/489693-1000-1000/camisa-hombre-caterpillar-foundation-l-s-denim-shirt-2610627-12815_1.jpg?v=637976752905170000',true),
(4,1,'Camisa Manga Larga Hombre Slimfit Varios Diseños Algodon','CAMISAS ENTALLADAS Y MANGA LARGA, DE DISEÑOS IMPORTADOS !!',29200,20,'https://http2.mlstatic.com/D_NQ_NP_789111-MLA69981842205_062023-O.webp',true),
(5,2,'Jeans Skinny Elastizados Para Hombre','JEAN ELASTIZADO SKINNY PARA HOMBRE PRECIO PROMOCIONAL.EN LA VARIANTE "AZUL CLARO" ALGUNOS VIENEN CON COSTURA AZUL Y OTROS CON COSTURA BEIGE, ES POR UN CAMBIO EN LAS PARTIDAS PERO EL MODELO ES EL MISMO',17512,15,'https://http2.mlstatic.com/D_NQ_NP_984317-MLA43206062255_082020-O.webp',true),
(6,2,'Pantalon Jogger Jean Hombre Mom Cargo Jeans Pantalones Puño','ESTE PANTALÓN ES UNA PRENDA QUE VAS A TERMINAR AMANDO!!NO SÓLAMENTE POR CÓMODA, SINO TAMBIÉN POR PRÁCTICA. LA VAS A PODER USAR TANTO SEA CON REMERA, CON CHOMBA Y HASTA CON CAMISA. QUEDAN SIEMPRE BIEN!!!.',39000,14,'https://http2.mlstatic.com/D_NQ_NP_2X_636852-MLA72673160983_112023-F.webp',true),
(7,2,'Jeans Boyfriend Azules Rotos para Hombre','Marca la diferencia en tu estilo diario con los boyfriend jeans Azules Rotos de PDMX, diseñados para el hombre que se atreve a destacar.',25000,9,'https://pantalonesdemezclilla.mx/cdn/shop/files/rotos-pantalones-de-mezclilla-azules-de-hombre_3.jpg?v=1706895289&width=533',true),
(8,2,'JEANS HOMBRE CUERINA NEGRO 6-4601',' Compuesto de Algodón 98% ,Elastano 2%.',18470,9,'https://vistarsdenimcol.com/cdn/shop/files/6-3838-Feed4_1024x1024@2x.jpg?v=1694449199',true),
(9,3,'MEDIAS UNISEX C SPW ANK 3P','Ideal para cuando se va al gym oh para el dia a dia , comodas !!! hechas de algodon 100% .',14600,12,'https://tiendaspls.com/wp-content/uploads/2024/02/ia3948_1.jpg',true),
(10,3,'Calcetas para Yoga Antideslizantes, Diseño Cinco Dedos','Estas calcetas ofrecen la mejor sensación para tus pies desde el ajuste preciso en el talón previene el amontonamiento y la torsión, brindando una experiencia cómoda y sin restricciones.Material transpirable, elástico, cómodo y lavable.Perfectas por su suela antideslizante, previniendo accidentes al estar sin calzado.Su diseño de cinco dedos facilita el movimiento natural y la extensión de tus dedos, adaptándose perfectamente a actividades como gimnasio, pilates, yoga o baile..',3500,22,'https://www.unimart.com/cdn/shop/files/pixelcut-export_82_8ecab239-2929-43d8-9492-80c41d92a47c.jpg?v=1715709287',true),
(11,4,'Gorra Trademark para Unisex ','Gorra de 6 paneles con logo CAT bordado y cierre de correa con hebilla metalica con grabado de la marca.',15000,8,'https://caterpillarcr.com/cdn/shop/products/W01791_10564_Navy_ef6ea64a-0d59-4cd9-a509-47139d480173.jpg?v=1695345263',true),
(12,4,'Gorra #YOSOYTICO Clásica','Gorra #YOSOYTICO Clásica.Gorra snapback negra, malla blanca.Marca Oficial TDMAS.Broche trasero para ajuste..',18000,11,'https://www.yosoyticocr.com/wp-content/uploads/2019/10/TICO-CLAS-FRENTE.png',true),
(13,5,'Knotted Blouse','Blusa con estampado floral de manga con abertura amarre en manga |.',285000,14,'https://i.pinimg.com/736x/f3/69/15/f36915f8bc53e1f71f209c704cfe8269.jpg',true),
(14,5,'Blusas de mujer | Coleccíon 2020','Una blusa clásica para la oficina o una blusa de flores para las vacaciones.',24800,6,'https://m.media-amazon.com/images/I/81rJHekU20L._AC_SX385_.jpg',true),
(15,5,'Camisa de satén sólido','Producto de importación:Hecho a mano de tela de satén 100% poliéster en color sólido, suave y ligero.Estilo simple y clásico con cuello vuelto, botones a juego en la parte delantera.Manga larga y puño abotonado, dobladillo curvo.Silueta suelta para combinar jeans o faldas.Corte con un ajuste relajado. Pruébalo para la calle o la oficina..',330000,4,'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/163fcf30-7005-412a-b15b-4e6012cc5c8c.202478d5a07fc88da4078aae99676caa.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',true),
(16,5,'estampado de cinta sy cadenas con cinta coordinada','Estas camisas y blusas están fabricadas en España siguiendo una producción totalmente sostenible, garantizada por el certificado ISO 14001..',24000,8,'https://www.guapa.eu/1584-thickbox_default/camisa-de-mujer-estampado-de-cinta-sy-cadenas-con-cinta-coordinada.jpg',true),
(17,6,'Jeans Mujer Denim',' Algodón 70%,Poliester 27%,Elastano 3%.',273000,18,'https://basicjeans.co/cdn/shop/products/1_4_9fd60942-7670-4a2d-88fc-6737307f2181_1024x1024@2x.jpg?v=1676558843',true),
(18,6,'JEANS MUJER MODA CASUALES MOM FIT LIGERO DESGARRE UNICO V13110','Algodón 70% ,Poliester 27%,Elastano 3%.',23500,10,'https://bobois.com.mx/cdn/shop/products/2_0177cc1a-f101-4d2f-8bbb-1d19af588cc2_120x.jpg?v=1631746530',true),
(19,6,'Jeans Push Up Mujer Pitillo Cintura Pepper','Realza tu figura con estilo en los Jeans de Mujer Push Up en tono Pepper. Estilo pitillo y cintura para un toque moderno y favorecedor. Añade este esencial y luce con confianza, destacando tu elegancia..',28400,12,'https://boomboomjeans.pe/cdn/shop/files/Sintitulo-2_9d92d961-64a4-4e4e-9d33-276afae0d047.jpg?v=1694188200&width=600',true),
(20,6,'JEANS MUJER SKINNY TIRO ALTO 2023','Este jeans ha sido diseñado con fibra elástica de alta calidad para un tacto ultra suave, y comodo.El tejido de nuestras telas ha sido estudiado al detalle para que cumpla tus expectativas de comodidad y levantamiento de cola.',273000,15,'https://mixdenim.co/cdn/shop/files/WhatsAppImage2023-09-02at12.43.07PM_4_110x110@2x.jpg?v=1693676616',true);

   /*Se crean 6 facturas */   /*'Activa','Pagada','Anulada')*/
INSERT INTO Proyecto.factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2022-01-05',211560,2),
(2,2,'2022-01-07',554340,2),
(3,3,'2022-01-07',871000,2),
(4,1,'2022-01-15',244140,1),
(5,2,'2022-01-17',414800,1),
(6,3,'2022-01-21',420000,1);

------------------------------------------- Inserccion de datos en las tablas ------------------------------------------

INSERT INTO Proyecto.venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,45000,3),
(2,1,9,15780,2),
(3,1,10,15000,3),
(4,2,5,45000,1),
(5,2,14,154000,3),
(6,2,9,15780,3),
(7,3,14,154000,1),
(8,3,6,57000,1),
(9,3,15,330000,2),
(10,1,6,57000,2),
(11,1,8,27600,3),
(12,1,9,15780,3),
(13,2,8,27600,3),
(14,2,14,154000,2),
(15,2,3,24000,1),
(16,3,15,330000,1),
(17,3,12,45000,1),
(18,3,10,15000,3);

insert into Proyecto.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1),
 (2,'ROLE_VENDEDOR',1),
 (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2),
 (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);
 

