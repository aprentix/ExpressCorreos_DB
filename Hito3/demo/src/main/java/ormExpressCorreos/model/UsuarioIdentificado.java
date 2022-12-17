package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Usuario Identificado")
public class UsuarioIdentificado {
    @Id
    @Column(name = "DNI")
    private String dni;

    @Column(name = "Nombre", nullable = false)
    private String nombre;

    @Column(name = "Apellidos", nullable = false)
    private String apellidos;

    @Column(name = "Correo Electronico", nullable = false)
    private String correoElectronico;

    @ManyToOne
    @JoinColumn(name = "Usuario Autorizado")
    private UsuarioIdentificado usuarioAutorizado;

    @OneToMany(mappedBy = "usuarioAutorizado")
    private Set<UsuarioIdentificado> usuariosAutorizados = new HashSet<UsuarioIdentificado>();

    @OneToMany(mappedBy = "UIEnvia")
    private Set<CartaCertificada> enviaCartaCertificadas = new HashSet<CartaCertificada>();

    @OneToMany(mappedBy = "UIRecibe")
    private Set<CartaCertificada> recibeCartaCertificadas = new HashSet<CartaCertificada>();

    @OneToMany(mappedBy = "usuarioIdentificado")
    private Set<Recogida> recogidas = new HashSet<Recogida>();

    @ManyToMany
    @JoinTable(name = "Direcciones de Usuarios Identificados")
    private Set<Direccion> direcciones = new HashSet<Direccion>();

    public UsuarioIdentificado(String dni, String nombre, String apellidos, String correoElectronico) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.correoElectronico = correoElectronico;
    }
    public UsuarioIdentificado(String dni, String nombre, String apellidos, String correoElectronico, UsuarioIdentificado usuarioAutorizado) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.correoElectronico = correoElectronico;
        this.usuarioAutorizado = usuarioAutorizado;
    }

    public UsuarioIdentificado() {

    }

    public String getDni() {
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

    public Set<UsuarioIdentificado> getUsuariosAutorizados() {
        return usuariosAutorizados;
    }

    public Set<CartaCertificada> getEnviaCartaCertificadas() {
        return enviaCartaCertificadas;
    }

    public Set<CartaCertificada> getRecibeCartaCertificadas() {
        return recibeCartaCertificadas;
    }

    public Set<Recogida> getRecogidas() {
        return recogidas;
    }

    public Set<Direccion> getDirecciones() {
        return direcciones;
    }
}
