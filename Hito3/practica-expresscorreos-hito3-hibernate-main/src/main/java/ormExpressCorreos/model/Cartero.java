package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Cartero")
public class Cartero {
    @Id
    @GeneratedValue
    @Column(name = "DNI")
    private String DNI;

    @Column(name = "Nombre", nullable = false)
    private String nombre;

    @Column(name = "Apellidos",  nullable = false)
    private String apellidos;

    public Cartero(String DNI, String nombre, String apellidos) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellidos = apellidos;
    }

    public Cartero() {

    }

    public String getDNI() {
        return DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }
}
