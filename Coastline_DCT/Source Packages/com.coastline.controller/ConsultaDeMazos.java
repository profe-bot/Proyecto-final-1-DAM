/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class ConsultaDeMazos {
    private int idConsultaDeMazo;
    private int idImpresion;
    private int idMazo;

    // Empty constructor
    public ConsultaDeMazos() {
        // Default constructor
    }

    // Full constructor
    public ConsultaDeMazos(int idConsultaDeMazo, int idImpresion, int idMazo) {
        this.idConsultaDeMazo = idConsultaDeMazo;
        this.idImpresion = idImpresion;
        this.idMazo = idMazo;
    }

    // Getters
    public int getIdConsultaDeMazo() {
        return idConsultaDeMazo;
    }

    public int getIdImpresion() {
        return idImpresion;
    }

    public int getIdMazo() {
        return idMazo;
    }

    // Setters
    public void setIdConsultaDeMazo(int idConsultaDeMazo) {
        this.idConsultaDeMazo = idConsultaDeMazo;
    }

    public void setIdImpresion(int idImpresion) {
        this.idImpresion = idImpresion;
    }

    public void setIdMazo(int idMazo) {
        this.idMazo = idMazo;
    }
}
