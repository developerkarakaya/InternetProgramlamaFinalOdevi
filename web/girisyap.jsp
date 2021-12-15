<%-- 
    Document   : girisyap
    Created on : Nov 6, 2021, 10:56:33 PM
    Author     : mirza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Otel Yonetim Giriş Sayfası</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/styles.css" rel="stylesheet">
                
                <style>
                    .login {
  min-height: 100vh;
}

.bg-image {
  background-image: url('https://templehotelsdidim.com/images/temple-miletos-hotel.jpg');
  background-size: cover;
  background-position: center;
}

.login-heading {
  font-weight: 300;
}

.btn-login {
  font-size: 0.9rem;
  letter-spacing: 0.05rem;
  padding: 0.75rem 1rem;
}

                </style>
	</head>
	<body>
		
                
                <div class="container-fluid ps-md-0">
  <div class="row g-0">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
                <h3 class="login-heading mb-4" style="font-weight: bold">Otel Rezervasyon Sistemi Giriş Sayfası</h3>

              
              
              <!-- Sign In Form -->
              <form id="loginForm" class="form col-md-12 center-block"  style="font-size:14px;color:gray" method="POST">
                <div class="form-floating mb-3">
                    <input style="font-size:20px" id="floatingInput" type="text" name="email" class="form-control input-lg" placeholder="Email">
                  <label for="floatingInput">Email</label>
                </div>
                <div class="form-floating mb-3">
                                    <input type="password" name="password" id="floatingPassword" class="form-control input-lg" placeholder="Şifre">
                  <label for="floatingPassword">Şifre</label>
                </div>

                <div class="form-check mb-3">
                    
                </div>

                <div class="d-grid">
                  <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2" type="submit">Giriş Yap</button>
                  <div class="text-center">
                    <a class="small" href="/finalOtelRezervasyon/signup">Hesabınız Yok Mu ? Kayıt Olun !</a>
                  </div>
                </div>

              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

               <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
                <script>
                    $("#loginForm").submit(function(e){
                        e.preventDefault();
                        var form = this;
                        var email = $("#floatingInput").val();
                        var sifre = $('#floatingPassword').val();
                        if(isEmail(email) && sifre!="" && sifre!=null && sifre!='undefined'){
                            form.submit(); 
                        }else{
                            alert("Lütfen E-Mail ve Şifre Giriniz");
                        }
                        
                    });
                    function isEmail(email) {
                        console.log(email);
                        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                        return regex.test(email);
                  }
                </script>
                 
	</body>
</html>