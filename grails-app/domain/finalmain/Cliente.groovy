package finalmain

class Cliente {

    Long id
    String foto
    String nombre
    String correo
    String telefono
    String direccion
    Date fechaNacimiento
    String contrasena

    static constraints = {
        id nullable: true
        telefono nullable: true
        direccion nullable: true
        fechaNacimiento nullable: true
        foto nullable: true
    }
}
