<%-- 
    Document   : rezervasyonsil
    Created on : Dec 6, 2021, 1:13:54 PM
    Author     : mirza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%
    String pageId="";
     String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
       String DB_URL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
              try {
                int rezId = Integer.parseInt(request.getParameter("id"));
                                int odaid = Integer.parseInt(request.getParameter("odaid"));
                                 pageId = request.getParameter("page");

                             Connection conn = null;
                            Statement stmt2 = null;
                            ResultSet rs = null;
                         PreparedStatement ps=null;
                            Class.forName(JDBC_DRIVER);
                            conn = DriverManager.getConnection(DB_URL,"root","root");
                            stmt2 =conn.createStatement();
                          int i=stmt2.executeUpdate("delete from rezervasyon where Id='"+rezId+"'");
                          
                             String sql="Update odalarimiz set OdaDurumu=1 where Id="+odaid;
                            ps = conn.prepareStatement(sql);
                           ps.executeUpdate();
                           
                           
                             for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("RezervasyonSayisi")) {
                   String nowCookieValue= cookie.getValue();
                   int nowValueInt = Integer.parseInt(nowCookieValue);
                   nowValueInt--;
                   cookie.setValue(String.valueOf(nowValueInt));
                   response.addCookie(cookie);
                }
            }
                             
                             
                             if(pageId!=null) {
                                 if(pageId.equals("1")) {
                                                              response.sendRedirect("rezervasyonlistesi.jsp");

                          }
                          else {
                                                              response.sendRedirect("rezervasyonlarim.jsp");

                          }
                             }
                             else {
                                                                                               response.sendRedirect("rezervasyonlarim.jsp");

                             }
                          
                     }catch(Exception  e) {
                         System.out.print(e);
       e.printStackTrace();
                     }
%>