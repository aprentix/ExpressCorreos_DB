import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import expresscorreos.model.Cartero;
import expresscorreos.model.Oficina;

public class Main {
    /*
    jdbc:mysql://localhost:3306/?user=root
    */
    // @TODO: Sustituya xxxx por los parámetros de su conexión
    private static final String DB_SERVER = "localhost";
    private static final int DB_PORT = 3306;
    private static final String DB_NAME = "correosexpress";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "12345";
    private static Connection conn;
    public static void main(String[] args) throws Exception {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }
        catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        try{
            String url = "jdbc:mysql://" + DB_SERVER + ":" + DB_PORT + "/" + DB_NAME;
            conn = DriverManager.getConnection(url, DB_USER, DB_PASS);
            /*PRUEBAS EJERCICIO 1*/
            System.out.println("//PRUEBAS EJERCICIO 1//");
            nuevoCartero("91102088P", "Claudi-chan", "Preciosa");
            nuevoCartero("06997743Q", "Adrian", "ElGuapo");
            printListaCarteros();
            /*PRUEBAS EJERCICIO 2*/
            System.out.println("//PRUEBAS EJERCICIO 2//");
            List<Cartero> listaCarteros = carterosRepartoCochePeriodo(7);
            printListaCarteros(listaCarteros);
            System.out.println("//PRUEBAS EJERCICIO 3//");
            List<Oficina> listaOficinas = oficinasAsociadasCalle("Paseo de la Castellana");
            printListaOficinas(listaOficinas);
            System.out.println("//PRUEBAS EJERCICIO 4//");
            String s = cochesSinUtilizarPeriodo(30);
            System.out.println(s);
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        // @TODO pruebe sus funciones

        conn.close();
    }

    // @TODO resuelva las siguientes funciones...

    public static void nuevoCartero(String DNI, String nombre, String apellidos) throws SQLException {
        // @TODO: complete este método para que cree un nuevo cartero en la base de datos
        String _DNI = DNI;
        String _nombre = nombre;
        String _apellidos = apellidos;
        try{
            PreparedStatement preparedstmt = conn.prepareStatement("INSERT INTO cartero(dni, nombre, apellido) VALUES (?,?,?)");
            preparedstmt.setString(1, _DNI);
            preparedstmt.setString(2, _nombre);
            preparedstmt.setString(3, _apellidos);
            preparedstmt.executeUpdate();
            preparedstmt.close();
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
    public static void printListaCarteros(){
        try{
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery("Select nombre, apellido, dni from Cartero");
            while(rs.next()){
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String dni = rs.getString("dni");
                System.out.println("nombre: "+ nombre + " apellido: "+ apellido+ " dni: "+ dni);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Cartero> carterosRepartoCochePeriodo(int periodo) {
        List<Cartero> lista  = new ArrayList<Cartero>();
        // @TODO: complete este método para que muestre por pantalla una lista de carteros que han
        // realizado un reparto con coche en el periodo comprendido por los últimos "periodo" días
        // (implementar para periodo=7)
        // Tenga en cuenta que la consulta a la base de datos le devolverá un ResultSet sobre el que deberá
        // ir iterando y creando un objeto con cada Cartero que cumpla con las condiciones,
        // y añadirlos a la lista
        try{
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM cartero \n" +
                    "WHERE cartero.dni IN(\n" +
                    "\tSELECT dni_cartero FROM reparto\n" +
                    "    WHERE matricula <> \"\" AND \n" +
                    "    fecha_creacion < CURDATE() AND fecha_creacion > DATE(DATE_SUB(CURDATE(), INTERVAL ? DAY))\n" +
                    ")"
            );

            preparedStatement.setInt(1,periodo);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String dni = rs.getString("dni");
                Cartero carteroOK = new Cartero(dni, nombre, apellido);
                lista.add(carteroOK);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public static void printListaCarteros(List<Cartero> carteroList){
        for(Cartero cartero: carteroList){
            System.out.println("nombre: "+ cartero.getNombre() + " apellido: "+ cartero.getApellidos()+ " dni: "+ cartero.getDNI());
        }
    }

    public static List<Oficina> oficinasAsociadasCalle(String calle) {
        List<Oficina> lista  = new ArrayList<Oficina>();
        // @TODO: complete este método para que muestre por pantalla una lista de las oficinas que
        // dan servicio a la C/Alcalá de Madrid.
        // Tenga en cuenta que la consulta a la base de datos le devolverá un ResultSet sobre el que deberá
        // ir iterando y creando un objeto con cada Oficina que tenga asociada algún segmento de esa calle,
        // y añadirlos a la lista
        /*OBTENER LAS OFICINAS QUE DAN SERVICIO A UNA CALLE X*/
        try{
            PreparedStatement preparedStatement = conn.prepareStatement(
                    "SELECT oficina.codigo, oficina.codigo_centro_clasificacion, oficina.id_municipio FROM oficina\n" +
                    "INNER JOIN areaenvio ON areaenvio.id_area_envio = oficina.codigo\n" +
                    "INNER JOIN area_envio_incluye_segmento_calle ON areaenvio.id_area_envio = area_envio_incluye_segmento_calle.id_area_envio\n" +
                    "INNER JOIN segmentocalle ON segmentocalle.n_Segmento = area_envio_incluye_segmento_calle.n_Segmento\n" +
                    "INNER JOIN calle ON calle.id_calle = segmentocalle.id_calle\n" +
                    "WHERE calle.nombre like ?;");

            preparedStatement.setString(1,calle);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                int codigo = rs.getInt("codigo");
                int codigo_centro_clasificacion = rs.getInt("codigo_centro_clasificacion");
                int id_municipio = rs.getInt("id_municipio");
                Oficina oficinaOK = new Oficina(codigo, codigo_centro_clasificacion, id_municipio);
                lista.add(oficinaOK);
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public static void printListaOficinas(List<Oficina> oficinaList){
        for(Oficina ofi: oficinaList){
            System.out.println("codigo: "+ ofi.getCodigo() + " id_municipio: "+ ofi.getId_municipio()+ " codigo_centro_clasificacion: "+ ofi.getCodigo_centro_clasificacion());
        }
    }

    public static String cochesSinUtilizarPeriodo(int periodo) {
        String lista = "";
        // @TODO: complete este método para que muestre por pantalla una lista de los coches que no se han
        // utilizado en los últimos "periodo" días (implementar para periodo=30)
        try{
            PreparedStatement preparedStatement = conn.prepareStatement(
                    "SELECT DISTINCT matricula FROM reparto \n" +
                        "WHERE matricula NOT IN(\n" +
                        "\tSELECT matricula FROM reparto \n" +
                        "\tWHERE matricula <> \"\" AND \n" +
                        "\tfecha_creacion < CURDATE() AND fecha_creacion > DATE(DATE_SUB(CURDATE(), INTERVAL ? DAY))\n" +
                        ");"
            );

            preparedStatement.setInt(1,periodo);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                lista+=(rs.getString("matricula")+"\n");
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

}
