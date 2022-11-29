

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
</br>
</br>
<div class="container">
		<form method = "post" action = "findADriver.jsp">
          <div class="input-group">
  				<input type="text" name ="plate_number" class="form-control rounded" placeholder="Enter Vehicle Registration Number" aria-label="Search" aria-describedby="search-addon" />
  				<input class="btn btn-primary btn-lg" type="submit" id="Search" name="submit" value="Search" />
		</div>
		</form>
</div>

<h2 style ="text-align:center; color: red" >ALL REGISTERED DRIVERS</h2>
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
				String id = rs.getString("id");
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
         </tr>
  </tbody>
 <%
			}
%>
</table>

</div><br /><br />

</body>
</html>


