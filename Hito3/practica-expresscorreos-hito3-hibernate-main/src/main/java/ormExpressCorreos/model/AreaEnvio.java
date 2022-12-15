package ormExpressCorreos.model;

import javax.persistence.*;

@Entity
@Table(name = "Area Envio")
public class AreaEnvio {
    @Id
    @GeneratedValue
    @Column(name = "Id", nullable = false)
    private int id;

    @Column(name = "Nombre")
    private String nombre;

    @ManyToOne
    @JoinColumn(name = "Oficina")
    private Oficina oficina;

    public AreaEnvio(int id, String nombre, Oficina oficina) {
        this.id = id;
        this.nombre = nombre;
        this.oficina = oficina;
    }

    public AreaEnvio() {

    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public Oficina getOficina() {
        return oficina;
    }
}
