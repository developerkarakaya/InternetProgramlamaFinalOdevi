<%-- 
    Document   : odasil
    Created on : Dec 6, 2021, 2:24:16 PM
    Author     : mirza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
     String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
       String DB_URL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
              try {
                int odaid = Integer.parseInt(request.getParameter("odaid"));
                             Connection conn = null;
                            Statement stmt2 = null;
                            ResultSet rs = null;
                            Class.forName(JDBC_DRIVER);
                            conn = DriverManager.getConnection(DB_URL,"root","root");
                            stmt2 =conn.createStatement();
                          int i=stmt2.executeUpdate("delete from odalarimiz where Id='"+odaid+"'");
                                response.sendRedirect("adminodalistesi.jsp");
                     }catch(Exception  e) {
                         System.out.print(e);
       e.printStackTrace();
                     }
%>