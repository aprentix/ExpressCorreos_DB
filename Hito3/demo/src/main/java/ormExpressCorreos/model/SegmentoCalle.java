package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Segmento de Calle")
public class SegmentoCalle {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "Nº Inicio", nullable = false)
    private int nInicio;

    @Column(name = "Nº Final", nullable = false)
    private int nFinal;

    @ManyToOne(optional = false)
    @JoinColumn(name = "Calle")
    private Calle calle;

    @ManyToMany(mappedBy = "segmentosCalles")
    private Set<AreaEnvio> areasEnvios;

    @ManyToMany(mappedBy = "segmentosCalles")
    private Set<Ruta> rutas;

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
