package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Reparto")
public class Reparto {
    @Id
    @GeneratedValue
    @Column(name = "Id")
    private int Id;

    @Column(name = "Fecha de creacion", nullable = false)
    private Date fechaCreacion;

    @ManyToOne
    @JoinColumn(name = "Cartero")
    private Cartero cartero;

    @ManyToOne
    @JoinColumn(name = "Coche")
    private Coche coche;

    @ManyToOne
    @JoinColumn(name = "Ruta")
    private Ruta ruta;

    public Reparto(int id, Date fechaCreacion, Cartero cartero, Coche coche, Ruta ruta) {
        Id = id;
        this.fechaCreacion = fechaCreacion;
        this.cartero = cartero;
        this.coche = coche;
        this.ruta = ruta;
    }

    public Reparto() {

    }

    public int getId() {
        return Id;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public Cartero getCartero() {
        return cartero;
    }

    public Coche getCoche() {
        return coche;
    }

    public Ruta getRuta() {
        return ruta;
    }
}
