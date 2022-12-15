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
}
