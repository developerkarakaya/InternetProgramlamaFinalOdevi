<%-- 
    Document   : anasayfa.jsp
    Created on : Nov 6, 2021, 9:27:50 PM
    Author     : mirza
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Otel Yonetim Sistemi</title>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
  <link href="css/flexslider.css" rel="stylesheet">
  <link href="css/templatemo-style.css" rel="stylesheet">
  <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
  <script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
     

.card-margin {
    margin-bottom: 1.875rem;
}

.card {
    border: 0;
    box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
    -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
    -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
    -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #ffffff;
    background-clip: border-box;
    border: 1px solid #e6e4e9;
    border-radius: 8px;
}

.card .card-header.no-border {
    border: 0;
}
.card .card-header {
    background: none;
    padding: 0 0.9375rem;
    font-weight: 500;
    display: flex;
    align-items: center;
    min-height: 50px;
}
.card-header:first-child {
    border-radius: calc(8px - 1px) calc(8px - 1px) 0 0;
}

.widget-49 .widget-49-title-wrapper {
  display: flex;
  align-items: center;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-primary {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: #edf1fc;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-primary .widget-49-date-day {
  color: #4e73e5;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-primary .widget-49-date-month {
  color: #4e73e5;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-secondary {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: #fcfcfd;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-secondary .widget-49-date-day {
  color: #dde1e9;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-secondary .widget-49-date-month {
  color: #dde1e9;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-success {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: #e8faf8;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-success .widget-49-date-day {
  color: #17d1bd;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-success .widget-49-date-month {
  color: #17d1bd;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-info {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: #ebf7ff;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-info .widget-49-date-day {
  color: #36afff;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-info .widget-49-date-month {
  color: #36afff;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-warning {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: floralwhite;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-warning .widget-49-date-day {
  color: #FFC868;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-warning .widget-49-date-month {
  color: #FFC868;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-danger {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: #feeeef;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-danger .widget-49-date-day {
  color: #F95062;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-danger .widget-49-date-month {
  color: #F95062;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-light {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: #fefeff;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-light .widget-49-date-day {
  color: #f7f9fa;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-light .widget-49-date-month {
  color: #f7f9fa;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-dark {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: #ebedee;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-dark .widget-49-date-day {
  color: #394856;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-dark .widget-49-date-month {
  color: #394856;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-base {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  background-color: #f0fafb;
  width: 4rem;
  height: 4rem;
  border-radius: 50%;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-base .widget-49-date-day {
  color: #68CBD7;
  font-weight: 500;
  font-size: 1.5rem;
  line-height: 1;
}

.widget-49 .widget-49-title-wrapper .widget-49-date-base .widget-49-date-month {
  color: #68CBD7;
  line-height: 1;
  font-size: 1rem;
  text-transform: uppercase;
}

.widget-49 .widget-49-title-wrapper .widget-49-meeting-info {
  display: flex;
  flex-direction: column;
  margin-left: 1rem;
}

.widget-49 .widget-49-title-wrapper .widget-49-meeting-info .widget-49-pro-title {
  color: #3c4142;
  font-size: 14px;
}

.widget-49 .widget-49-title-wrapper .widget-49-meeting-info .widget-49-meeting-time {
  color: #B1BAC5;
  font-size: 13px;
}

.widget-49 .widget-49-meeting-points {
  font-weight: 400;
  font-size: 13px;
  margin-top: .5rem;
}

.widget-49 .widget-49-meeting-points .widget-49-meeting-item {
  display: list-item;
  color: #727686;
}

.widget-49 .widget-49-meeting-points .widget-49-meeting-item span {
  margin-left: .5rem;
}

.widget-49 .widget-49-meeting-action {
  text-align: right;
}

.widget-49 .widget-49-meeting-action a {
  text-transform: uppercase;
}
  </style>
  </head>
  <body class="tm-gray-bg">
  	<div class="tm-header">
  		<div class="container">
  			  <%@ include file = "menu.jsp" %>
  		</div>	  	
  	</div>
               

                
	
<div class="">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="Hotelİmages/slide1.jpg" alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
          <h3>Otelimize Hoş Geldiniz</h3>
        </div>
      </div>

      <div class="item">
        <img src="Hotelİmages/slide2.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
          <h3>Rahat Odalar vs..</h3>
        </div>
      </div>
    
      <div class="item">
        <img src="Hotelİmages/bizkimiz.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h3>Uygun Fiyatlar!!</h3>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


                <br>          
                    <br>           
                            <div class="container">
<div class="row">
    
                      <%
                                  
                       String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
                       String DB_URL = "jdbc:mysql://localhost:3306/otelrezervasyon?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey";
                       String USER = "root";
                       String PASS = "root";
                       Connection dbConnection = null;
                       String SQL_QUERY = "SELECT * FROM odalarimiz ";
                       Class.forName(JDBC_DRIVER);
                       dbConnection = DriverManager.getConnection(DB_URL, USER, PASS);
                       Statement statementProduct=null;
                       ResultSet rs = null;
                       statementProduct = dbConnection.createStatement();
                       rs = statementProduct.executeQuery(SQL_QUERY);
                        while(rs.next()) {
                            %>
                              
                            
                            
                            
                            <div class="col-lg-4">
        <div class="card card-margin">
            <div class="card-header no-border">
                <h5 class="card-title"><%=rs.getString(2)%></h5>
            </div>
            <div class="card-body pt-0">
                <div class="widget-49">
                    <div class="widget-49-title-wrapper">
                        <div class="widget-49-date-primary">
                            <span class="widget-49-date-day"><%=rs.getString(7)%></span>
                            <span class="widget-49-date-month">TL</span>
                        </div>
                        <div class="widget-49-meeting-info">
                            <span class="widget-49-pro-title">Rezervasyon Yapmak İçin Rezervasyon Yap Butonuna Tıklayın !</span>
                        </div>
                    </div>
                    <ol class="widget-49-meeting-points">
                        <li class="widget-49-meeting-item"><span><strong>Oda Tipi :</strong> <%=rs.getString(3)%></span></li>
                        <li class="widget-49-meeting-item"><span><strong>Oda Manzara :</strong> <%=rs.getString(4)%> </span></li>
                        <li class="widget-49-meeting-item"><span><strong>Oda Kapasite :</strong> <%=rs.getString(8)%></span></li>
                    </ol>
                    <div class="widget-49-meeting-action">
                        	  <%
      if (username != null) {
                %>
                                              							<a href="/finalOtelRezervasyon/rezervasyonyap.jsp"  class="btn btn-success"><span   >Rezervasyon Yap</span></a>
  
                                                
                                                
                                                <%
      }
      else {
         %>
                                                        
                        							<a href="/finalOtelRezervasyon/login"  class="btn btn-success"><span   >Rezervasyon Yap</span></a>

                       
                                          <%
      }
                                                
                                                %>
                    </div>
                </div>
            </div>
        </div>
    </div>
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                           
                            
                            
                            <%

                        }
                  
                            %>
                            
    
    
    
</div>
</div>
                            
	
	<footer class="tm-black-bg">
		<div class="container">
			<div class="row">
				<p class="tm-copyright-text">Copyright &copy; 2021 Sivas Cumhuriyet Üniversitesi İnternet Programlama Final Ödevi
                </p>
			</div>
		</div>		
	</footer>
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		
  	<script type="text/javascript" src="js/moment.js"></script>						
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>

   	<script type="text/javascript" src="js/templatemo-script.js"></script>      		
	
 </body>
 </html>