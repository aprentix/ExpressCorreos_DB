package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Usuario Generico")
public class UsuarioGenerico {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Id")
    private int id;

    @Column(name = "Nombre", nullable = false)
    private String nombre;

    @Column(name = "Apellidos", nullable = false)
    private String apellidos;

    @ManyToOne
    @JoinColumn(name = "Direccion")
    private Direccion direccion;

    @OneToMany(mappedBy = "UGEnvia")
    private Set<Carta> enviaCartas;

    @OneToMany(mappedBy = "UGRecibe")
    private Set<Carta> recibeCartas;

    @OneToMany(mappedBy = "UGEnvia")
    private Set<Paquete> enviaPaquetes;

    @OneToMany(mappedBy = "UGRecibe")
    private Set<Paquete> recibePaquetes;


    public UsuarioGenerico(String nombre, String apellidos, Direccion direccion) {
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
