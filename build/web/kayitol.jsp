<%-- 
    Document   : kayitol.jsp
    Created on : Nov 6, 2021, 10:57:12 PM
    Author     : mirza
--%>












<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Otel Yönetim Kayıt Sayfası</title>
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
              <form role="form" action="signup" method="POST" style="color:gray;font-size:14px">
                <div class="form-floating mb-3">
                    <input type="text" name="name" id="name" class="form-control input-sm floatlabel" placeholder="İsim">
                  <label for="floatingInput">İsim</label>
                </div>
                <div class="form-floating mb-3">
                                     <input type="text" name="phone" id="phone" class="form-control input-sm" placeholder="Telefon">     
                                     <label for="floatingPassword">Telefon</label>
                </div>
 <div class="form-floating mb-3">
                   <input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email">
                  <label for="floatingInput">Email</label>
                </div>
                  
                   <div class="form-floating mb-3">
                     <input type="password" name="password" id="password" class="form-control input-sm" placeholder="Şifre">
                                       
                  <label for="floatingInput">Şifre</label>
                </div>
                  
                   <div class="form-floating mb-3">
                   <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Şifre Tekrar">
                                       <label for="floatingInput">Şifre Tekrar</label>
                </div>
                <div class="form-check mb-3">
                    
                </div>

                <div class="d-grid">
                                      <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2" type="submit">Kayıt Ol</button>
                  <div class="text-center">
                    <a class="small" href="/finalOtelRezervasyon/login">Zaten Hesabınız Var Mı ? Giriş Yapın !</a>
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
                 
	</body>
</html>


































