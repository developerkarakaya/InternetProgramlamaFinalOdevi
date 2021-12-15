<%-- 
    Document   : mesajsil
    Created on : Dec 9, 2021, 10:21:13 PM
    Author     : samet
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
                int userid = Integer.parseInt(request.getParameter("id"));
                             Connection conn = null;
                            Statement stmt2 = null;
                            ResultSet rs = null;
                            Class.forName(JDBC_DRIVER);
                            conn = DriverManager.getConnection(DB_URL,"root","root");
                            stmt2 =conn.createStatement();
                          int i=stmt2.executeUpdate("delete from iletisim where Id='"+userid+"'");
                                response.sendRedirect("mesajlistesi.jsp");
                     }catch(Exception  e) {
                         System.out.print(e);
       e.printStackTrace();
                     }
%>