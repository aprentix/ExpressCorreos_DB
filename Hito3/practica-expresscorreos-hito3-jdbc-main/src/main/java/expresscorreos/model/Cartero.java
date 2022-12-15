package expresscorreos.model;

/**
 * Modela un cartero. No es necesario modificar esta clase. Pero debe crear tantas clases como entidades
 * necesite para llevar a cabo esta parte del hito 3. Inclúyalas en el paquete "expresscorreos.model"
 */
public class Cartero {
    private String DNI;
    private String nombre;
    private String apellido;

    public Cartero(String DNI, String nombre, String apellidos) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellido = apellidos;
    }

    public String getDNI() {
        return this.DNI;
    }

    public String getNombre() {
        return this.nombre;
    }

    public String getApellidos() {
        return this.apellido;
    }
}
