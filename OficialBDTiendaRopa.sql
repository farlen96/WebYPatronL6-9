-- Crear la base de datos para la tienda
DROP DATABASE IF EXISTS TuRopaCr;
DROP USER IF EXISTS grupo8;
CREATE DATABASE IF NOT EXISTS TuRopaCr;
CREATE USER 'grupo8'@'%' IDENTIFIED BY 'clave_bd';
GRANT ALL PRIVILEGES ON TuRopaCr.* to 'grupo8'@'%';
FLUSH PRIVILEGES;
USE TuRopaCr;

/* la tabla de categoria contiene categorias de peluches*/
DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

DROP TABLE IF EXISTS producto;
CREATE TABLE producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  nombre VARCHAR(1000) NOT NULL,  
  descripcion VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(2048),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
  id int NOT NULL AUTO_INCREMENT,
  nombre varchar(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS usuario;
CREATE TABLE usuario (
  id_usuario int NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  apellido varchar(100) NOT NULL,
  correo varchar(100) NOT NULL,
  direccion varchar(20) NOT NULL,
  username varchar(50) NOT NULL,
  password varchar(100) NOT NULL,
  tarjeta varchar(16)  NOT NULL,
  pin varchar(4) NOT NULL,
  fecha DATE NOT NULL,
  id_rol int DEFAULT NULL,
  PRIMARY KEY (id_usuario),
  KEY id_rol (id_rol),
  CONSTRAINT usuario_ibfk_1 FOREIGN KEY (id_rol) REFERENCES roles (id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS factura;
CREATE TABLE factura (
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

DROP TABLE IF EXISTS venta;
CREATE TABLE venta (
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


INSERT INTO categoria (id_categoria, nombre, tipo, activo) VALUES
    ('1', 'Camisas Hombre', 'Hombre', true),
    ('2', 'Pantalones Hombre', 'Hombre',  true),
    ('3', 'Zapatos Hombre', 'Hombre', true),
    ('4', 'Blusas Mujer','Mujer', true),
    ('5', 'Vestidos Mujer', 'Mujer', true),
    ('6', 'Accesorios Mujer', 'Mujer', true),
    ('7', 'Camisas Niño', 'Niños', true),
    ('8', 'Camisas Niña', 'Niños',true),
    ('9', 'Vestido Niña', 'Niños',true),
    ('10', 'Zapatos Niño', 'Niños' ,true),
    ('11', 'Hombre Descuentos', 'Descuentos',  true),
    ('12', 'Mujer Descuentos', 'Descuentos', true),
    ('13', 'Niño Descuentos', 'Descuentos', true),
    ('14', 'Niña Descuentos', 'Descuentos', true),
    ('15', 'Accesorios Descuentos', 'Descuentos', true);
    
     INSERT INTO producto (id_producto, id_categoria, nombre, descripcion, precio, existencias, ruta_imagen, activo) VALUES
     ('1', '1', 'Camisa Casual Azul', 'Camisa de hombre, casual, color azul, ideal para ocasiones informales','25500','10','https://m.media-amazon.com/images/I/71Y722irfzL._AC_SX342_.jpg', true),
    ('2', '1', 'Camisa Formal Blanca', 'Camisa de hombre, formal, color blanco, perfecta para eventos y trabajo','30750','15','https://m.media-amazon.com/images/I/61Y+tlDOCoL._AC_SX385_.jpg', true),
    ('3', '1', 'Camisa de Cuadros Rojos', 'Camisa de hombre, estilo casual, con patron de cuadros rojos y negros','27200','8','https://m.media-amazon.com/images/I/81ZwdnfIDzL._AC_SX342_.jpg', true),
    ('4', '1', 'Camisa de Mezclilla', 'Camisa de hombre, casual, de mezclilla, ideal para un look relajado','32100','12','https://m.media-amazon.com/images/I/91uMFNK3b3L._AC_SX385_.jpg', true),
	('5', '1', 'Camisa de Lino Beige', 'Camisa de hombre, de lino color beige, perfecta para clima cálido','29800','9','https://m.media-amazon.com/images/I/71gpb0JbUzL._AC_SX385_.jpg', true),
	('6', '2', 'Pantalón Chino Beige', 'Pantalón de hombre, estilo chino, color beige, ideal para ocasiones casuales y semi formales','35000','9','https://m.media-amazon.com/images/I/61vY4V-lxvL._AC_SX569_.jpg', true),
    ('7', '2', 'Jeans Slim Fit', 'Pantalón de hombre, jeans slim fit, color azul oscuro, cómodo y moderno','40500','10','https://m.media-amazon.com/images/I/61iNHhOu+WL._AC_SY445_.jpg',true),
    ('8', '2', 'Pantalón de Vestir Negro', 'Pantalón de hombre, de vestir, color negro, ideal para eventos formales','50000','5','https://m.media-amazon.com/images/I/71Tn25pVX+L._AC_SX466_.jpg', true),
    ('9', '2', 'Jogger Deportivo Gris', 'Pantalón de hombre, estilo jogger, color gris, ideal para deportes y uso diario','30500','9','https://m.media-amazon.com/images/I/81OT03XeDEL._AC_SY741_.jpg',true),
    ('10','2', 'Pantalón Cargo Verde', 'Pantalón de hombre, estilo cargo, color verde militar, con multiples bolsillos','42000','17','https://m.media-amazon.com/images/I/61+cHUyWuVL._AC_SY445_.jpg', true),
	('11','3', 'Zapatos Oxford Negros', 'Zapatos de hombre, estilo Oxford, color negro, ideales para eventos formales','85000','10','https://m.media-amazon.com/images/I/710SxVpfTTL._AC_SY535_.jpg', true),
    ('12','3', 'Zapatos Derby de Gamuza', 'Zapatos de hombre, estilo Derby, fabricados n gamuza, color azul, ideales para ocasiones semi formales','80000','14','https://m.media-amazon.com/images/I/61sg-y02MuL._AC_SY395_.jpg', true),
    ('13','3', 'Botas de Trabajo', 'Zapatos de hombre, botas de trabajo, color café, duraderas y resistentes','83100','21','https://m.media-amazon.com/images/I/71gDnykjcBL._AC_SY500_.jpg', true),
    ('14','3', 'Zapatillas Deportivas Blancas', 'Zapatos de hombre, zapatillas deportivas, color blanco, cómodas y modernas','100500','15','https://m.media-amazon.com/images/I/715nZaNCMRL._AC_SY575_.jpg', true),
    ('15','3', 'Zapatos Náuticos Azules', 'Zapatos de hombre, estilo naútico, color azul, ideales para un look relajado','72000','24','https://m.media-amazon.com/images/I/61urcds7YcL._AC_SY675_.jpg', true),
	('16','4', 'Blusa de Encaje Blanco', 'Blusa de mujer, de encaje, color blanco, ideal para ocasiones formales o casuales elegantes','22400','8','https://m.media-amazon.com/images/I/81vJwmVh7vL._AC_SX342_.jpg', true),
    ('17','4', 'Blusa de Gasa', 'Blusa de mujer, de gasa, fresca y cómoda para el día a día','19000','7','https://m.media-amazon.com/images/I/71Q09TvK71L._AC_SX342_.jpg', true),
    ('18','4', 'Blusa de Satén Rosada', 'Blusa de mujer, de satén, color rosada, elegante y sofisticada para ventos especiales','25700','10','https://m.media-amazon.com/images/I/51VOgO5oFpL._AC_SX385_.jpg', true),
    ('19','4', 'Blusa de Rayas Azul  Blanco', 'Blusa de mujer, con rayas horizontales en azul y blanco, perfecta para un look casual','28500','14','https://m.media-amazon.com/images/I/81XySC8LILL._AC_SY445_.jpg', true),
    ('20','4', 'Blusa de Manga Larga Verde Oliva', 'Blusa de mujer, de manga larga, color verde oliva, ideal para climas frescos','33000','9','https://m.media-amazon.com/images/I/71ddf89QbsL._AC_SX385_.jpg', true),
	('21','5', 'Vestido de Encaje Negro', 'Vestido de mujer, de encaje, color negro, elegante y perfecto para eventos nocturnos','17300','11','https://m.media-amazon.com/images/I/61GAi4F7LzS._AC_SX342_.jpg', true),
    ('22','5', 'Vestido Maxi Floral', 'Vestido de mujer, estilo maxi, con estampado floral, ideal para un look veraniego','15700','14','https://m.media-amazon.com/images/I/810N3M13jcL._AC_SX342_.jpg', true),
    ('23','5', 'Vestido de Cóctel Rojo', 'Vestido de mujer, de cóctel, color rojo, ajustado y sofisticado para eventos especiales','22300','4','https://m.media-amazon.com/images/I/61GYnsysCmL._AC_SY741_.jpg', true),
    ('24','5', 'Vestido de Seda Verde', 'Vestido de mujer, de seda, color verde esmeralda, suave y lujoso para ocasiones formales','20800','16','https://m.media-amazon.com/images/I/61FXx8peWmL._AC_SX679_.jpg', true),
    ('25','5', 'Vestido Bohemio Blanco', 'Vestido de mujer, estilo bohemio, color blanco, cómodo y fluido, ideal para un look casual','23500','9','https://m.media-amazon.com/images/I/61C7-A2R4HL._AC_SY445_.jpg', true),
	('26','6', 'Collar de Perlas', 'Collar de mujer, de perlas naturales, elegante y clásico, perfecto para ocasiones formalesm','53000','10','https://m.media-amazon.com/images/I/519mSehR9pS._AC_SY535_.jpg', true),
    ('27','6', 'Pulsera de Oro Rosa', 'Pulsera de mujer, de oro rosa, delicada y moderna, ideal para complementar cualquier atuendo','24000','3','https://m.media-amazon.com/images/I/61l5GeEbUfL._AC_SY675_.jpg', true),
    ('28','6', 'Aretes de Plata', 'Aretes de mujer, de plata esterlina, con diseño minimalista, perfectos para el uso diario','13500','11','https://m.media-amazon.com/images/I/61oGwSF0WuL._AC_SY500_.jpg', true),
    ('29','6', 'Bolso de Mano Negro', 'Bolso de mano para mujer, color negro, elegante y práctico, ideal para eventos nocturnos','40700','5','https://m.media-amazon.com/images/I/818+TDoAAJL._AC_SY625_.jpg', true),
    ('30','6', 'Gafas de Sol Retro', 'Gafas de sol para mujer, con montura retro, ideales para protegerse del sol con estilo','7300','11','https://m.media-amazon.com/images/I/51eVsxXmJjL._AC_SX679_.jpg', true),
    ('31','11', 'Camiseta Deportiva Hombre', 'Camiseta deportiva de hombre, ideal para entrenamientos, con un 20% de descuento','11500','50','https://m.media-amazon.com/images/I/714TxW8cH2L._AC_SY445_.jpg', true),
    ('32','11', 'Pantalón Casual Hombre', 'Pantalón casual de hombre, cómodo y versátil, con un 30% de descuento','14550','18','https://m.media-amazon.com/images/I/7123czEPRXL._AC_SX385_.jpg', true),
	('33','11', 'Chaqueta de Cuero Hombre', 'Chaqueta de cuero de hombre, estilo clásico, con un 25% de descuento','17000','7','https://m.media-amazon.com/images/I/71hM3vi2RoL._AC_SX385_.jpg', true),
	('34','11', 'Zapatos Oxford Hombre', 'Zapatos Oxford de hombre, elegantes y formales, con un 35% de descuento','19000','15','https://m.media-amazon.com/images/I/511AIei3U5L._AC_SY675_.jpg', true),
	('35','11', 'Reloj Deportivo Hombre', 'Reloj deportivo de hombre, resistente al agua, con un 40% de descuento','20900','20','https://m.media-amazon.com/images/I/71wyFn3SUzL.__AC_SX300_SY300_QL70_FMwebp_.jpg', true),
	('36','11', 'Gorra Casual Hombre', 'Gorra casual de hombre, estilo moderno, con un 15% de descuento','9350','18','https://m.media-amazon.com/images/I/71RoxWkVvCL._AC_SX679_.jpg', true),
	('37','12', 'Blusa de Encaje Blanco', 'Blusa de encaje blanco para mujer, elegante y perfecta para ocasiones especiales, con un 20% de descuento','12250','10','https://m.media-amazon.com/images/I/61AcgP8-kfL._AC_SX466_.jpg', true),
	('38','12', 'Vestido Floral Verano', 'Vestido floral de verano para mujer, fresco y cómodo, con un 30% de descuento','11200','14','https://m.media-amazon.com/images/I/71uwCLZHyGL._AC_SX466_.jpg', true),
	('39','12', 'Pantalón Palazzo Negro', 'Pantalón palazzo negro para mujer, versátil y elegante, con un 25% de descuento','14600','7','https://m.media-amazon.com/images/I/61yUFHGxGYL._AC_SY445_.jpg', true),
	('40','12', 'Chaqueta de Jean Mujer', 'Chaqueta de jean para mujer, estilo casual y moderno, con un 15% de descuento','16800','2','https://m.media-amazon.com/images/I/8181SXivvUL._AC_SX342_.jpg', true),
	('41','12', 'Zapatos de Tacón Rojo', 'Zapatos de tacón rojo para mujer, ideales para eventos formales, con un 35% de descuento','19000','8','https://m.media-amazon.com/images/I/61dQTNldKqL._AC_SY675_.jpg', true),
	('42','12', 'Bolso de Mano Cuero', 'Bolso de mano de cuero para mujer, elegante y práctico, con un 40% de descuento','12000','10','https://m.media-amazon.com/images/I/71lg3DlFS+L._AC_SX679_.jpg', true),
	('43','13', 'Camiseta de Superman', 'Camiseta para niños con diseño de Superman, ideal para jugar o para un look casual, 100% algodón, con un 20% de descuento','9000','8','https://m.media-amazon.com/images/I/81kBbjlsqWL._AC_SX466_.jpg', true),
	('44','13', 'Pantalones Cortos de Avengers', 'Pantalones cortos para niños con estampado de los Avengers, cómodos y frescos, con un 25% de descuento','11300','11','https://m.media-amazon.com/images/I/81WestM+-8L._AC_SX342_.jpg', true),
	('45','13', 'Mochila Escolar de Spiderman', 'Mochila escolar para niños con diseño de Spiderman, resistente y espaciosa, con un 30% de descuento','14300','14','https://m.media-amazon.com/images/I/61ka1bCoT1L.__AC_SX300_SY300_QL70_FMwebp_.jpg', true),
	('46','13', 'Gorra de Mickey Mouse', 'Gorra para niños con diseño de Mickey Mouse, ideal para protegerse del sol, con un 15% de descuento','9000','21','https://m.media-amazon.com/images/I/71Sdfou4TYL._AC_SX466_.jpg', true),
	('47','13', 'Pijamas de Dinosaurios', 'Pijama para niños con estampado de dinosaurios, suave y cómoda, con un 35% de descuento','11300','11','https://m.media-amazon.com/images/I/71+dH0WYYVL._AC_SY445_.jpg', true),
    ('48','13', 'Zapatillas de Cars', 'Zapatillas para niños con diseño de Cars, ligeras y fáciles de usar, con un 40% de descuento','15350','13','https://m.media-amazon.com/images/I/81CUY+BGRfL._AC_SY395_.jpg', true),('49','14', 'Vestido de Princesa', 'Vestido para niñas con diseño de princesa, ideal para fiestas y eventos especiales, con un 25% de descuento','12.350','19','https://m.media-amazon.com/images/I/61yLwsza3dL._AC_SX466_.jpg', true),
	('50','14', 'Mochila de Unicornio', 'Mochila para niñas con diseño de unicornio, perfecta para la escuela o actividades, con un 30% de descuento','15200','11','https://m.media-amazon.com/images/I/71+n3wxMybL._AC_SY300_SX300_.jpg', true),
	('51','14', 'Conjunto de Ropa Floral', 'Conjunto de ropa para niñas con estampado floral, incluye blusa y falda, con un 20% de descuento','11500','11','https://m.media-amazon.com/images/I/81zNaxPMuoL._AC_SX342_.jpg', true),
	('52','14', 'Pijamas de Sirena', 'Pijamas para niñas con diseño de sirena, suave y cómoda, con un 35% de descuento','9550','12','https://m.media-amazon.com/images/I/91ZJD4f9bpL._AC_SX342_.jpg', true),
	('53','14', 'Zapatos de Ballet', 'Zapatos de ballet para niñas, cómodos y elegantes, con un 15% de descuento','19800','20','https://m.media-amazon.com/images/I/61CGDIk7SEL._AC_SY500_.jpg', true),
	('54','14', 'Diadema de Flores', 'Diadema para niñas con flores decorativas, ideal para complementar cualquier outfit, con un 40% de descuento','5400','24','https://m.media-amazon.com/images/I/61USvYPTRPL._AC_SX679_.jpg', true),
    ('55','15', 'Bolso de Mano (Elegante)', 'Bolso de mano para mujer, diseño elegante y espacioso, perfecto para eventos formales, con un 20% de descuento','16800','14','https://m.media-amazon.com/images/I/91siFc15DZL._AC_SY675_.jpg', true),
    ('56','15', 'Reloj Deportivo', 'Reloj deportivo para mujer, resistente al agua y con múltiples funciones, con un 30% de descuento','17900','12','https://m.media-amazon.com/images/I/61rEhEztgpL.__AC_SX300_SY300_QL70_FMwebp_.jpg', true),
    ('57','15', 'Gafas de Sol (Polarizadas)', 'Gafas de sol con lentes polarizados, ideales para proteger tus ojos del sol con estilo, con un 25% de descuento','10200','11','https://m.media-amazon.com/images/I/61KoUsVP2CL._AC_SX679_.jpg', true),
    ('58','15', 'Bufanda de Lana', 'Bufanda de lana suave y cálida, perfecta para el invierno, con un 35% de descuento','8300','13','https://m.media-amazon.com/images/I/91u+8YNdKKL._AC_SY445_.jpg', true),
    ('59','15', 'Sombrero de Playa', 'Sombrero de playa de ala ancha, ideal para protegerse del sol durante el verano, con un 15% de descuento','12600','6','https://m.media-amazon.com/images/I/81KL9ktmbPL._AC_SX466_.jpg', true),
    ('60','15', 'Guantes de Cuero', 'Guantes de cuero para hombre, perfectos para mantener las manos cálidas en invierno, con un 40% de descuento','6950','6','https://m.media-amazon.com/images/I/817YkP-hSaL._AC_SX466_.jpg', true),
    ('61','7', 'Camisa de Niño (Rayas)', 'Camisa de niño con diseño de rayas azules y blancas, ideal para ocasiones casuales y formales, talla 6-12 años','7500','5','https://m.media-amazon.com/images/I/61e7xlgQA9L._AC_SY445_.jpg', true),
    ('62','7', 'Camisa de Niño (Cuadros)', 'Camisa de niño con diseño de cuadros rojos y negros, perfecta para un look moderno y casual, talla 6-12 años','7300','12','https://m.media-amazon.com/images/I/81s74Ibyb-L._AC_SX385_.jpg', true),
    ('63','7', 'Camisa de Niño (Cumpleaños)', 'Camisa de niño con diseño especial para cumpleaños, color blanco con estampado festivo, talla 6-12 años','9400','10','https://m.media-amazon.com/images/I/A1dbsmzbGeL._CLa%7C2140%2C2000%7C71V7KKiD9bL.png%7C0%2C0%2C2140%2C2000%2B0.0%2C0.0%2C2140.0%2C2000.0_AC_SX342_.png', true),
    ('64','8', 'Camisa de Niña (Flores)', 'Camisa de niña con diseño de flores coloridas, perfecta para la primavera y verano, talla 6-12 años','7950','11','https://m.media-amazon.com/images/I/B15-AXSctvL._CLa%7C2140%2C2000%7C81qKcVSnfjL.png%7C0%2C0%2C2140%2C2000%2B0.0%2C0.0%2C2140.0%2C2000.0_AC_SX466_.png', true),
    ('65','8', 'Camisa de Niña (Con Suéter)', 'Camisa de niña con un suéter a juego, ideal para mantener el estilo y la comodidad en climas fríos, talla 6-12 años','1000','10','https://m.media-amazon.com/images/I/917Ob07WaYL._AC_SX679_.jpg', true),
    ('66','8', 'Camisa de Niña (Frutal)', 'Camisa de niña con estampado de frutas, juguetón y alegre, perfecta para eventos casuales, talla 6-12 años','8300','5','https://m.media-amazon.com/images/I/91sInAq6SbL._CLa%7C2140%2C2000%7C81Ji4N3Z1RL.png%7C0%2C0%2C2140%2C2000%2B0.0%2C0.0%2C2140.0%2C2000.0_AC_SX342_.png', true),
    ('67','9', 'Vestido de Niña (Verano)', 'Vestido de niña con estampado floral, ideal para los días cálidos de verano, talla 6-12 años','12100','17','https://m.media-amazon.com/images/I/71lWrQB44mL._AC_SX466_.jpg', true),
    ('68','9', 'Vestido de Niña (Apilados)', 'Vestido de niña con diseño de animales apilados, divertido y colorido, perfecto para fiestas, talla 6-12 años','13200','11','https://m.media-amazon.com/images/I/71lqCLbY+6L._AC_SX466_.jpg', true),
    ('69','9', 'Vestido de Niña (Frutal)', 'Vestido de niña con estampado de frutas, fresco y vibrante, ideal para ocasiones casuales, talla 6-12 años','10350','11','https://m.media-amazon.com/images/I/81ZuiepO9DL._AC_SX385_.jpg', true),
    ('70','10', 'Zapatos de Niño (Deportivos)', 'Zapatos deportivos para niño, cómodos y resistentes, perfectos para actividades al aire libre, talla 28-34','15500','13','https://m.media-amazon.com/images/I/71eey4WeYwL._AC_SY500_.jpg', true),
    ('71','10', 'Zapatos de Niño (Casuales)', 'Zapatos casuales para niño, ideales para el día a día, con cierre de velcro, talla 28-34','18100','15','https://m.media-amazon.com/images/I/91To6wEjINL._AC_SX500_.jpg', true),
    ('72','10', 'Zapatos de Niño (Escolares)', 'Zapatos escolares para niño, con suela antideslizante y diseño clásico, talla 28-34','14150','4','https://m.media-amazon.com/images/I/715+2GrTXXL._AC_SX500_.jpg', true);
   
INSERT INTO roles VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');

INSERT INTO usuario VALUES
 (1,'Antony','Pérez','Antony@gmail.com','Alajuela','Antony','$2a$12$04CrX/liDFv9De2pwewjH.V54GWW.4aa/LrZJwetwXn5otlGFPv7.','1314-5352','6489','2030-02-18',2), /*secretpassword*/
 (2,'Josue','García','maria@gmail.com','Heredia','Josue','$2a$12$Iaz69g9rD9tzKO0kaB.V/.UkwIRHMPr9nPU1kCM7jc.9.wkRrx7Yi','4256-7534','2479','2024-09-15',2), /*mypassword*/
 (3,'Cesar','Perez','carlos@icloud.com','San Jose','Cesar','$2a$12$stCHKC9z1UJs3rDa2kisfucZnHTXruTuNJwsOILv5bzLOMdc9cRkG','1357-2422','2452','2026-02-26',2), /*123456*/
 (4,'Admin','Admin','admin@gmail.com','Limon','admin','$2a$12$mwkEba3Ge19v4g1dIN3pmuT2oDVyd51NWDHpquHq4wdVeesbcVBBC','5257-3532','1352','2031-04-11',1); /*adminpassword*/

 


INSERT INTO factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2022-01-05',211560,2),
(2,2,'2022-01-07',554340,2),
(3,3,'2022-01-07',871000,2),
(4,1,'2022-01-15',244140,1),
(5,2,'2022-01-17',414800,1),
(6,3,'2022-01-21',420000,1);

INSERT INTO venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,88500,3),
(2,1,9,61000,2),
(3,1,10,126000,3),
(4,2,5,29000,1),
(5,2,14,378000,3),
(6,2,9,91500,3),
(7,3,14,100500,1),
(8,3,6,35000,1),
(9,3,15,144000,2),
(10,1,6,70000,2),
(11,1,8,150000,3),
(12,1,9,91500,3),
(13,2,8,150000,3),
(14,2,14,201000,2),
(15,2,3,27200,1),
(16,3,15,72000,1),
(17,3,12,80000,1),
(18,3,10,126000,3);