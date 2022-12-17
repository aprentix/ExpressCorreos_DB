import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.Service;
import org.hibernate.service.ServiceRegistry;
import ormExpressCorreos.Controller;
import ormExpressCorreos.model.*;

import java.sql.SQLException;

public class Main {

    public static void main (String [] args) {
        try {
            Controller controlador= new Controller();
            // @TODO añada las llamadas a las funciones de la clase Controller.java necesarias
            UsuarioIdentificado usuarioIdentificado = controlador.createUsuarioIdentificado("X6327497J", "Rosa", "Ramirez", "rosram@gmail.com");
            Provincia provincia = new Provincia("Madrid");
            Municipio municipio = new Municipio("Madrid", provincia); // String nombre, Provincia provincia
            Calle calle = new Calle("Guzmán el Bueno", municipio); // String nombre, Municipio municipio
            Direccion direccion = controlador.createDireccion(21, "BJ", 'A', 4, calle);
            if(usuarioIdentificado != null && direccion != null) {
                usuarioIdentificado.getDirecciones().add(direccion);
                direccion.getUsuariosIdentificados().add(usuarioIdentificado);
                controlador.getSession().beginTransaction();
                controlador.getSession().save(usuarioIdentificado);
                controlador.getSession().save(provincia);
                controlador.getSession().save(municipio);
                controlador.getSession().save(calle);
                controlador.getSession().save(direccion);
                controlador.getSession().getTransaction().commit();
                System.out.println("Se ha creado el usuario identificado " + usuarioIdentificado.getNombre() + " con DNI "
                        + usuarioIdentificado.getDni() + " que vive en " + direccion.getDireccionCompleta());
            }

        } catch(SQLException e) {
            System.err.println("Se ha producido un error en la conexión con la base de datos");
            e.printStackTrace();
        }
    }
}

// para la creación del usuario identificado y la direccion.
            /*
            String dni, String nombre, String apellidos, String correoElectronico, UsuarioIdentificado usuarioAutorizado
            int numero, String piso, char letra, int portal, Calle calle

            DNI: "X6327497J", "90420076S", "44545436W", "88004049T"

            DNI_UI_EXISTENTES: "06456679G" "69895509G" "76784988V" "91195150N" "98493233B"

            NOMBRE: "Rosa", "Francis", "Rosaura", "Petra"

            APELLIDOS: "Ramirez", "Llorente", "Sanchez", "García"

            EMAIL: "rosram@gmail.com", "francisLlorente@gmail.com", "rosauraSanchez@gmail.com", "petraGarcia@gmail.com"
            */