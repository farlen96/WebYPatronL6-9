
package proyecto.proyecto.service;

import java.util.List;
import proyecto.proyecto.domain.Producto;

public interface ProductoService {

    public List<Producto> getProductos(boolean activos);

    // Se obtiene un Producto, a partir del id de un producto -Read parametro
    public Producto getProducto(Producto producto);

    // Se inserta un nuevo producto si el id del producto esta vacío
    // Se actualiza un producto si el id del producto NO esta vacío
    public void save(Producto producto);

    // Se elimina el producto que tiene el id pasado por parámetro
    public void delete(Producto producto);

    // Lista de productos con precio entre ordendados por descripción ConsultaAmpliada
    public List<Producto> findByPrecioBetweenOrderByDescripcion(double precioInf, double precioSup);
    //Lista de productos utilizando consultas con JPQL    

    public List<Producto> metodoJPQL(double precioInf, double precioSup);

    //Lista de productos utilizando consultas con SQL Nativo
    public List<Producto> metodoNativo(double precioInf, double precioSup);
}
