/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TiendaRopa.demo.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Item extends Producto {

    private int cantidad; 

    public Item() {
    }

    public Item(Producto producto) {
        super.setIdProducto(producto.getIdProducto());
        super.setCategoria(producto.getCategoria());
        super.setNombre(producto.getNombre());
        super.setDescripcion(producto.getDescripcion());
        super.setPrecio(producto.getPrecio());
        super.setExistencias(producto.getExistencias());
        super.setRutaImagen(producto.getRutaImagen());
        super.setActivo(producto.isActivo());
        
        this.cantidad = 0;
    }
}
