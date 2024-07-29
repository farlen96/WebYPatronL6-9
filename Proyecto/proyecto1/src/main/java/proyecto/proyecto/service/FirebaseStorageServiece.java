
package proyecto.proyecto.service;

import org.springframework.web.multipart.MultipartFile;

public interface FirebaseStorageServiece {
  public String cargaImagen(MultipartFile archivoLocalCliente, String carpeta, Long id);
    //El BuketName es el id_del_proyectos + ".appspot.com#
    final String BucketName = "webypatronl6-9.appspot.com";
    //Esta es la ruta básica de este proyecto 
    final String rutaSuperiorStorage = "WebyPatron";
    //Ubicación donde se encuentra el archivo de configuración
    final String rutaJsonFile = "firebase";
    //El nombre del archivo Json
    final String archivoJsonFile = "webypatronl6-9-firebase-adminsdk-41ky5-cf0584ab46.json";
}
