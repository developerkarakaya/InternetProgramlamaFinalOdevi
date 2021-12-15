<%-- 
    Document   : odarezervasyon
    Created on : Dec 5, 2021, 9:35:56 PM
    Author     : mirza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : musteriekleme
    Created on : Dec 4, 2021, 4:26:50 PM
    Author     : mirza
--%>
<%@page import="java.lang.Thread.State"%>
<%@page import="jdk.jshell.spi.ExecutionControl.ExecutionControlException"%>
<%-- import java packets --%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.io.*" %>
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
            <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>    
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap4-datetimepicker@5.2.3/src/js/bootstrap-datetimepicker.min.js"></script>       
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker-standalone.css" integrity="sha512-wT6IDHpm/cyeR3ASxyJSkBHYt9oAvmL7iqbDNcAScLrFQ9yvmDYGPZm01skZ5+n23oKrJFoYgNrlSqLaoHQG9w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" integrity="sha512-mQ8Fj7epKOfW0M7CwuuxdPtzpmtIB5rI4rl76MSd3mm5dCYBKjzPk7EU/2buhPMs0KmC6YOPR/MQlQwpkdNcpQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                            <li class="breadcrumb-item active">Oda Rezervasyon</li>
                        </ol>
                     
                     <form action="rezervasyonekle" method="POST" > 
                              <input type="hidden" value="rezervasyonekleme" name="rezervasyon"/>

                           <input type="hidden" value="<%=request.getParameter("odaid")%>" name="odaid" >
                           <input type="hidden" value="<%=(String) session.getAttribute("UserId")%>" name="userId" >

                                       <div class="container-fluid" >
                                                                
                      
  </div>  
                           <div class="form-row">
    <div class="form-group col-md-4">
      <label >Rezervasyon Başlangıç Tarihi </label>
          <div class="input-group datepicker">
              <input type="text" class="form-control"  name="baslangicTarihi"  required readonly>
					<span class="input-group-addon" style="margin:10px">
						<span class="fa fa-calendar"></span>
					</span>
				</div>  </div>
  </div>
                                                
                                                      
  <div class="form-group col-md-4">
    <label >Rezervasyon Bitiş Tarihi </label>
   <div class="input-group datepicker">
       <input type="text"  name="bitisTarihi" required class="form-control" readonly>
					<span class="input-group-addon" style="margin:10px">
						<span class="fa fa-calendar"></span>
					</span>
				</div>  </div>
                     
                                             <br>
  <button type="submit" class="btn btn-primary">Rezervasyon Yap</button>                                
</form>
                        
                    </div>
                     </form>
      
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
        
        
        
        <script>
            var defaults = {
	calendarWeeks: true,
	showClear: true,
	showClose: true,
	allowInputToggle: true,
	useCurrent: false,
	ignoreReadonly: true,
	minDate: new Date(),
	toolbarPlacement: 'top',
	locale: 'nl',
	icons: {
		time: 'fa fa-clock-o',
		date: 'fa fa-calendar',
		up: 'fa fa-angle-up',
		down: 'fa fa-angle-down',
		previous: 'fa fa-angle-left',
		next: 'fa fa-angle-right',
		today: 'fa fa-dot-circle-o',
		clear: 'fa fa-trash',
		close: 'fa fa-times'
	}
};

$(function() {
	var optionsDatetime = $.extend({}, defaults, {format:'DD-MM-YYYY HH:mm'});
	var optionsDate = $.extend({}, defaults, {format:'DD-MM-YYYY'});
	var optionsTime = $.extend({}, defaults, {format:'HH:mm'});
	
	$('.datepicker').datetimepicker(optionsDate);
	$('.timepicker').datetimepicker(optionsTime);
	$('.datetimepicker').datetimepicker(optionsDatetime);
});
            
        </script>
    </body>
</html>