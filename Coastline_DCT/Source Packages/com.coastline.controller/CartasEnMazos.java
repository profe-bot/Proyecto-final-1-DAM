/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */

//this Class has an issue, it contains only one card per mazo

//solution, there needs to be 100 card inserts and be effectively default null
//problem. cartas are passed as foreign keys, so they are default not null
//solution, you can make an id_carta that points to the table and another column that is not id_carta but refers to the incrementation of the cards, 
//so the id_carta1 is 1 across all rows, but id_carta2 is an incrememnted value
public class CartasEnMazos {
    private int idMazo;
    private int idCarta;

    // Empty constructor
    public CartasEnMazos() {
    }

    // Full constructor
    public CartasEnMazos(int idMazo, int idCarta) {
        this.idMazo = idMazo;
        this.idCarta = idCarta;
    }

    // Getters
    public int getIdMazo() {
        return idMazo;
    }

    public int getIdCarta() {
        return idCarta;
    }

    // Setters
    public void setIdMazo(int idMazo) {
        this.idMazo = idMazo;
    }

    public void setIdCarta(int idCarta) {
        this.idCarta = idCarta;
    }
}
