package ormExpressCorreos.model;
import javax.persistence.*;
import java.util.Set;

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

    @OneToMany(mappedBy = "direccion")
    private Set<UsuarioGenerico> usuarioGenericos;

    @OneToMany(mappedBy = "direccion")
    private Set<Recogida> recogidas;

    @ManyToMany(mappedBy = "direcciones")
    private Set<UsuarioIdentificado> usuariosIdentificados;

    public Direccion(int id, int numero, String piso, char letra, int portal, Calle calle) {
        this.id = id;
        this.numero = numero;
        this.piso = piso;
        this.letra = letra;
        this.portal = portal;
        this.calle = calle;
    }

    public Direccion() {

    }

    public int getId() {
        return id;
    }

    public int getNumero() {
        return numero;
    }

    public String getPiso() {
        return piso;
    }

    public char getLetra() {
        return letra;
    }

    public int getPortal() {
        return portal;
    }

    public Calle getCalle() {
        return calle;
    }
}
