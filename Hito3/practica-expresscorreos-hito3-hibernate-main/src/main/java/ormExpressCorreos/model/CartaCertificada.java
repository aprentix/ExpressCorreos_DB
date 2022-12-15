package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Carta Certificada")
public class CartaCertificada {
    @Id
    @GeneratedValue
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "Nivel de Urgencia", nullable = false)
    private String nivelUrgencia;

    @ManyToOne
    @JoinColumn(name = "UIrecibe")
    private UsuarioIdentificado UIRecibe;

    @ManyToOne
    @JoinColumn (name = "UIenvia")
    private UsuarioIdentificado UIEnvia;

    @ManyToOne
    @JoinColumn(name = "Reparto")
    private Reparto reparto;

    public CartaCertificada(int id, String nivelUrgencia, UsuarioIdentificado UIRecibe, UsuarioIdentificado UIenvia, Reparto reparto) {
        this.id = id;
        this.nivelUrgencia = nivelUrgencia;
        this.UIRecibe = UIRecibe;
        this.UIEnvia = UIenvia;
        this.reparto = reparto;
    }

    public CartaCertificada() {

    }

    public int getId() {
        return id;
    }

    public String getNivelUrgencia() {
        return nivelUrgencia;
    }

    public UsuarioIdentificado getUIRecibe() {
        return UIRecibe;
    }

    public UsuarioIdentificado getUIEnvia() {
        return UIEnvia;
    }

    public Reparto getReparto() {
        return reparto;
    }
}
