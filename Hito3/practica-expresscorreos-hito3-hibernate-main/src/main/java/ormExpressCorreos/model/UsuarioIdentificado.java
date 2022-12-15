package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Usuario Generico")
public class UsuarioIdentificado {
    @Id
    @GeneratedValue
    @Column(name = "DNI")
    private int dni;

    @Column(name = "Nombre", nullable = false)
    private String nombre;

    @Column(name = "Nombre", nullable = false)
    private String apellidos;

    @Column(name = "Correo Electronico", nullable = false)
    private String correoElectronico;

    @ManyToOne
    @JoinColumn(name = "Usuario Autorizado")
    private UsuarioIdentificado usuarioAutorizado;

    @OneToMany(mappedBy = "Usuario Autorizado")
    private Set<UsuarioIdentificado> usuariosAutorizados;

    @OneToMany(mappedBy = "UG envia")
    private Set<CartaCertificada> enviaCartaCertificadas;

    @OneToMany(mappedBy = "UI envia")
    private Set<Paquete> recibeCartaCertificadas;

    @OneToMany(mappedBy = "Usuario Identificado")
    private Set<Recogida> recogidas;

    public UsuarioIdentificado(int dni, String nombre, String apellidos, String correoElectronico, UsuarioIdentificado usuarioAutorizado) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.correoElectronico = correoElectronico;
        this.usuarioAutorizado = usuarioAutorizado;
    }

    public UsuarioIdentificado() {

    }

    public int getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public UsuarioIdentificado getUsuarioAutorizado() {
        return usuarioAutorizado;
    }
}
