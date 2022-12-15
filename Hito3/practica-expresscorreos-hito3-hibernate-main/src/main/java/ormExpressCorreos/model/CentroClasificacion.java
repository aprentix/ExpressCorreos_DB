package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Centro de Clasificacion")
public class CentroClasificacion {
    @Id
    @GeneratedValue
    @Column(name = "Codigo")
    private int codigo;

    @Column(name = "Nombre", nullable = false, unique = true)
    private String nombre;

    @Column(name = "Capacidad Procesamiento de Paquetes", nullable = false)
    private int capacidadProcesamientoPaquetes;

    @Column(name = "Capacidad Procesamiento de Cartas", nullable = false)
    private int capacidadProcesamientoCartas;

    @ManyToOne
    @JoinColumn(name = "Municipio")
    private Municipio municipio;

    public CentroClasificacion(int codigo, String nombre, int capacidadProcesamientoPaquetes, int capacidadProcesamientoCartas, Municipio municipio) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.capacidadProcesamientoPaquetes = capacidadProcesamientoPaquetes;
        this.capacidadProcesamientoCartas = capacidadProcesamientoCartas;
        this.municipio = municipio;
    }

    public CentroClasificacion() {

    }

    public int getCodigo() {
        return codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public int getCapacidadProcesamientoPaquetes() {
        return capacidadProcesamientoPaquetes;
    }

    public int getCapacidadProcesamientoCartas() {
        return capacidadProcesamientoCartas;
    }

    public Municipio getMunicipio() {
        return municipio;
    }
}
