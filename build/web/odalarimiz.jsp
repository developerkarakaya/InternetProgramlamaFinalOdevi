<%-- 
    Document   : odalarimiz
    Created on : Nov 6, 2021, 10:50:15 PM
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
  <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body class="tm-gray-bg">
  	<div class="tm-header">
  		<div class="container">
  			  			  <%@ include file = "menu.jsp" %>

  		</div>	  	
  	</div>
	
	<section class="container tm-home-section-1" id="more">
		
		<div class="section-margin-top">
			<div class="row">				
				<div class="tm-section-header">
					<div class="col-lg-3 col-md-3 col-sm-3"></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title">Odalarımız</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"></div>	
				</div>
			</div>
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
                              
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12 oda" style="margin-top:20px">
					<div class="tm-home-box-2">						
						<img src="img/room.jpg" alt="image" class="img-responsive">
						<h3><%=rs.getString(2)%></h3>
                                                <div class="room-proporties" style="padding:10px">
                                                      <p><strong>Oda Fiyat :</strong> <%=rs.getString(7)%> TL</p>
                                                <p><strong>Oda Tipi :</strong> <%=rs.getString(3)%> </p>
                                                <p><strong>Oda Manzara :</strong> <%=rs.getString(4)%> </p>
                                                <p><strong>Oda Kapasite :</strong> <%=rs.getString(8)%> </p>
                                                </div>
							  <%
      if (username != null) {
                %>
                                              							<a href="/finalOtelRezervasyon/rezervasyonyap.jsp" style="width:256px" class="btn btn-success"><span   >Rezervasyon Yap</span></a>
  
                                                
                                                
                                                <%
      }
      else {
         %>
                                                        
                        							<a href="/finalOtelRezervasyon/login" style="width:256px" class="btn btn-success"><span   >Rezervasyon Yap</span></a>

                       
                                          <%
      }
                                                
                                                %>
                                                
					</div>
				</div>
                            
                            
                            <%

                        }
                  
                            %>
                            
                            
                            
                            
                            
                            
				
				
			</div>
			<div class="row">
				<div class="col-lg-12">
				</div>
			</div>			
		</div>
	</section>		
	
	
	<footer class="tm-black-bg">
		<div class="container">
			<div class="row">
				<p class="tm-copyright-text">Copyright &copy; 2021 Sivas Cumhuriyet Üniversitesi İnternet Programlama Final Ödevi
                </p>
			</div>
		</div>		
	</footer>
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
  	<script type="text/javascript" src="js/moment.js"></script>							<!-- moment.js -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>

   	<script type="text/javascript" src="js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
	<script>
		// HTML document is loaded. DOM is ready.
		$(function() {

			$('#hotelCarTabs a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})

        	$('.date').datetimepicker({
            	format: 'MM/DD/YYYY'
            });
            $('.date-time').datetimepicker();

			// https://css-tricks.com/snippets/jquery/smooth-scrolling/
		  	$('a[href*=#]:not([href=#])').click(function() {
			    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			      var target = $(this.hash);
			      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			      if (target.length) {
			        $('html,body').animate({
			          scrollTop: target.offset().top
			        }, 1000);
			        return false;
			      }
			    }
		  	});
		});
		
		// Load Flexslider when everything is loaded.
		$(window).load(function() {	  		
			// Vimeo API nonsense

/*
			  var player = document.getElementById('player_1');
			  $f(player).addEvent('ready', ready);
			 
			  function addEvent(element, eventName, callback) {
			    if (element.addEventListener) {
			      element.addEventListener(eventName, callback, false)
			    } else {
			      element.attachEvent(eventName, callback, false);
			    }
			  }
			 
			  function ready(player_id) {
			    var froogaloop = $f(player_id);
			    froogaloop.addEvent('play', function(data) {
			      $('.flexslider').flexslider("pause");
			    });
			    froogaloop.addEvent('pause', function(data) {
			      $('.flexslider').flexslider("play");
			    });
			  }
*/

			 
			 
			  // Call fitVid before FlexSlider initializes, so the proper initial height can be retrieved.
/*

			  $(".flexslider")
			    .fitVids()
			    .flexslider({
			      animation: "slide",
			      useCSS: false,
			      animationLoop: false,
			      smoothHeight: true,
			      controlNav: false,
			      before: function(slider){
			        $f(player).api('pause');
			      }
			  });
*/


			  

//	For images only
		    $('.flexslider').flexslider({
			    controlNav: false
		    });


	  	});
                
                
	</script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
 </body>
 </html>