package ormExpressCorreos.model;
import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Direccion")
public class Direccion {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
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
    private Set<UsuarioGenerico> usuarioGenericos = new HashSet<UsuarioGenerico>();

    @OneToMany(mappedBy = "direccion")
    private Set<Recogida> recogidas = new HashSet<Recogida>();

    @ManyToMany(mappedBy = "direcciones")
    private Set<UsuarioIdentificado> usuariosIdentificados = new HashSet<UsuarioIdentificado>();

    public Direccion(int numero, String piso, char letra, int portal, Calle calle) {
        this.numero = numero;
        this.piso = piso;
        this.letra = letra;
        this.portal = portal;
        this.calle = calle;
    }

    public Direccion() {

    }

    public String getDireccionCompleta(){
        return this.calle+", "+this.numero+", "+
                this.portal+ ", "+ this.letra+ ", "+
                this.calle.getNombre() + ", "+
                this.calle.getMunicipio().getNombre();
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

    public Set<UsuarioGenerico> getUsuarioGenericos() {
        return usuarioGenericos;
    }

    public Set<Recogida> getRecogidas() {
        return recogidas;
    }

    public Set<UsuarioIdentificado> getUsuariosIdentificados() {
        return usuariosIdentificados;
    }
}
