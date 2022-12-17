package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Calle")
public class Calle {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
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

    public Calle(String nombre, Municipio municipio) {
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
