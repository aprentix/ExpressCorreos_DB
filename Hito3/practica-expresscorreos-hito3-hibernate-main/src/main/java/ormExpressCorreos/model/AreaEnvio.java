package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "AreaDeEnvio")
public class AreaEnvio {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "Nombre")
    private String nombre;

    @ManyToOne()
    @JoinColumn(name = "Oficina")
    private Oficina oficina;

    @ManyToMany()
    @JoinTable(name = "Segmentos de Area")
    private Set<SegmentoCalle> segmentosCalles;

    @ManyToMany(mappedBy = "areaIncluida")
    private Set<AreaEnvio> areaIncluye;

    @ManyToMany()
    @JoinTable(name = "Area incluye area")
    private Set<AreaEnvio> areaIncluida;

    @ManyToMany(mappedBy = "areasEnvios")
    private Set<Cartero> carteros;

    public AreaEnvio(int id, String nombre, Oficina oficina) {
        this.id = id;
        this.nombre = nombre;
        this.oficina = oficina;
    }

    public AreaEnvio() {

    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public Oficina getOficina() {
        return oficina;
    }
}
