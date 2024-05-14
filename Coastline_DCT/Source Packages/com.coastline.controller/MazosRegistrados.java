/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class MazosRegistrados {
    private int idMazo;
    private int idPartida;

    // Empty Constructor
    public MazosRegistrados() {
    }

    // Full Constructor
    public MazosRegistrados(int idMazo, int idPartida) {
        this.idMazo = idMazo;
        this.idPartida = idPartida;
    }

    // Getters
    public int getIdMazo() {
        return idMazo;
    }

    public int getIdPartida() {
        return idPartida;
    }

    // Setters
    public void setIdMazo(int idMazo) {
        this.idMazo = idMazo;
    }

    public void setIdPartida(int idPartida) {
        this.idPartida = idPartida;
    }
}
