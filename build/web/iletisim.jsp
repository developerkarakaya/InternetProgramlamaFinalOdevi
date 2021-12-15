<%-- 
    Document   : iletisim
    Created on : Nov 6, 2021, 10:51:36 PM
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
	

	<section class="section-padding-bottom">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">İletişim</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"></div>	
				</div>				
			</div>
                    
			<div class="row">
                               <%
                          String msg = (String) session.getAttribute("msgiletisim");
                        if(msg!=null) {
                            %>
                        
                            <div class="alert alert-success" > ${msgiletisim}</div>

                        <%
                            session.setAttribute("msgiletisim",null);
                        }
                        %>
				<form action="mesajgonder" method="POST" class="tm-contact-form">
                                    <input type="hidden" value="mesajgonder" name="mesaj" >
					<div class="col-lg-3 col-md-6">
						
					</div> 
					<div class="col-lg-6 col-md-6 tm-contact-form-input">
						<div class="form-group">
							<input type="text" id="contact_name" class="form-control" name="isim" placeholder="İsim">
						</div>
						<div class="form-group">
                                                    <input type="email" id="contact_email" class="form-control" name="email" placeholder="Email">
						</div>
						<div class="form-group">
                                                    <input type="text" id="contact_subject" class="form-control" name="konu" placeholder="Konu">
						</div>
						<div class="form-group">
                                                    <textarea id="contact_message" class="form-control" rows="6" name="mesajText" placeholder="Mesaj"></textarea>
						</div>
						<div class="form-group">
							<button class="tm-submit-btn" style="background-color: black; color:white;" type="submit" name="submit">Mesaj Gönder</button> 
						</div>               
					</div>
				</form>
                            <br>
                          
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

 </body>
 </html>