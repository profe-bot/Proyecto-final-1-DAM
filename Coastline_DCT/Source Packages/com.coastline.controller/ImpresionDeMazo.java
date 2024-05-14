/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class ImpresionDeMazo {
    private int idImpresion;
    private int idConsultaDeMazo;

    // Empty constructor
    public ImpresionDeMazo() {
        // Empty constructor
    }

    // Full constructor
    public ImpresionDeMazo(int idImpresion, int idConsultaDeMazo) {
        this.idImpresion = idImpresion;
        this.idConsultaDeMazo = idConsultaDeMazo;
    }

    // Getters
    public int getIdImpresion() {
        return idImpresion;
    }

    public int getIdConsultaDeMazo() {
        return idConsultaDeMazo;
    }

    // Setters
    public void setIdImpresion(int idImpresion) {
        this.idImpresion = idImpresion;
    }

    public void setIdConsultaDeMazo(int idConsultaDeMazo) {
        this.idConsultaDeMazo = idConsultaDeMazo;
    }
}
