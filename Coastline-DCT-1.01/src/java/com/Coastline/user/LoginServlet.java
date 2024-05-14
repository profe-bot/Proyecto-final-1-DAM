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

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String username = request.getParameter("username");
        String contrasena = request.getParameter("password");
        HttpSession session = request.getSession();
        
        RequestDispatcher dispatcher = null;
        PreparedStatement pst = null;
        Connection conn = null;
        ResultSet rs = null;
        
        try{
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
            }catch(ClassNotFoundException ex){
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coastline_DCT?useSSL=false","root","PaleMoonlight...");
            pst = conn.prepareStatement("SELECT * FROM usuarios WHERE nombre_usuario = ? AND contrasena = ?");
            
            pst.setString(1, username);
            pst.setString(2, contrasena);
            
            rs = pst.executeQuery();
            if (rs.next()){
                session.setAttribute("username", rs.getString("nombre_usuario"));
                dispatcher = request.getRequestDispatcher("index.jsp");
            }
            else{
                request.setAttribute("status","failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
            dispatcher.forward(request, response);
            
        }catch(Exception e){
            e.printStackTrace();
        } finally{
            
            try{
                conn.close();
            }catch(SQLException e){}
            
            try{
                pst.close();
            }catch(Exception e2){}
            
            try{
                rs.close();
            }catch(Exception e3){}
        }
    }
}
