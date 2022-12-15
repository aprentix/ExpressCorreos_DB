import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.service.Service;
import org.hibernate.service.ServiceRegistry;
import ormExpressCorreos.Controller;
import ormExpressCorreos.model.Direccion;
import ormExpressCorreos.model.UsuarioIdentificado;

import java.sql.SQLException;

public class Main {

    public static void main (String [] args) {
        try {
            Controller controlador= new Controller();

            // @TODO añada las llamadas a las funciones de la clase Controller.java necesarias
            // para la creación del usuario identificado y la direccion.
            /*
            DNI: "X6327497J", "90420076S", "44545436W", "88004049T"

            DNI_UI_EXISTENTES: "06456679G" "69895509G" "76784988V" "91195150N" "98493233B"

            NOMBRE: "Rosa", "Francis", "Rosaura", "Petra"

            APELLIDOS: "Ramirez", "Llorente", "Sanchez", "García"

            EMAIL: "rosram@gmail.com", "francisLlorente@gmail.com", "rosauraSanchez@gmail.com", "petraGarcia@gmail.com"
            */
            UsuarioIdentificado usuarioIdentificado = new UsuarioIdentificado("X6327497J", "Rosa", "Ramirez", "rosram@gmail.com");
            Direccion direccion = new Direccion(2, "BA", "A", 4, 3); /*Poner id_direccion autoincrementable*/
            /*PONER AL USUARIO EN LA DIRECCION E INCORPORAR AL USUARIO EN DICHA DIRECCION*/
            if(usuarioIdentificado != null && direccion != null) {
                System.out.println("Se ha creado el usuario identificado " + usuarioIdentificado.getNombre() + " con DNI "
                        + usuarioIdentificado.getDNI() + " que vive en " + direccion.getDireccionCompleta());
            }

        } catch(SQLException e) {
            System.err.println("Se ha producido un error en la conexión con la base de datos");
            e.printStackTrace();
        }
    }
}
