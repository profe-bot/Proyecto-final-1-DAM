/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class HistoriaDeBusquedas {
    
    public int idHB;
    public int idBusqueda;
    public String detallesBuscada;
    
    public HistoriaDeBusquedas(){}
    
    public HistoriaDeBusquedas(int idHB, int idBusqueda, String detallesBusada){
        this.idHB=idHB;
        this.idBusqueda=idBusqueda;
        this.detallesBuscada=detallesBuscada;
    }
    
    public int getIdHB(){
        return idHB;
    }
    public void setIdHB(int idHB){
        this.idHB=idHB;
    }
    
    public int getIdBusqueda(){
        return idHB;
    }
    public void setIDBusqueda(){
        this.idBusqueda=idBusqueda;
    }
    
    public String getDetallesBuscadas(){
        return detallesBuscada;
    }
    public void setDetallesBuscada(String detallesBuscada){
        this.detallesBuscada=detallesBuscada;
    }
}
