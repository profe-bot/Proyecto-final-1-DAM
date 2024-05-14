/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class UserLogin {
    private int idUsuario;
    private String nombreUsuario;
    private String email;
    private String contrasena;
    private Integer mazosCreados;
    private int idVisitante;
    private int idMazo;

    // Empty Constructor
    public UserLogin() {
        // Empty constructor
    }

    // Full Constructor
    public UserLogin(int idUsuario, String nombreUsuario, String email, String contrasena, Integer mazosCreados, int idVisitante, int idMazo) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.email = email;
        this.contrasena = contrasena;
        this.mazosCreados = mazosCreados;
        this.idVisitante = idVisitante;
        this.idMazo = idMazo;
    }

    // Getters
    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public String getEmail() {
        return email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public Integer getMazosCreados() {
        return mazosCreados;
    }

    public int getIdVisitante() {
        return idVisitante;
    }

    public int getIdMazo() {
        return idMazo;
    }

    // Setters
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public void setMazosCreados(Integer mazosCreados) {
        this.mazosCreados = mazosCreados;
    }

    public void setIdVisitante(int idVisitante) {
        this.idVisitante = idVisitante;
    }

    public void setIdMazo(int idMazo) {
        this.idMazo = idMazo;
    }
}
