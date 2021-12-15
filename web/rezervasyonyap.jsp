<%-- 
    Document   : rezervasyonyap
    Created on : Nov 30, 2021, 12:11:26 AM
    Author     : mirza
--%>
<%@page import="java.lang.Thread.State"%>
<%@page import="jdk.jshell.spi.ExecutionControl.ExecutionControlException"%>
<%-- import java packets --%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body class="sb-nav-fixed">
        <input type="hidden" value="<%=session.getAttribute("UserId")%>" id="session" >
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
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Panel Anasayfa</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Anasayfa</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Yapılan Rezervasyon Sayısı</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        
                                        <%
                                        
         String JDBC_DRIVER3 = "com.mysql.cj.jdbc.Driver";
       String DB_URL3 = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
              try {
                  Connection conn3=null;
                            Class.forName(JDBC_DRIVER3);
                            conn3= DriverManager.getConnection(DB_URL3,"root","root");
                                          String SQL_QUERY3 = "SELECT COUNT(*) as rowcount FROM rezervasyon ";
                       Statement statementProduct4=null;
                       ResultSet rs4 = null;
                       statementProduct4 = conn3.createStatement();
                       rs4 = statementProduct4.executeQuery(SQL_QUERY3);
                        while(rs4.next()) {
                  int count4 = rs4.getInt("rowcount");
                                            %>
                                                        <a class="small text-white stretched-link" href="#"><%=count4%></a>
                                        <%
                        }
                     }catch(Exception  e) {
                         System.out.print(e);
       e.printStackTrace();
                     }
     
     
     
                                        
                                        
                                        %>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Toplam Oda Sayısı</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <%
                                            
                                              String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
       String DB_URL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
              try {
                  Connection conn=null;
                            Class.forName(JDBC_DRIVER);
                            conn = DriverManager.getConnection(DB_URL,"root","root");
                                          String SQL_QUERY = "SELECT COUNT(*) as rowcount FROM odalarimiz ";
                       Statement statementProduct1=null;
                       ResultSet rs2 = null;
                       statementProduct1 = conn.createStatement();
                       rs2 = statementProduct1.executeQuery(SQL_QUERY);
                        while(rs2.next()) {
                  int count = rs2.getInt("rowcount");
                                            %>
                                                        <a class="small text-white stretched-link" href="#"><%=count%></a>
                                        <%
                        }
                     }catch(Exception  e) {
                         System.out.print(e);
       e.printStackTrace();
                     }
                                            
                                            
                                   
                                        
                                        %>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Müşteri Sayısı</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        
                                        
                                             <%
                                            
                                              String JDBC_DRIVER2 = "com.mysql.cj.jdbc.Driver";
       String DB_URL2 = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
              try {
                  Connection conn2=null;
                            Class.forName(JDBC_DRIVER2);
                            conn2 = DriverManager.getConnection(DB_URL2,"root","root");
                                          String SQL_QUERY2 = "SELECT COUNT(*) as rowcount FROM user ";
                       Statement statementProduct2=null;
                       ResultSet rs3 = null;
                       statementProduct2 = conn2.createStatement();
                       rs3 = statementProduct2.executeQuery(SQL_QUERY2);
                        while(rs3.next()) {
                  int count2 = rs3.getInt("rowcount");
                                            %>
                                                        <a class="small text-white stretched-link" href="#"><%=count2%></a>
                                        <%
                        }
                     }catch(Exception  e) {
                         System.out.print(e);
       e.printStackTrace();
                     }
                                            
                                            
                                   
                                        
                                        %>
                                        
                                       
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                       
                       
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
