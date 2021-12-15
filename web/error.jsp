<%-- 
    Document   : error
    Created on : Dec 4, 2021, 8:03:06 PM
    Author     : mirza
--%>

<%@page contentType="text/html" isErrorPage="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .card {
  position: relative;
  display: flex;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
  border: 1px solid rgba(0, 0, 0, 0.04);
  border-radius: .25rem;
}

.card .card-header {
  background-color: #fff;
  border-bottom: none;
}
        </style>
          <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
  <link href="css/flexslider.css" rel="stylesheet">
  <link href="css/templatemo-style.css" rel="stylesheet">
    </head>
    <body>
      <div class="row justify-content-center">
    <div class="col-md-12 col-sm-12">
        <div class="card shadow-lg border-0 rounded-lg mt-5 mx-auto" style="width: 30rem;    width: 30rem;
    margin: auto;
    font-size: 47px;
    text-align: center;
    margin-top: 117px;">
            <h3 class="card-header display-1 text-muted text-center">
                404
            </h3>

            <span class="card-subtitle mb-2 text-muted text-center">
                Aradığınız Sayfa Bulunamadı Lütfen Tekrar Deneyiniz !
            </span>

            <div class="card-body mx-auto">
                <a type="button" href="/finalOtelRezervasyon/anasayfa.jsp"
                class="btn btn-sm btn-info text-white"> Anasayfa'ya Git</a>
            </div>
        </div>
    </div>
</div>
    </body>
</html>
