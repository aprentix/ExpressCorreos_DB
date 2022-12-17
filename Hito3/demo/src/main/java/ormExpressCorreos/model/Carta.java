package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Carta")
public class Carta {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Id")
    private int id;

    @Column(name = "Formato", nullable = false)
    private String formato;

    @ManyToOne
    @JoinColumn(name = "UG envia")
    private UsuarioGenerico UGEnvia;

    @ManyToOne
    @JoinColumn(name = "UG recibe")
    private UsuarioGenerico UGRecibe;

    @ManyToOne
    @JoinColumn(name = "Reparto")
    private Reparto reparto;

    @ManyToOne
    @JoinColumn(name = "Cartero")
    private Cartero cartero;

    public Carta(int id, String formato, UsuarioGenerico UGEnvia, UsuarioGenerico UGRecibe, Reparto reparto) {
        this.id = id;
        this.formato = formato;
        this.UGEnvia = UGEnvia;
        this.UGRecibe = UGRecibe;
        this.reparto = reparto;
    }

    public Carta() {

    }

    public int getId() {
        return id;
    }

    public String getFormato() {
        return formato;
    }

    public UsuarioGenerico getUGEnvia() {
        return UGEnvia;
    }

    public UsuarioGenerico getUGRecibe() {
        return UGRecibe;
    }

    public Reparto getReparto() {
        return reparto;
    }
}

