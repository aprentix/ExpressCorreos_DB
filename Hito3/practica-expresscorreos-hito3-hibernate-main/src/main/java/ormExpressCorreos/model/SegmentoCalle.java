package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Segmento Calle")
public class SegmentoCalle {
    @Id
    @GeneratedValue
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "Nº Inicio", nullable = false)
    private int nInicio;

    @Column(name = "Nº Final", nullable = false)
    private int nFinal;

    @ManyToOne
    @JoinColumn(name = "Calle")
    private Calle calle;

    public SegmentoCalle(int id, int nInicio, int nFinal, Calle calle) {
        this.id = id;
        this.nInicio = nInicio;
        this.nFinal = nFinal;
        this.calle = calle;
    }

    public SegmentoCalle() {

    }

    public int getId() {
        return id;
    }

    public int getnInicio() {
        return nInicio;
    }

    public int getnFinal() {
        return nFinal;
    }

    public Calle getCalle() {
        return calle;
    }
}
