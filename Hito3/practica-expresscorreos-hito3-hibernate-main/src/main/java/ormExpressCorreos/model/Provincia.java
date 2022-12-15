package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Provincia")
public class Provincia {
    @Id
    @Column(name = "Nombre")
    private String nombre;

    @OneToMany(mappedBy = "Provincia")
    private Set<Municipio> municipios;

    public Provincia(String nombre) {
        this.nombre = nombre;
    }

    public Provincia() {

    }

    public String getNombre() {
        return nombre;
    }
}
