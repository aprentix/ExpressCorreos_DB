package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Calle")
public class Calle {
    @Id
    @GeneratedValue
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "Nombre", nullable = false)
    private String nombre;

    @ManyToOne
    @JoinColumn(name = "Municipio")
    private Municipio municipio;

    @OneToMany(mappedBy = "calle")
    private Set<SegmentoCalle> segmentos;

    @OneToMany(mappedBy = "calle")
    private Set<Direccion> direcciones;

    public Calle(int id, String nombre, Municipio municipio) {
        this.id = id;
        this.nombre = nombre;
        this.municipio = municipio;
    }

    public Calle() {

    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public Municipio getMunicipio() {
        return municipio;
    }
}
