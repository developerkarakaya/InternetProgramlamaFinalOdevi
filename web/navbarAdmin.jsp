<%-- 
    Document   : navbarAdmin
    Created on : Dec 4, 2021, 4:20:52 PM
    Author     : mirza
--%>
<%@page import="java.lang.Thread.State"%>
<%@page import="jdk.jshell.spi.ExecutionControl.ExecutionControlException"%>
<%-- import java packets --%>
<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
 <div class="nav">
     
     
     
     <%
                               String sessionType = (String) session.getAttribute("sessionType");
                               

     if(sessionType.equals("admin")) {
     
         %>
       <a class="nav-link" href="/finalOtelRezervasyon/rezervasyonyap.jsp">
                                <div class="sb-nav-link-icon"></div>
                               Anasayfa
                            </a>
        <a class="nav-link" href="/finalOtelRezervasyon/odaekleme.jsp">
                                <div class="sb-nav-link-icon"></div>
                                Oda Ekleme
                            </a>
               <a class="nav-link" href="/finalOtelRezervasyon/adminodalistesi.jsp">
                                <div class="sb-nav-link-icon"></div>
                                Oda Listesi
                            </a>
                        <a class="nav-link" href="/finalOtelRezervasyon/musterilistesi.jsp">
                                <div class="sb-nav-link-icon"></div>
                                Müşteri Listesi
                            </a>
                            <a class="nav-link" href="/finalOtelRezervasyon/musteriekleme.jsp">
                                <div class="sb-nav-link-icon"></div>
                                Müşteri Ekleme
                            </a>
                             <a class="nav-link"  href="/finalOtelRezervasyon/rezervasyonlistesi">
                                <div class="sb-nav-link-icon"></div>
                                Rezervasyon Listesi
                            </a>
                             <a class="nav-link"  href="/finalOtelRezervasyon/manzaraekleme.jsp">
                                <div class="sb-nav-link-icon"></div>
                                Manzara Ekleme
                            </a>
        <a class="nav-link" href="/finalOtelRezervasyon/mesajlistesi.jsp" >
                                <div class="sb-nav-link-icon"></div>
                                Gelen Mesajlar
                            </a>
                             <a class="nav-link" href="/finalOtelRezervasyon/bilgilerimiguncelle.jsp" >
                                <div class="sb-nav-link-icon"></div>
                                Bilgilerimi Güncelle
                            </a>
     <%
         
         
     }
else 
{
%>
     
     
       <a class="nav-link"  href="/finalOtelRezervasyon/rezervasyonlarim.jsp" >
                                <div class="sb-nav-link-icon"></div>
                                Rezervasyonlarım
                            </a>
                             <a class="nav-link"  href="/finalOtelRezervasyon/odalistesi.jsp" >
                                <div class="sb-nav-link-icon"></div>
                                Oda Listesi - Rezervasyon Yap
                            </a>
                             <a class="nav-link" href="/finalOtelRezervasyon/bilgilerimiguncelle.jsp" >
                                <div class="sb-nav-link-icon"></div>
                                Bilgilerimi Güncelle
                            </a>
     
     
       <a class="nav-link" >
                           Yaptığınız Rezervasyon Sayısı <%
                           Cookie[] cookies = request.getCookies();

if (cookies != null) {
 for (Cookie cookie : cookies) {
   if (cookie.getName().equals("RezervasyonSayisi")) {
       %>
       <span><%=cookie.getValue()%></span>
                           
                           <%
    }
  }
}
                           
                           %>
                            </a>
     <%
}
     
     
     
     
     %>
                           
                                  <a class="nav-link">
                                <div class="sb-nav-link-icon"></div>
                               Son Oturum  <%=new Date(session.getCreationTime())%>
                            </a>
                               <a class="nav-link" >
                                <div class="sb-nav-link-icon"></div>
                           Son Erişim  <%=new Date(session.getLastAccessedTime())%>
                            </a>
                            
                          
                            <a class="nav-link"  href="/finalOtelRezervasyon/anasayfa.jsp">
                                <div class="sb-nav-link-icon"></div>
                        Siteye Git
                            </a>
                            
                            
                            <%
                           Cookie[] cookies = request.getCookies();

if (cookies != null) {
 for (Cookie cookie : cookies) {
   if (cookie.getName().equals("USER_EPOSTA")) {
       %>
                   
       <a class="nav-link"  style="font-size:13px" href="/finalOtelRezervasyon/anasayfa.jsp">
                                <div class="sb-nav-link-icon"></div>
                       <%=cookie.getValue()%>
                            </a>
                           <%
    }
  }
}
                           
                           %>
                            
                        </div>