package proyecto.proyecto.domain;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;
import lombok.Data;

@Data
@Entity
@Table(name = "Conozcanos")
public class Conozcanos implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_categoria")
    private Long id;
    private String titulo;
    private String   contenido_TEXT;
    private String   fecha;
    @Column(name = "ruta_imagen")
    private String rutaImagen;
    private boolean activo;

    
    @OneToMany
    @JoinColumn(name = "id_categoria")
    List<Producto> producto;

    public Conozcanos() {
    }

    public Conozcanos(String categoria, boolean activo) {
        this.contenido_TEXT = categoria;
        this.activo = activo;
    }

}
  
   