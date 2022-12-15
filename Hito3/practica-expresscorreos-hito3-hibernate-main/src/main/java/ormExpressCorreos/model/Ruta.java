package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Ruta")
public class Ruta {
    @Id
    @GeneratedValue
    @Column(name = "Id")
    private int matricula;

    @OneToMany(mappedBy = "Ruta")
    private Set<Reparto> repartos;

    public Ruta(int matricula) {
        this.matricula = matricula;
    }

    public Ruta() {

    }

    public int getMatricula() {
        return matricula;
    }
}
