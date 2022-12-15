package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Paquete")
public class Paquete {
    @Id
    @GeneratedValue
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "Dimension", nullable = false)
    private String dimension;

    @Column(name = "Dimension", nullable = false)
    private double peso;

    @ManyToOne
    @JoinColumn(name = "UG recibe")
    private UsuarioGenerico UGRecibe;

    @ManyToOne
    @JoinColumn (name = "UG envia")
    private UsuarioGenerico UGEnvia;

    @ManyToOne
    @JoinColumn (name = "Cartero")
    private Cartero cartero;

    @ManyToOne
    @JoinColumn(name = "Reparto")
    private Reparto reparto;

    @ManyToOne
    @JoinColumn(name = "Recogida")
    private Recogida recogida;

    public Paquete(int id, String dimension, double peso, UsuarioGenerico UGRecibe, UsuarioGenerico UGEnvia, Cartero cartero, Reparto reparto, Recogida recogida) {
        this.id = id;
        this.dimension = dimension;
        this.peso = peso;
        this.UGRecibe = UGRecibe;
        this.UGEnvia = UGEnvia;
        this.cartero = cartero;
        this.reparto = reparto;
        this.recogida = recogida;
    }

    public Paquete() {

    }

    public int getId() {
        return id;
    }

    public String getDimension() {
        return dimension;
    }

    public double getPeso() {
        return peso;
    }

    public UsuarioGenerico getUGRecibe() {
        return UGRecibe;
    }

    public UsuarioGenerico getUGEnvia() {
        return UGEnvia;
    }

    public Cartero getCartero() {
        return cartero;
    }

    public Reparto getReparto() {
        return reparto;
    }

    public Recogida getRecogida() {
        return recogida;
    }
}
