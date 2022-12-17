package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Ruta")
public class Ruta {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Id")
    private int matricula;

    @OneToMany(mappedBy = "ruta")
    private Set<Reparto> repartos;

    @ManyToMany
    @JoinTable(name = "Segmentos de Rutas")
    private Set<SegmentoCalle> segmentosCalles;


    public Ruta(int matricula) {
        this.matricula = matricula;
    }

    public Ruta() {

    }

    public int getMatricula() {
        return matricula;
    }
}
