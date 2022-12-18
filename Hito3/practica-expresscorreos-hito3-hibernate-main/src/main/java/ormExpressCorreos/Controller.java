package ormExpressCorreos;

import ormExpressCorreos.model.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.sql.*;

/**
 * Controlador de la aplicación. Por favor, revise detenidamente la clase y complete las partes omitidas
 * atendiendo a los comentarios indicados mediante @TODO
 */
public class Controller {

    private Session session;

    /**
     * Crea un nuevo controlador
     */
    public Controller () {

        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();

        SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();

        this.session = sessionFactory.openSession();
    }

    /**
     * Crea un nuevo usuario_generico
     * param id id del usuario
     * param nombre nombre del usuario
     * param apellidos apellidos del usuario
     * @return el nuevo usuario creado
     * @throws SQLException
     */
    public UsuarioGenerico createUsuarioGenerico(String nombre, String apellidos, Direccion direccion) throws SQLException{
        // @TODO completa este metodo para crear de forma presistente un usuario genérico
        session.beginTransaction();
        UsuarioGenerico usuarioGenerico = new UsuarioGenerico(nombre, apellidos, direccion);
        session.save(usuarioGenerico);
        session.getTransaction().commit();
        return usuarioGenerico;
    }

    public UsuarioIdentificado createUsuarioIdentificado(String DNI, String nombre, String apellidos, String email) throws SQLException {
        // @TODO completa este metodo para crear de forma presistente un usuario identificado
        session.beginTransaction();
        UsuarioIdentificado usuarioIdentificado = new UsuarioIdentificado(DNI, nombre, apellidos, email);
        session.save(usuarioIdentificado);
        session.getTransaction().commit();
        return usuarioIdentificado;
    }

    public Direccion createDireccion(int numero, String piso, char letra, int portal, String _provincia, String _municipio, String _calle) throws SQLException {
        // @TODO completa este metodo para crear de forma presistente una direccion
        session.beginTransaction();
        Provincia provincia = new Provincia(_provincia);
        Municipio municipio = new Municipio(_municipio, provincia); // String nombre, Provincia provincia
        Calle calle = new Calle(_calle, municipio); // String nombre, Municipio municipio
        Direccion direccion = new Direccion(numero, piso, letra, portal, calle);
        session.save(provincia);
        session.save(municipio);
        session.save(calle);
        session.save(direccion);
        session.getTransaction().commit();
        return direccion;
    }

}
