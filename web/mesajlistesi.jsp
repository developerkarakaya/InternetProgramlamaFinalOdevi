<%-- 
    Document   : mesajlistesi
    Created on : Dec 9, 2021, 10:19:54 PM
    Author     : samet
--%>



<%@page import="java.lang.Thread.State"%>
<%@page import="jdk.jshell.spi.ExecutionControl.ExecutionControlException"%>
<%-- import java packets --%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.io.*" %>
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
                     <h1 class="mt-4">Admin Paneli</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Mesaj Listesi</li>
                        </ol>
                    <div class="container-fluid" >
                        <%
                          String msg = (String) session.getAttribute("msgManzara");
                        if(msg!=null) {
                            %>
                        
                            <div class="alert alert-success" > ${msgManzara}</div>

                        <%
                            session.setAttribute("msgManzara",null);
                        }
                        %>

            <div class="container-fluid px-4">
                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>İsim</th>
                                            <th>Email</th>
                                            <th>Konu</th>
                                            <th>Mesaj İçerik</th>
                                            <th>İşlemler</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                           <th>İsim</th>
                                            <th>Email</th>
                                            <th>Konu</th>
                                            <th>Mesaj İçerik</th>
                                            <th>İşlemler</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                                     <%
                                  
                       String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
                       String DB_URL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
                       String USER = "root";
                       String PASS = "root";
                       Connection dbConnection = null;
                       String SQL_QUERY = "SELECT * FROM iletisim ";
                       Class.forName(JDBC_DRIVER);
                       dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
                       Statement statementProduct=null;
                       ResultSet rs = null;
                       statementProduct = dbConnection.createStatement();
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                            %>
                                       <tr>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(3)%></td>
                                            <td><%=rs.getString(4)%></td>
                                            <td><%=rs.getString(5)%></td>
                                            <td>
                                                <a class="btn btn-danger" href="mesajsil.jsp?id=<%=rs.getString(1)%>" >Sil</a>
                                            </td>

                                        </tr>
                                    
                            <%

                        }
                  
                            %>
                            
                                        
                                        
                                     
                                    </tbody>
                                </table>
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
        <script src="js/datatable.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

      
    
    </body>
</html>
