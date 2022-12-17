package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Coche")
public class Coche {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Matricula")
    private int matricula;

    @Column(name = "Capacidad", nullable = false)
    private double capacidad;

    @ManyToOne
    @JoinColumn(name = "Oficina")
    private Oficina oficina;

    @OneToMany(mappedBy = "coche")
    private Set<Reparto> repartos;

    public Coche(int matricula, double capacidad, Oficina oficina) {
        this.matricula = matricula;
        this.capacidad = capacidad;
        this.oficina = oficina;
    }

    public Coche() {

    }

    public int getMatricula() {
        return matricula;
    }

    public double getCapacidad() {
        return capacidad;
    }

    public Oficina getOficina() {
        return oficina;
    }
}
