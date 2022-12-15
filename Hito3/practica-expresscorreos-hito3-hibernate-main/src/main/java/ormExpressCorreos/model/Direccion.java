package ormExpressCorreos.model;
import javax.persistence.*;

@Entity
@Table(name = "Direccion")
public class Direccion {
    // @TODO completar las anotaciones de todos los atributos

    @Id
    @GeneratedValue
    @Column(name = "Id", nullable = false)
    private Integer id;

    @Column(name = "Numero")
    private Integer numero;

    @Column(name = "Piso")
    private String piso;

    @Column(name = "Letra")
    private String letra;

    @Column(name = "Portal")
    private Integer portal;

    @ManyToOne
    @JoinColumn(name="Id_calle")
    private Calle id_calle;


    public Direccion(Integer id, Integer numero, Integer piso, String letra, String portal, Calle id_calle, Integer id1, Integer numero1, String piso1, String letra1, Integer portal1, Calle id_calle1) {  // @TODO: completar
        // @TODO completar el constructor de la clase.
        //  Para ello son necesarios dos enteros con el número y el piso, y dos strings
        // con la letra y el portal
        //  Cree e inicialice el resto de atributos a los valores que considere oportunos
        this.id = id1;
        this.numero = numero1;
        this.piso = piso1;
        this.letra = letra1;
        this.portal = portal1;
        this.id_calle = id_calle1;
    }

    public Direccion() {

    }

    public Integer getNumero() {
        return this.numero;
    }

    public Integer getPiso() {
        return this.piso;
    }

    public String getLetra() {
        return this.letra;
    }

    public String getPortal() {
        return this.portal;
    }

    public String getDireccionCompleta() {
        // @TODO completar para que devuelva la dirección completa de un usuario
        return direccionCompleta;
    }
}
