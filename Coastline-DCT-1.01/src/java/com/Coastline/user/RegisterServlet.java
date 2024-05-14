package com.Coastline.user;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import java.sql.ResultSet;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String uemail = request.getParameter("email");
        String username = request.getParameter("username");
        String upasswd = request.getParameter("password");
        int mazosCreados= 0;
        int idVisitante = 0;
        
        RequestDispatcher dispatcher = null;
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coastline_DCT","root","PaleMoonlight...");
            // Query to fetch the next available ID from visitantes table
            pst = conn.prepareStatement("SELECT MAX(id_visitante) AS max_id FROM visitantes");
            rs = pst.executeQuery();

            if (rs.next()) {
                idVisitante = rs.getInt("max_id");
            }
            
            // Insert into usuarios table using the fetched idVisitante
            pst = conn.prepareStatement("INSERT INTO usuarios (nombre_usuario, email, contrasena, firstname, lastname, mazos_creados, id_visitante) VALUES (?, ?, ?, ?, ?, ?, ?)");
            
            pst.setString(1, username);
            pst.setString(2, uemail);
            pst.setString(3, upasswd);
            pst.setString(4, fname);
            pst.setString(5, lname);
            pst.setInt(6, mazosCreados);
            pst.setInt(7, idVisitante);

            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("registration.jsp");
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try{
                conn.close();
            }catch(SQLException e){}
        }
    }
}


//package com.Coastline.user;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import javax.sql.DataSource;
//
//@WebServlet("/register")
//public class RegisterServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    // Inject the DataSource using resource annotation
//    @Resource(name = "jdbc/Coastline_DCT")
//    private DataSource dataSource;
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String fname = request.getParameter("fname");
//        String lname = request.getParameter("lname");
//        String uemail = request.getParameter("email");
//        String username = request.getParameter("username");
//        String upasswd = request.getParameter("password");
//        int mazosCreados= 0;
//
//        try {
//            Connection conn = dataSource.getConnection();
//            PreparedStatement pst = conn.prepareStatement("INSERT INTO usuarios (nombre_usuario, email, contrasena, firstname, lastname, mazos_creados) VALUES (?, ?, ?, ?, ?, ?)");
//            
//            pst.setString(1, username);
//            pst.setString(2, uemail);
//            pst.setString(3, upasswd);
//            pst.setString(4, fname);
//            pst.setString(5, lname);
//            pst.setInt(6, mazosCreados);
//
//            int rowCount = pst.executeUpdate();
//
//            if (rowCount > 0) {
//                request.setAttribute("status", "success");
//            } else {
//                request.setAttribute("status", "failed");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            request.setAttribute("status", "failed");
//        }
//
//        request.getRequestDispatcher("registration.jsp").forward(request, response);
//    }
//}



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


//package com.Coastline.user;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.RequestDispatcher;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//import java.io.PrintWriter;
//import java.io.IOException;
//
///**
// *
// * @author cerrchus
// */
//
//@WebServlet("/register")
//public class RegisterServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//    
//    
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException{
//        
//        String fname = request.getParameter("fname");
//        String lname = request.getParameter("lname");
//        String uemail = request.getParameter("email");
//        String username = request.getParameter("username");
//        String upasswd = request.getParameter("password");
//        
//        Connection conn = null;
//        RequestDispatcher dispatcher = null;
////        
////        PrintWriter out = response.getWriter();
////        out.print(fname);
////        out.print(lname);
////        out.print(uemail);
////        out.print(username);
////        out.print(upasswd);
////        
//
//        try{
//            
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Coastline_DCT?useSSL=false","root","PaleMoonlight...");
//            
//            
//            PreparedStatement pst = conn
//                    .prepareStatement("INSERT INTO registrar_usuario(email"
//                            + ",contrasena,firstname,lastname,nombre_usuario) VALUES(?,?,?,?,?);");
//            pst.setString(3,fname);
//            pst.setString(4,lname);
//            pst.setString(1,uemail);
//            pst.setString(5,username);
//            pst.setString(2,upasswd);
//            
//            int rowCount = pst.executeUpdate();
//            dispatcher = request.getRequestDispatcher("registration.jsp");
//            
//            if (rowCount > 0){
//                
//                request.setAttribute("status","success");
//            }
//            else{
//                request.setAttribute("status","failed");
//            }
//            dispatcher.forward(request,response);
//        } catch (Exception e){
//            e.printStackTrace();
//        }finally{
//            try{
//                conn.close();
//            }catch (SQLException e){
//                e.printStackTrace();
//            }
//        }
//    }
//}



//
//package com.Coastline.user;
//
//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.RequestDispatcher;
//import java.io.IOException;
//
//
//import javax.sql.DataSource;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//@WebServlet("/register")
//public class RegisterServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    // Inject the DataSource using resource annotation
//    @Resource(name = "jdbc/Coastline_DCT")
//    private DataSource dataSource;
//    
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String fname = request.getParameter("fname");
//        String lname = request.getParameter("lname");
//        String uemail = request.getParameter("email");
//        String username = request.getParameter("username");
//        String upasswd = request.getParameter("password");
//        
//
//        
//        RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
//        Connection conn = null;
//        try {
//            conn = dataSource.getConnection();
//
//            PreparedStatement pst = conn.prepareStatement("INSERT INTO registrar_usuario(email, contrasena, firstname, lastname, nombre_usuario) VALUES(?,?,?,?,?)");
//
//            pst.setString(1, uemail);
//            pst.setString(2, upasswd);
//            pst.setString(3, fname);
//            pst.setString(4, lname);
//            pst.setString(5, username);
//
//            int rowCount = pst.executeUpdate();
//
//            if (rowCount > 0) {
//                request.setAttribute("status", "success");
//            } else {
//                request.setAttribute("status", "failed");
//            }
//        
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            if (conn != null) {
//                try {
//                    conn.close();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//            }
//            
//        }
//        dispatcher.forward(request, response);
//    }
//}


//import jakarta.annotation.Resource;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import javax.naming.Context;
//import javax.naming.InitialContext;
//import jakarta.servlet.RequestDispatcher;
//import javax.sql.DataSource;
//
//@WebServlet("/register")
//public class RegisterServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    // Inject the DataSource using resource annotation
//    @Resource(name = "jdbc/Coastline_DCT")
//    private DataSource dataSource;
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String fname = request.getParameter("fname");
//        String lname = request.getParameter("lname");
//        String uemail = request.getParameter("email");
//        String username = request.getParameter("username");
//        String upasswd = request.getParameter("password");
//
//        try {
//            // Obtain the DataSource object using JNDI lookup
//            Context initContext = new InitialContext();
//            Context envContext = (Context) initContext.lookup("java:/comp/env");
//            DataSource dataSource = (DataSource) envContext.lookup("jdbc/Coastline_DCT");
//
//            try (Connection conn = dataSource.getConnection()) {
//                PreparedStatement pst = conn.prepareStatement("INSERT INTO usuarios (nombre_usuario, email, contrasena, firstname, lastname, id_visitante, id_mazo) VALUES (?, ?, ?, ?, ?, ?, ?)");
//
//                pst.setString(1, username);
//                pst.setString(2, uemail);
//                pst.setString(3, upasswd);
//                pst.setString(4, fname);
//                pst.setString(5, lname);
//                pst.setInt(6, 1); // Assuming id_visitante is 1
//                pst.setInt(7, 1); // Assuming id_mazo is 1
//
//                int rowCount = pst.executeUpdate();
//
//                if (rowCount > 0) {
//                    request.setAttribute("status", "success");
//                } else {
//                    request.setAttribute("status", "failed");
//                }
//            }
//        } catch (SQLException | javax.naming.NamingException e) {
//            e.printStackTrace();
//            request.setAttribute("status", "failed");
//        }
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
//        dispatcher.forward(request, response);
//    }
//}


