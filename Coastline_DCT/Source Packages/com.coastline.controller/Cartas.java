//CHECK CARTASENMAZOS.JAVA 

//editing is required

public class Carta {
    private int idCarta;
    private Integer coste;
    private String costeCultural;
    private String supertipo;
    private String textoReglas;
    private String poderResiliencia;
    private String set;
    private int idBusqueda;
    private String identidadCultural;
    private String nombre;
    
    // Empty constructor
    public Carta() {
        // Empty constructor
    }
    
    // Full constructor
    public Carta(int idCarta, Integer coste, String costeCultural, String supertipo, String textoReglas,
                 String poderResiliencia, String set, int idBusqueda, String identidadCultural, String nombre) {
        this.idCarta = idCarta;
        this.coste = coste;
        this.costeCultural = costeCultural;
        this.supertipo = supertipo;
        this.textoReglas = textoReglas;
        this.poderResiliencia = poderResiliencia;
        this.set = set;
        this.idBusqueda = idBusqueda;
        this.identidadCultural = identidadCultural;
        this.nombre = nombre;
    }
    
    // Getters
    public int getIdCarta() {
        return idCarta;
    }

    public Integer getCoste() {
        return coste;
    }

    public String getCosteCultural() {
        return costeCultural;
    }

    public String getSupertipo() {
        return supertipo;
    }

    public String getTextoReglas() {
        return textoReglas;
    }

    public String getPoderResiliencia() {
        return poderResiliencia;
    }

    public String getSet() {
        return set;
    }

    public int getIdBusqueda() {
        return idBusqueda;
    }

    public String getIdentidadCultural() {
        return identidadCultural;
    }

    public String getNombre() {
        return nombre;
    }

    // Setters
    public void setIdCarta(int idCarta) {
        this.idCarta = idCarta;
    }

    public void setCoste(Integer coste) {
        this.coste = coste;
    }

    public void setCosteCultural(String costeCultural) {
        this.costeCultural = costeCultural;
    }

    public void setSupertipo(String supertipo) {
        this.supertipo = supertipo;
    }

    public void setTextoReglas(String textoReglas) {
        this.textoReglas = textoReglas;
    }

    public void setPoderResiliencia(String poderResiliencia) {
        this.poderResiliencia = poderResiliencia;
    }

    public void setSet(String set) {
        this.set = set;
    }

    public void setIdBusqueda(int idBusqueda) {
        this.idBusqueda = idBusqueda;
    }

    public void setIdentidadCultural(String identidadCultural) {
        this.identidadCultural = identidadCultural;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
