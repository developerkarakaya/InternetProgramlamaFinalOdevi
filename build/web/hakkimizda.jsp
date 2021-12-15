<%-- 
    Document   : hakkimizda
    Created on : Nov 6, 2021, 10:45:04 PM
    Author     : mirza
--%>

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
  </head>
  <body class="tm-gray-bg">
  	<div class="tm-header">
  		<div class="container">
  			  			  <%@ include file = "menu.jsp" %>

  		</div>	  	
  	</div>
	

			<div class="row">				
				<div class="tm-section-header">
                                    <br>
					<div class="col-lg-3 col-md-3 col-sm-3"></div>
					<div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title">Hakkımızda</h2></div>
					<div class="col-lg-3 col-md-3 col-sm-3"></div>	
				</div>
			</div>
			<div class="flexslider flexslider-about effect2">
			                              <img src="Hotelİmages/bizkimiz.jpg" style="height: 500px"  draggable="false" alt=""/>

			      <div class="flex-caption">
			      	<h3 class="slider-subtitle">Misyon & Vizyon

</h3>
			      	<p class="slider-description">
Her yaştan Misafirlerimize; eşsiz, özgün hizmetler ve benzersiz deneyimler yaşatmak.

Misafirlerimizin mutlu, huzurlu ve sağlıklı tatiller geçirmelerini sağlamak.

Otelcilikte yeniliklere öncü olmak.

 

VİZYONUMUZ

Kalitede süreklilik ve mutlak Misafir memnuniyeti sağlayarak, tercih edilen bir marka yaratmak ve Uluslararası alanda ülkemizi turizm açısından en iyi şekilde temsil etmektir..</p>
			      	
			      </div>			      
			    </li>
			   
			   
			 
			 
			 </ul></div>
			<div class="row">
				<div class="col-lg-12">
                                    <p class="home-description">
                                        <br><!-- < -->
                                    </p>					
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
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
  	<script type="text/javascript" src="js/moment.js"></script>							<!-- moment.js -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>

   	<script type="text/javascript" src="js/templatemo-script.js"></script>      		
	<script>
		$(function() {

			$('#hotelCarTabs a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})

        	$('.date').datetimepicker({
            	format: 'MM/DD/YYYY'
            });
            $('.date-time').datetimepicker();

		
		});
		
		$(window).load(function() {	  		
		
		    $('.flexslider').flexslider({
			    controlNav: false
		    });


	  	});
	</script>
 </body>
 </html>