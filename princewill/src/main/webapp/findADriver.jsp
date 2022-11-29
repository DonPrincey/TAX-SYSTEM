<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import ="java.sql.*"%>
<%
      String plate_number = request.getParameter("plate_number");
		Connection con;
		PreparedStatement pst;
		ResultSet rs;   
		Class.forName("com.mysql.cj.jdbc.Driver");
		con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/nwanguma", "root","Nwanguma99");



		pst = con.prepareStatement("select * from drivers where plate_number = ?");
		pst.setString(1,plate_number);

		rs = pst.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Driver Search</title>
<link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="adminHome.html">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        
                        <li class="nav-item"><a class="nav-link" href="login.html">Log out</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        </br>
        </br>
<div class= "container px-4 px-lg-5" style ="text-align:center">
<h2 style ="text-align:center; color: red" >SELECTED DRIVER DETAILS</h2>


</br>
</br>


<%

while(rs.next())
{

	String fname = rs.getString("DFname");
	String lname = rs.getString("DLname");
	plate_number = rs.getString("plate_number");
	String phone = rs.getString("phone");
	

	
	out.print("<strong>DRIVER FIRST NAME: </strong>"+ fname+"</br>");
	out.print("<strong>DRIVER LAST NAME: </strong>"+ lname+"</br>");
	out.print("<strong>DRIVER'S PHONE: </strong>"+ phone+"</br>");
	out.println("<strong>VEHICLE NUMBERL </strong>"+ plate_number+"</br>");			
	
}	

%>
	
</div>
</body>
</html>
