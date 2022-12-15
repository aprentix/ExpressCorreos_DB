package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Ruta")
public class Ruta {
    @Id
    @GeneratedValue
    @Column(name = "Id")
    private int matricula;

    public Ruta(int matricula) {
        this.matricula = matricula;
    }

    public Ruta() {

    }

    public int getMatricula() {
        return matricula;
    }
}
