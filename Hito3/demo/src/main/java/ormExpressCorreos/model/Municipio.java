package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Municipio")
public class Municipio {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Id")
    private int id;

    @Column(name = "Nombre", nullable = false, unique = true)
    private String nombre;

    @ManyToOne
    @JoinColumn(name = "Provincia")
    private Provincia provincia;

    @OneToMany(mappedBy = "municipio")
    private Set<Calle> calles;

    @OneToMany(mappedBy = "municipio")
    private Set<CentroClasificacion> centrosClasificacion;

    @OneToMany(mappedBy = "municipio")
    private Set<Oficina> oficinas;

    public Municipio(String nombre, Provincia provincia) {
        this.nombre = nombre;
        this.provincia = provincia;
    }

    public Municipio() {

    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public Provincia getProvincia() {
        return provincia;
    }
}
