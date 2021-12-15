<%-- 
    Document   : bilgilerimiguncelle
    Created on : Dec 6, 2021, 1:40:17 PM
    Author     : mirza
--%>
<%@page import="java.lang.Thread.State"%>
<%@page import="jdk.jshell.spi.ExecutionControl.ExecutionControlException"%>
<%-- import java packets --%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.io.*" %>
<%@page import="java.lang.Thread.State"%>
<%@page import="jdk.jshell.spi.ExecutionControl.ExecutionControlException"%>
<%-- import java packets --%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
                        String userId = (String) session.getAttribute("UserId");
                                String userName ="";
                                String userPhone ="";
                                String userEmail ="";
                                String userPassword ="";

 String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
                       String DB_URL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
                       String USER = "root";
                       String PASS = "root";
                       Connection dbConnection = null;
                       String SQL_QUERY = "SELECT * FROM user where id="+userId;
                       Class.forName(JDBC_DRIVER);
                       dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
                       Statement statementProduct=null;
                       ResultSet rs = null;
                       statementProduct = dbConnection.createStatement();
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                        userName = rs.getString(4);
                        userPhone =rs.getString(5);
                        userEmail = rs.getString(2);
                        userPassword = rs.getString(3);
    }
%>
<!DOCTYPE html>
                           
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Otel Yönetim Sistemi Müşteri Paneli</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
        <style>
            .form-group {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">
                
                <%
                String username = (String) session.getAttribute("UserName");
       String name="";
      if (username != null) {
                name = username;
                %>
            Merhaba, <%=name%>
                <%
      }
                %>
                
            </a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="logout.jsp">Çıkış Yap</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                                       <%@ include file = "navbarAdmin.jsp" %>

                    </div>
                    <div class="sb-sidenav-footer">
                        Otel Otomasyon Sistemi
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main style="margin:10px; padding: 7px">
                     <h1 class="mt-4">Müşteri Paneli</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Bilgilerimi Güncelle</li>
                        </ol>
                    <div class="container-fluid">
                        <%
                          String msg = (String) session.getAttribute("msgBilgiGuncelleme");
                        if(msg!=null) {
                            %>
                        
                            <div class="alert alert-success" > ${msgBilgiGuncelleme}</div>

                        <%
                            session.setAttribute("msgBilgiGuncelleme",null);
                        }
                        %>

                        <form action="bilgiguncelleme" method="POST">
                            <input type="hidden" value="bilgiguncelleme" name="musteri"/>
                         <input type="hidden" value="<%=(String) session.getAttribute("UserId")%>" name="id" >
                                                                <div class="form-row">
    <div class="form-group col-md-4">
      <label >Ad</label>
      <input type="text" autocomplete="off" value="<%=userName%>" class="form-control" id="isim" name="isim" placeholder="Müşteri Adı Giriniz" required>
    </div>
  </div>
  <div class="form-group col-md-4">
    <label >Telefon</label>
    <input autocomplete="off" type="tel" value="<%=userPhone%>" class="form-control" id="Telefon" name="telefon" placeholder="Müşteri Telefon Giriniz" required>
  </div>
                                             <div class="form-group col-md-4">
    <label >Email</label>
    <input autocomplete="off" value="<%=userEmail%>" type="email" required class="form-control" id="email" name="email" placeholder="Müşteri Email Giriniz">
  </div>
                            <div class="form-group col-md-4">
    <label >Şifre</label>
    <input autocomplete="off" value="<%=userPassword%>" type="password" required class="form-control" id="password" name="sifre" placeholder="Müşteri Şifre Giriniz">
  </div>
                                                        <br>
                                                          <button type="submit" class="btn btn-success">Bilgilerimi Güncelle</button>                                
                                                      
</form>
                        
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; İnternet Programlama Final Ödevi 2021</div>
                          
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
