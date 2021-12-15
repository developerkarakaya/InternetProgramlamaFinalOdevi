
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
import jakarta.servlet.jsp.PageContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class OdaServlet extends HttpServlet {
 static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
    static final String USER = "root";
    static final String PASS = "root";
    Connection dbConnection = null;
    @Override
    public void init() throws ServletException {
        super.init();
        connectDB();
    }

    void connectDB() {
        try {
            Class.forName(JDBC_DRIVER);
            dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
        
        
        String action = request.getParameter("oda");
        if (action==null) action="";
        switch (action) {
            case "odaekleme":
                odaekleme(request, response);
                break;
            case "manzaraekleme":
                manzaraekleme(request, response);
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
    
        private void odaekleme(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
            
            String odaadi = request.getParameter("OdaAdi");
            String OdaTipi = request.getParameter("OdaTipi");
            String OdaManzara = request.getParameter("OdaManzara");
            String OdaFiyat = request.getParameter("OdaFiyat");
            String OdaDetay = request.getParameter("OdaDetay");
            String OdaDurum = request.getParameter("OdaDurum");
            String OdaKapasite = request.getParameter("OdaKapasite");
             try {
            if (dbConnection == null) {
                connectDB();

            }
            PreparedStatement stmt = dbConnection.prepareStatement("INSERT INTO odalarimiz (OdaAdi,OdaTipi,OdaManzara,OdaDurumu,OdaDetay,OdaFiyat,OdaKapasite) VALUES (?, ?, ?, ?,?,?,?)");
            stmt.setString(1, odaadi);
            stmt.setString(2, OdaTipi);
            stmt.setString(3, OdaManzara);
            stmt.setString(4, OdaDurum);
            stmt.setString(5, OdaDetay);
            stmt.setString(6, OdaFiyat);
            stmt.setString(7, OdaKapasite);
            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
                System.out.println("Oda Kaydedildi");
                HttpSession session = request.getSession();
                 session.setAttribute("msg",new Message().SuccessMessageOda);
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/odaekleme.jsp");
            dispatcher.forward(request, response);   
            } 
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("odaekleme.jsp");
        }
    }

     private void manzaraekleme(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
            
            String manzaraAdi = request.getParameter("ManzaraAdi");
            String manzaraAciklama = request.getParameter("ManzaraAciklama");
             try {
            if (dbConnection == null) {
                connectDB();

            }
            PreparedStatement stmt = dbConnection.prepareStatement("INSERT INTO manzara (ManzaraAdi,ManzaraAciklama) VALUES (?,?)");
            stmt.setString(1, manzaraAdi);
            stmt.setString(2, manzaraAciklama);
            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
                System.out.println("Manzara Kaydedildi");
                HttpSession session = request.getSession();
                 session.setAttribute("msgManzara",new Message().SuccessMessageOda);
                      RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manzaraekleme.jsp");
            dispatcher.forward(request, response);   
            } 
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("manzaraekleme.jsp");
        }
    }

  

}
