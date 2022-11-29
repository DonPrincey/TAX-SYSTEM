<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%
   	String email = request.getParameter("email");
    String pass = request.getParameter("password");
    
    if(email.equals("admin@edsu.com") && pass.equals("admin")){
    	response.sendRedirect("adminHome.html");
    }
    else
    
    	response.sendRedirect("wrong_password.html");
    
 %>
    


    
    
    
    
    
    
    
    
    
    
    
    
    