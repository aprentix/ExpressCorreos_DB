package ormExpressCorreos.model;
import javax.persistence.*;

@Entity
@Table(name = "Direccion")
public class Direccion {
    @Id
    @GeneratedValue
    @Column(name = "Id")
    private int id;

    @Column(name = "Numero")
    private int numero;

    @Column(name = "Piso")
    private String piso;

    @Column(name = "Letra")
    private char letra;

    @Column(name = "Portal")
    private int portal;

    @ManyToOne
    @JoinColumn(name="Calle")
    private Calle calle;
}
