/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Coastline.user;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;

import java.io.PrintWriter;
import java.io.IOException;

import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author cerrchus
 */

@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet {
       private static final long serialVersionUID = 1L;
       
       protected void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException{
        HttpSession session = null;
        session = request.getSession();
        session.invalidate();
        response.sendRedirect("login.jsp");
       }
}
