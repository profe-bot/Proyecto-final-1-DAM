/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class Impresiones {
    private int idImpresion;
    private int idUsuario;
    private String detallesDeImpresion;

    // Empty constructor
    public Impresiones() {
    }

    // Full constructor
    public Impresiones(int idImpresion, int idUsuario, String detallesDeImpresion) {
        this.idImpresion = idImpresion;
        this.idUsuario = idUsuario;
        this.detallesDeImpresion = detallesDeImpresion;
    }

    // Getters
    public int getIdImpresion() {
        return idImpresion;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getDetallesDeImpresion() {
        return detallesDeImpresion;
    }

    // Setters
    public void setIdImpresion(int idImpresion) {
        this.idImpresion = idImpresion;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setDetallesDeImpresion(String detallesDeImpresion) {
        this.detallesDeImpresion = detallesDeImpresion;
    }
}
