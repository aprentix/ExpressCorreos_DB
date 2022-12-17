package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

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

    @OneToMany(mappedBy = "cartero")
    private Set<Recogida> recogidas;

    @OneToMany(mappedBy = "cartero")
    private Set<Reparto> repartos;

    @OneToMany(mappedBy = "cartero")
    private Set<Paquete> paquetes;

    @OneToMany(mappedBy = "cartero")
    private Set<Carta> cartas;

    @ManyToMany
    @JoinTable(name = "Carteros reparte en Areas de envio")
    private Set<AreaEnvio> areasEnvios;

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
