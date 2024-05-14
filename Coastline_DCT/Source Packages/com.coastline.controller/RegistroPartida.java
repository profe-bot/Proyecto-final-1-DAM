/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coastline.controller;

/**
 *
 * @author cerrchus
 */
public class RegistroPartida {
    private int idPartida;
    private Integer contadorJugador;
    private Integer contadorTurno;
    private int idUsuario;

    // Empty constructor
    public RegistroPartida() {
    }

    // Full constructor
    public RegistroPartida(int idPartida, Integer contadorJugador, Integer contadorTurno, int idUsuario) {
        this.idPartida = idPartida;
        this.contadorJugador = contadorJugador;
        this.contadorTurno = contadorTurno;
        this.idUsuario = idUsuario;
    }

    // Getters and setters
    public int getIdPartida() {
        return idPartida;
    }

    public void setIdPartida(int idPartida) {
        this.idPartida = idPartida;
    }

    public Integer getContadorJugador() {
        return contadorJugador;
    }

    public void setContadorJugador(Integer contadorJugador) {
        this.contadorJugador = contadorJugador;
    }

    public Integer getContadorTurno() {
        return contadorTurno;
    }

    public void setContadorTurno(Integer contadorTurno) {
        this.contadorTurno = contadorTurno;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
