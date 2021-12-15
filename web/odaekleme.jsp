<%-- 
    Document   : odaekleme
    Created on : Nov 30, 2021, 12:46:43 AM
    Author     : mirza
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
                            <li class="breadcrumb-item active">Oda Ekleme</li>
                        </ol>
                    <div class="container-fluid" >
                        <%
                          String msg = (String) session.getAttribute("msg");
                        if(msg!=null) {
                            %>
                        
                            <div class="alert alert-success" > ${msg}</div>

                        <%
                            session.setAttribute("msg",null);
                        }
                        %>

                        <form action="odaekleme" method="POST">
                            <input type="hidden" value="odaekleme" name="oda"/>
                            <div class="form-row">
    <div class="form-group col-md-4">
      <label >Oda Adı</label>
      <input type="text" autocomplete="off" class="form-control" id="odaadi" name="OdaAdi" placeholder="Oda Adı Giriniz" required>
    </div>
       <div class="form-group col-md-4">
      <label >Oda Tipi</label>
      <select id="OdaTipi" name="OdaTipi" class="form-control" required>
        <option>Delux</option>
        <option>Double Room</option>
        <option>Single Room</option>
      </select>
    </div>
      <div class="form-group col-md-4">
      <label >Oda Manzara</label>
      <select id="OdaManzara" name="OdaManzara" class="form-control" required>
          
                             <%
                                  
                       String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
                       String DB_URL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
                       String USER = "root";
                       String PASS = "root";
                       Connection dbConnection = null;
                       String SQL_QUERY = "SELECT * FROM manzara";
                       Class.forName(JDBC_DRIVER);
                       dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
                       Statement statementProduct=null;
                       ResultSet rs = null;
                       statementProduct = dbConnection.createStatement();
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                            %>
                                          <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                                    
                            <%

                        }
                  
                            %>
                            
      </select>
    </div>
       <div class="form-group col-md-4">
      <label >Oda Durum</label>
      <select id="OdaDurum" name="OdaDurum" class="form-control" required>
        <option selected value="1">Aktif</option>
                <option value="0" >Pasif</option>
      </select>
    </div>
    <div class="form-group col-md-4">
      <label for="OdaDetay">OdaDetay</label>
      <br>
      <textarea cols="55"   class="form-control" rows="10" name="OdaDetay" placeholder="Oda Detayı Giriniz" required>

      </textarea>
    </div>
  </div>
  <div class="form-group col-md-4">
    <label for="OdaFiyat">Oda Fiyat</label>
    <input autocomplete="off" type="number" class="form-control" id="OdaFiyat" name="OdaFiyat" placeholder="Oda Fiyatı Giriniz" required>
  </div>
                                             
                                             <div class="form-group col-md-4">
    <label for="OdaKapasite">Oda Kapasite</label>
    <input autocomplete="off" type="number" required class="form-control" id="OdaKapasite" name="OdaKapasite" placeholder="Oda Kapasitesi Giriniz">
  </div>
                                             <br>

  <button type="submit" class="btn btn-primary">Oda Kaydet</button>
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
