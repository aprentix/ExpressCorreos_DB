package expresscorreos.model;

public class Oficina {
    private int codigo;
    private int codigo_centro_clasificacion;
    private int id_municipio;

    public Oficina(int codigo, int codigo_centro_clasificacion, int id_municipio){
        this.codigo = codigo;
        this.codigo_centro_clasificacion = codigo_centro_clasificacion;
        this.id_municipio = id_municipio;
    }

    public int getCodigo() {
        return codigo;
    }

    public int getCodigo_centro_clasificacion() {
        return codigo_centro_clasificacion;
    }

    public int getId_municipio() {
        return id_municipio;
    }

}
