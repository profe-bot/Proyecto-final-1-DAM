/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class ImpresionDeRegistro {
    private int idImpresion;
    private int idConsultaDeRegistro;

    // Empty constructor
    public ImpresionDeRegistro() {
        // Default constructor
    }

    // Full constructor
    public ImpresionDeRegistro(int idImpresion, int idConsultaDeRegistro) {
        this.idImpresion = idImpresion;
        this.idConsultaDeRegistro = idConsultaDeRegistro;
    }

    // Getters and setters
    public int getIdImpresion() {
        return idImpresion;
    }

    public void setIdImpresion(int idImpresion) {
        this.idImpresion = idImpresion;
    }

    public int getIdConsultaDeRegistro() {
        return idConsultaDeRegistro;
    }

    public void setIdConsultaDeRegistro(int idConsultaDeRegistro) {
        this.idConsultaDeRegistro = idConsultaDeRegistro;
    }
}
