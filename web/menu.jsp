<%-- 
    Document   : menu
    Created on : Dec 4, 2021, 10:35:34 PM
    Author     : mirza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
  				<div class="col-lg-2 col-md-4 col-sm-3 tm-site-name-container">
  					<a href="#"  style="font-size: 14px; color:white">Otel Yönetim Sistemi</a>	
  				</div>
	  				<div class="mobile-menu-icon">
		              <i class="fa fa-bars"></i>
		            </div>
	  				<nav class="tm-nav" style="float:right">
						<ul>
							<li><a href="anasayfa.jsp" >Anasayfa</a></li>
							<li><a href="hakkimizda.jsp">Hakkımızda</a></li>
							<li><a href="odalarimiz.jsp">Odalarımız</a></li>
                                                        <li><a href="iletisim.jsp">İletişim</a></li>
                                                        

                                                        <%
       String username = (String) session.getAttribute("UserName");
       String name="";
      if (username != null) {
                name = username;
      }
      else {
         %>
                                                        
                             <li><a href="/finalOtelRezervasyon/login">Giriş Yap</a></li>
                       
                                          <%
      }
if(name!="") {
    %>
                                            
   
    
    <%
        
        String type = (String) session.getAttribute("sessionType");
    if(type.equals("admin")) {
        %>
        <li><a href="rezervasyonyap.jsp">Yönetim Paneli</a></li>

                             <%
    }
    else {
        %>
                             
        
            <li><a href="rezervasyonyap.jsp">Rezervasyon Yap</a></li>
<%
    }
    
    %>
    
    
                                                                
    <li><a href="">Hoş Geldin , <%=name%></a></li>
                                                  <li><a href="logout.jsp">Çıkış Yap</a></li>

    
                                                        <%
}
else {
%>
             
                                                        
                                                        <%
    
}
%>
                                                        
						</ul>
					</nav>		
  			</div>
