package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Usuario Generico")
public class UsuarioGenerico {
    @Id
    @GeneratedValue
    @Column(name = "Id")
    private int id;

    @Column(name = "Nombre", nullable = false)
    private String nombre;

    @Column(name = "Nombre", nullable = false)
    private String apellidos;

    @ManyToOne
    @JoinColumn(name = "Direccion")
    private Direccion direccion;

    @OneToMany(mappedBy = "UG envia")
    private Set<Carta> enviaCartas;

    @OneToMany(mappedBy = "UG recibe")
    private Set<Carta> recibeCartas;

    @OneToMany(mappedBy = "UG envia")
    private Set<Paquete> enviaPaquetes;

    @OneToMany(mappedBy = "UG recibe")
    private Set<Paquete> recibePaquetes;


    public UsuarioGenerico(int id, String nombre, String apellidos, Direccion direccion) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.direccion = direccion;
    }


    public UsuarioGenerico() {

    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public Direccion getDireccion() {
        return direccion;
    }
}
