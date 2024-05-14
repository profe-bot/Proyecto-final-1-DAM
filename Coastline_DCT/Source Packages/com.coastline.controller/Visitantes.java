/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author cerrchus
 */
public class Visitantes {
    
    public int idVisitante;
    public Date fecha;
    public Float pantallaAspecto;
    public Time tiempoLocale;
    
    public Visitantes(){}
    
    public Visitantes(int idVisitante, Date fecha, Float pantallaAspecto, Time tiempoLocale){
        this.idVisitante=idVisitante;
        this.fecha=fecha;
        this.pantallaAspecto=pantallaAspecto;
        this.tiempoLocale=tiempoLocale;
    }
    
    public int getIdVisitante(){
        return idVisitante;
    }
    public void setIdVistante(int idVisitante){
        this.idVisitante=idVisitante;
    }
    
    public Date getFecha(){
        return fecha;
    }
    public void setFecha(Date fecha){
        this.fecha=fecha;
    }
    
    public Float getPantallaAspecto(){
        return pantallaAspecto;
    }
    public void setPantallaAspecto(Float pantallaAspecto){
        this.pantallaAspecto=pantallaAspecto;
    }
    
    public Time getTiempoLocale(){
        return tiempoLocale;
    }
    public void setTiempoLocale(Time tiempoLocale){
        this.tiempoLocale=tiempoLocale;
    }
    
}
