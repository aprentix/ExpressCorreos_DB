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
    private UsuarioIdentificado UIrecibe;

    @ManyToOne
    @JoinColumn (name = "UIenvia")
    private UsuarioIdentificado UIenvia;

    @ManyToOne(optional = false)
    @JoinColumn(name = "Reparto")
    private Reparto reparto;

    public CartaCertificada(int id, String nivelUrgencia, UsuarioIdentificado UIrecibe, UsuarioIdentificado UIenvia, Reparto reparto) {
        this.id = id;
        this.nivelUrgencia = nivelUrgencia;
        this.UIrecibe = UIrecibe;
        this.UIenvia = UIenvia;
        this.reparto = reparto;
    }

    public int getId() {
        return id;
    }

    public String getNivelUrgencia() {
        return nivelUrgencia;
    }

    public UsuarioIdentificado getUIrecibe() {
        return UIrecibe;
    }

    public UsuarioIdentificado getUIenvia() {
        return UIenvia;
    }

    public Reparto getReparto() {
        return reparto;
    }
}
