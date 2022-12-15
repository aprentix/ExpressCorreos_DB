package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Oficina")
public class Oficina {
    @Id
    @GeneratedValue
    @Column(name = "Codigo")
    private int codigo;

    @ManyToOne
    @JoinColumn(name = "Centro de Clasificacion")
    private CentroClasificacion centroClasificacion;

    @ManyToOne
    @JoinColumn(name = "Municipio")
    private Municipio municipio;


    public Oficina(int codigo, CentroClasificacion centroClasificacion, Municipio municipio) {
        this.codigo = codigo;
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
