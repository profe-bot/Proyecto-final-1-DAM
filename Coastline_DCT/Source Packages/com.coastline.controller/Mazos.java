/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class Mazos {
    private int idMazo;
    private String mazoNombre;
    private int cartasTotales; 
    
    // Empty constructor
    public Mazos() {
    }

    // Full constructor
    public Mazos(int idMazo, String mazoNombre, int cartasTotales) {
        this.idMazo = idMazo;
        this.mazoNombre = mazoNombre;
        this.cartasTotales = cartasTotales;
    }

    // Getters and setters
    public int getIdMazo() {
        return idMazo;
    }

    public void setIdMazo(int idMazo) {
        this.idMazo = idMazo;
    }


    public String getMazoNombre() {
        return mazoNombre;
    }

    public void setMazoNombre(String mazoNombre) {
        this.mazoNombre = mazoNombre;
    }

    public int getCartasTotales() {
        return cartasTotales;
    }

    public void setCartasTotales(int cartasTotales) {
        this.cartasTotales = cartasTotales;
    }
}
