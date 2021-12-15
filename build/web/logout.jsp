<%-- 
    Document   : logout
    Created on : Nov 14, 2021, 6:56:19 PM
    Author     : mirza
--%>


<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
  
session.invalidate();
response.sendRedirect("/finalOtelRezervasyon/anasayfa.jsp");
%>