package com.finalOtelRezervasyon.Servlets;

import static com.finalOtelRezervasyon.Servlets.LoginServlet.JDBC_DRIVER;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author abhi
 */
public class SignupServlet extends HttpServlet {

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
          RequestDispatcher dispatcher = request.getRequestDispatcher("kayitol.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("password_confirmation");
        int rolid=1;
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        if (!password.equals(confirmPassword)) {
            session.setAttribute("error", "Girilen İki Şifre De Aynı Olmalı !");
                    System.out.println("error");

            dispatcher = request.getRequestDispatcher("kayitol.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            if (dbConnection == null) {
                connectDB();

            }
            PreparedStatement stmt = dbConnection.prepareStatement("INSERT INTO user (email,password,name,phone,rolid) VALUES (?, ?, ?, ?,?)");
            stmt.setString(1, email);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, phone);
            stmt.setString(5,String.valueOf(rolid));

            int row = stmt.executeUpdate();
            stmt.close();
            if (row > 0) {
                System.out.println("Signup Successful");
                response.sendRedirect("anasayfa.jsp");
            } else {
                session.setAttribute("error", "SQL Error!");
                dispatcher = request.getRequestDispatcher("Signup.jsp");
            }

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            dispatcher = request.getRequestDispatcher("kayitol.jsp");
        }
        if (dispatcher != null) {
            dispatcher.forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
