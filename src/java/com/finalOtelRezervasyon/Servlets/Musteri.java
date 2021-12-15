/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finalOtelRezervasyon.Servlets;

import com.finalOtelRezervasyon.Model.Message;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mirza
 */
public class Musteri extends HttpServlet {
  private com.finalOtelRezervasyon.Model.DAO kullaniciDAO;

    @Override
    public void init() {
        kullaniciDAO = new com.finalOtelRezervasyon.Model.DAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String action = request.getParameter("musteri");
        if (action==null) action="";
        switch (action) {
            case "musteriEkleme":
                musteriekleme(request, response);
                break;
            case "bilgiguncelleme":
                                bilgiguncelleme(request, response);
                break;
            case "delete":
                break;
            case "edit":
                break;
            case "update":
                break;
            default:
                break;
        }
        
        
        
    }
 
        private void musteriekleme(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
            int id=0;
            String valueId = request.getParameter("id");
            if(valueId!="0") {
                             id = Integer.parseInt(request.getParameter("id"));
            }
              String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            int rolid = 1;
            Connection dbConnection = kullaniciDAO.getConnection();

            if(id>0) {
                
                try
{
String sql="Update user set email=?,password=?,name=?,phone=?,rolid=? where id="+id;
 PreparedStatement ps = dbConnection.prepareStatement(sql);
ps.setString(1,email);
ps.setString(2, password);
ps.setString(3, name);
ps.setString(4, phone);
ps.setInt(5, rolid);
int i = ps.executeUpdate();
if(i > 0)
{
      System.out.println("Müşteri Güncellendi");
                HttpSession session = request.getSession();
                 session.setAttribute("msgMusteri","Müşteri Başarıyla Güncellendi ");
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/musteriekleme.jsp");
            dispatcher.forward(request, response);   
}
else
{
            response.sendRedirect("musteriekleme.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
}
            }
            else {
               
             try {
               
            PreparedStatement stmt = dbConnection.prepareStatement("INSERT INTO user (email,password,name,phone,rolid) VALUES (?, ?, ?, ?,?)");
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, phone);
            stmt.setInt(5, rolid);
            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
                System.out.println("Müşteri Kaydedildi");
                HttpSession session = request.getSession();
                 session.setAttribute("msgMusteri",new Message().SuccessMessageMusteri);
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/musteriekleme.jsp");
            dispatcher.forward(request, response);   
            } 
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("musteriekleme.jsp");
        }
            }
            
           
    }

        
        
          private void bilgiguncelleme(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
            String id = request.getParameter("id");
          
            String name = request.getParameter("isim");
            String email = request.getParameter("email");
            String password = request.getParameter("sifre");
            String phone = request.getParameter("telefon");
            Connection dbConnection = kullaniciDAO.getConnection();
           
                
                try
{
String sql="Update user set email=?,password=?,name=?,phone=? where id="+id;
 PreparedStatement ps = dbConnection.prepareStatement(sql);
ps.setString(1,email);
ps.setString(2, password);
ps.setString(3, name);
ps.setString(4, phone);

int i = ps.executeUpdate();
if(i > 0)
{
      System.out.println("Müşteri Güncellendi");
                HttpSession session = request.getSession();
                 session.setAttribute("msgBilgiGuncelleme","Bilgileriniz Başarıyla Güncellendi.");
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/bilgilerimiguncelle.jsp");
            dispatcher.forward(request, response);   
}
else
{
            response.sendRedirect("bilgilerimiguncelle.jsp");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
}
            
            
           
    }

   
}
