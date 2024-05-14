/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Coastline.user;

/**
 *
 * @author cerrchus
 */
public class UserRegister {
    private int idRegUsuario;
    private int idVisitante;
    private String email;
    private String contrasena;
    private String firstname;
    private String lastname;
    private String nombreUsuario;

    // Empty Constructor
    public UserRegister() {
    }

    // Full Constructor
    public UserRegister(int idRegUsuario, int idVisitante, String email, String contrasena,
                        String firstname, String lastname, String nombreUsuario) {
        this.idRegUsuario = idRegUsuario;
        this.idVisitante = idVisitante;
        this.email = email;
        this.contrasena = contrasena;
        this.firstname = firstname;
        this.lastname = lastname;
        this.nombreUsuario = nombreUsuario;
    }

    // Getters
    public int getIdRegUsuario() {
        return idRegUsuario;
    }

    public int getIdVisitante() {
        return idVisitante;
    }

    public String getEmail() {
        return email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    // Setters
    public void setIdRegUsuario(int idRegUsuario) {
        this.idRegUsuario = idRegUsuario;
    }

    public void setIdVisitante(int idVisitante) {
        this.idVisitante = idVisitante;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
}