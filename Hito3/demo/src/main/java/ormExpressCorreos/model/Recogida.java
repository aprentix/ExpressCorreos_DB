package ormExpressCorreos.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
@Table(name = "Recogida")
public class Recogida {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Id")
    private int Id;

    @Column(name = "Fecha de recogida")
    private Date fechaRecogida;

    @ManyToOne
    @JoinColumn(name = "Direccion")
    private Direccion direccion;

    @ManyToOne
    @JoinColumn(name = "Usuario Identificado")
    private UsuarioIdentificado usuarioIdentificado;

    @ManyToOne
    @JoinColumn(name = "Cartero")
    private Cartero cartero;

    @OneToMany(mappedBy = "recogida")
    private Set<Paquete> paquetes;

    public Recogida(int id, Date fechaRecogida, Direccion direccion, UsuarioIdentificado usuarioIdentificado, Cartero cartero) {
        Id = id;
        this.fechaRecogida = fechaRecogida;
        this.direccion = direccion;
        this.usuarioIdentificado = usuarioIdentificado;
        this.cartero = cartero;
    }


    public Recogida() {

    }

    public int getId() {
        return Id;
    }

    public Date getFechaRecogida() {
        return fechaRecogida;
    }

    public Direccion getDireccion() {
        return direccion;
    }

    public UsuarioIdentificado getUsuarioIdentificado() {
        return usuarioIdentificado;
    }

    public Cartero getCartero() {
        return cartero;
    }
}
