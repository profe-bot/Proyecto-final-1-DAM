/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;


import java.sql.Time;
/**
 *
 * @author cerrchus
 */
public class Busquedas {
    
    public int idBusqueda;
    public String detallesBuscada;
    public Time horaBuscada;
    
    public Busquedas(){}
    
    public Busquedas(int idBusqueda, String detallesBuscada, Time horaBuscada){
        this.idBusqueda = idBusqueda;
        this.detallesBuscada = detallesBuscada;
        this.horaBuscada = horaBuscada;
    }
    
    public int getIdBusqueda(){
        return idBusqueda;
    }
    public void setIdBusqueda(int idBusqueda){
        this.idBusqueda = idBusqueda;
    }
    
    public String getDetallesBuscada(){
        return detallesBuscada;
    }
    public void setDetallesBuscada(String detallesBuscada){
        this.detallesBuscada=detallesBuscada;
    }
    
    public Time gethoraBuscada(){
        return horaBuscada;
    }
    public void setHoraBuscada(Time horaBuscada){
        this.horaBuscada=horaBuscada;
    }
    
}
