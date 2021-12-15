/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finalOtelRezervasyon.Servlets;

import com.finalOtelRezervasyon.Model.DAO;
import com.finalOtelRezervasyon.Model.Message;
import com.finalOtelRezervasyon.Model.Rezervasyon;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.PageContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mirza
 */
@WebServlet(name = "RezervasyonServlet", urlPatterns = {"/RezervasyonServlet"})
public class RezervasyonServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
private String modifyDateLayout(String inputDate) throws ParseException{
    Date date = (Date) new SimpleDateFormat("yyyy-MM-dd HH:mm:ss z").parse(inputDate);
    return new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(date);
}
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
        
        String action = request.getParameter("rezervasyon");
        if (action==null) {
            action="rezervasyonlistesi";
        }
        
        switch (action) {
            case "rezervasyonekleme":
            {
                try {
                    rezervasyonekleme(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(RezervasyonServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ParseException ex) {
                Logger.getLogger(RezervasyonServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
                break;
            case "rezervasyonlistesi":
                 {
                try {
                    rezervasyonlistesi(request, response);
                } catch (SQLException ex) {
                    Logger.getLogger(RezervasyonServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                
                break;

           
            default:
                break;
        }
        
    }
     
        private void rezervasyonekleme(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException, ParseException{
            
            int userId = Integer.parseInt(request.getParameter("userId"));
            int odaid = Integer.parseInt(request.getParameter("odaid"));
            String baslangicTarihi = request.getParameter("baslangicTarihi");
            String bitisTarihi = request.getParameter("bitisTarihi");
            
            SimpleDateFormat formatter1= new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date date1=formatter1.parse(baslangicTarihi);  
            java.util.Date  date2 = formatter1.parse(bitisTarihi);
     
            long fark = date2.getTime() - date1.getTime();
            int gunFarki =(int) TimeUnit.DAYS.convert(fark, TimeUnit.MILLISECONDS);
     
            int durum = 1;
            java.util.Date olusturulmaTarihi = new java.util.Date();
            String olusturulmaTarihiString = olusturulmaTarihi.toString();
            
             try {
                 
            Connection dbConnection = new DAO().getConnection();
            int toplamTutar=0;
            int odaFiyat=0;

             String SQL_QUERY = "SELECT * FROM odalarimiz where Id='"+odaid+"'";
                       Statement statementProduct=null;
                       ResultSet rs = null;
                       statementProduct = dbConnection.createStatement();
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                        odaFiyat =rs.getInt(7);
                        }
                        toplamTutar =odaFiyat*gunFarki;
            
            PreparedStatement stmt = dbConnection.prepareStatement("INSERT INTO rezervasyon (odaid,userId,olusturulmaTarihi,baslangicTarihi,bitisTarihi,toplamTutar,durum) VALUES (?, ?, ?, ?,?,?,?)");
            stmt.setInt(1, odaid);
            stmt.setInt(2, userId);
            stmt.setString(3, olusturulmaTarihiString);
            stmt.setString(4, baslangicTarihi);
            stmt.setString(5, bitisTarihi);
            stmt.setInt(6, toplamTutar);
            stmt.setInt(7, durum);

            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
                System.out.println("Rezervasyon Yapıldı.");
                HttpSession session = request.getSession();
                
                String sql="Update odalarimiz set OdaDurumu=0 where Id="+odaid;
 PreparedStatement ps = dbConnection.prepareStatement(sql);
int i = ps.executeUpdate();
                  if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("RezervasyonSayisi")) {
                   String nowCookieValue= cookie.getValue();
                   int nowValueInt = Integer.parseInt(nowCookieValue);
                   nowValueInt++;
                   cookie.setValue(String.valueOf(nowValueInt));
                   response.addCookie(cookie);
                }
            }
        }

                 response.sendRedirect("rezervasyonlarim.jsp");
            } 
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("odalistesi.jsp");
        }
    }

          private void rezervasyonlistesi(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException{
            
              String baslangicTarihi = request.getParameter("baslangicTarihi");
              String bitisTarihi = request.getParameter("bitisTarihi");
              ArrayList<Rezervasyon> rezerList = new ArrayList<Rezervasyon>();
             try {
            Connection dbConnection = new DAO().getConnection();
                       Statement statementProduct=null;
                       ResultSet rs = null;
                       statementProduct = dbConnection.createStatement();
                       String SQL_QUERY ="";
                       
 if(baslangicTarihi!=null && bitisTarihi!=null) {
                                SQL_QUERY = "SELECT * FROM rezervasyon where baslangicTarihi>='"+baslangicTarihi+"' and bitisTarihi<='"+bitisTarihi+"' ";
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                            Rezervasyon rez = new Rezervasyon(rs.getString(1),rs.getString(2) , rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                            rezerList.add(rez);
                        }
              }
              else {
                      SQL_QUERY = "SELECT * FROM rezervasyon ";
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                            Rezervasyon rez = new Rezervasyon(rs.getString(1),rs.getString(2) , rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                            rezerList.add(rez);
                        }
              }
                 request.setAttribute("rezerList", rezerList);
                 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/rezervasyonlistesifilter.jsp");
            dispatcher.forward(request, response);   
          
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("anasayfa.jsp");
        }
    }

    

 
}
