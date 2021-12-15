/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.finalOtelRezervasyon.Servlets;

import com.finalOtelRezervasyon.Model.Message;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abhi
 */
public class ProfileServlet extends HttpServlet {
  private com.finalOtelRezervasyon.Model.DAO kullaniciDAO;

    @Override
    public void init() {
        kullaniciDAO = new com.finalOtelRezervasyon.Model.DAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
           String action = request.getParameter("mesaj");
        if (action==null) action="";
        switch (action) {
            case "mesajgonder":
                mesajgonder(request, response);
                break;
            default:
                break;
        }
        
        
    }

    
     private void mesajgonder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
              String isim = request.getParameter("isim");
            String email = request.getParameter("email");
            String konu = request.getParameter("konu");
            String mesaj = request.getParameter("mesajText");
            Connection dbConnection = kullaniciDAO.getConnection();

           
               
             try {
               
            PreparedStatement stmt = dbConnection.prepareStatement("INSERT INTO iletisim (isim,email,konu,mesaj) VALUES (?, ?, ?,?)");
            stmt.setString(1, isim);
            stmt.setString(2, email);
            stmt.setString(3, konu);
            stmt.setString(4, mesaj);
            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
                System.out.println("Mesaj Gonderildi Kaydedildi");
                HttpSession session = request.getSession();
                 session.setAttribute("msgiletisim","Mesaj Admine Ulaşmıştır. En Kısa Sürede Dönüş Yapılacaktır.");
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/iletisim.jsp");
            dispatcher.forward(request, response);   
            } 
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("iletisim.jsp");
        }
            
           
    }


}
