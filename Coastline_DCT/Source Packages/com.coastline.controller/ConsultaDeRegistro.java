/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class ConsultaDeRegistro {
    private int idConsultaDeRegistro;
    private int idImpresion;
    private int idPartida;

    // Empty constructor
    public ConsultaDeRegistro() {
        // Default constructor
    }

    // Full constructor
    public ConsultaDeRegistro(int idConsultaDeRegistro, int idImpresion, int idPartida) {
        this.idConsultaDeRegistro = idConsultaDeRegistro;
        this.idImpresion = idImpresion;
        this.idPartida = idPartida;
    }

    // Getters
    public int getIdConsultaDeRegistro() {
        return idConsultaDeRegistro;
    }

    public int getIdImpresion() {
        return idImpresion;
    }

    public int getIdPartida() {
        return idPartida;
    }

    // Setters
    public void setIdConsultaDeRegistro(int idConsultaDeRegistro) {
        this.idConsultaDeRegistro = idConsultaDeRegistro;
    }

    public void setIdImpresion(int idImpresion) {
        this.idImpresion = idImpresion;
    }

    public void setIdPartida(int idPartida) {
        this.idPartida = idPartida;
    }
}
