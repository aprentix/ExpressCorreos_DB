package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Turno")
public class Turno {
    @Id
    @GeneratedValue
    @Column(name = "Jornada")
    private String jornada;

    @Column(name = "Horario", nullable = false)
    private String Horario;

    public Turno(String jornada, String horario) {
        this.jornada = jornada;
        Horario = horario;
    }

    public Turno() {

    }

    public String getJornada() {
        return jornada;
    }

    public String getHorario() {
        return Horario;
    }
}
