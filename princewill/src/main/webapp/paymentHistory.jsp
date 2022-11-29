

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>All Drivers</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="adminHome.html">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="managePayment.html">Manage Payments</a></li>
                    </ul>
                </div>
            </div>
        </nav>
<h2 style ="text-align:center; color: red" > DRIVERS PAYMENT HISTORY</h2>
<div class="container">

<table id ="drivers_table" class = "table table-bordered table-striped" cellpadding="0" width ="100%">
  <thead>
    <tr>
      <th>S/N</th>
      <th>Driver First Name</th>
      <th>Driver Last Name</th>
      <th>Vehicle Registration Number</th>
      <th>Gender</th>
      <th>Email Address</th>
      <th>Phone Number</th>
      <th>Vehicle Type</th>
      <th>VIEW PAYMENT HISTORY</th>
  </tr>
  </thead>
<%
			Connection con;
			PreparedStatement pst;
			ResultSet rs;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/nwanguma", "root","Nwanguma99");
			String query = "select * from drivers";
			Statement st = con.createStatement();
			rs = st.executeQuery(query);
			
			while(rs.next())
			{
				String plate_number = rs.getString("plate_number");
%>

  <tbody>
        <tr>
        	<td><%=rs.getString("id")%></td>
            <td><%=rs.getString("DFname")%></td>
            <td><%=rs.getString("DLname")%></td>
            <td><%=rs.getString("plate_number")%></td>
            <td><%=rs.getString("gender")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("phone")%></td>
            <td><%=rs.getString("car_type")%></td>
            <td><form method ="post" action ="processPaymentHistory.jsp"><input type="text" name ="plate_number" value="<%=plate_number %>" > <button type="submit">View</button></form></td>
            
         </tr>
  </tbody>
 <%
			}
			
%>
</table>

</div><br /><br />

</body>
</html>


