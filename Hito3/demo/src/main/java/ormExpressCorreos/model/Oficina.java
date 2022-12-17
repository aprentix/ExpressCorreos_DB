package ormExpressCorreos.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Oficina")
public class Oficina {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "Codigo")
    private int codigo;

    @ManyToOne
    @JoinColumn(name = "Centro de Clasificacion")
    private CentroClasificacion centroClasificacion;

    @ManyToOne
    @JoinColumn(name = "Municipio")
    private Municipio municipio;

    @OneToMany(mappedBy = "oficina")
    private Set<AreaEnvio> areaEnvios;

    @OneToMany(mappedBy = "oficina")
    private Set<Coche> coches;


    public Oficina(CentroClasificacion centroClasificacion, Municipio municipio) {
        this.centroClasificacion = centroClasificacion;
        this.municipio = municipio;
    }

    public Oficina() {

    }

    public int getCodigo() {
        return codigo;
    }

    public CentroClasificacion getCentroClasificacion() {
        return centroClasificacion;
    }

    public Municipio getMunicipio() {
        return municipio;
    }
}
