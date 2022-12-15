package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Carta")
public class Carta {
    @Id
    @GeneratedValue
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "Formato", nullable = false)
    private String formato;

    @ManyToOne
    @JoinColumn(name = "Id_UGenerico")
    private UsuarioGenerico id_ugenerico;

    @ManyToOne
    @JoinColumn(name = "Id_Reparto")
    private Reparto id_reparto;

    public Carta() {
        
    }

    public Carta(int id, String formato, UsuarioGenerico id_ugenerico, Reparto id_reparto)
    {

        this.id = id;
        this.formato = formato;
        this.id_ugenerico = id_ugenerico;
        this.id_reparto = id_reparto;
    }

    public int getId() {
        return id;
    }

    public String getFormato() {
        return formato;
    }

    public void setFormato(String formato) {
        this.formato = formato;
    }

    public UsuarioGenerico getId_ugenerico() {
        return id_ugenerico;
    }
    
    public Reparto getId_reparto() {
        return id_reparto;
    }

}

