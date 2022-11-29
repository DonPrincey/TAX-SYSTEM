

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>PAYMENT BY DATES</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		
</head>
<body>
</br>
</br>

<h2 style ="text-align:center; color: red" >PAYMENT BY DATES</h2>
<div class="container">

<table id ="drivers_table" class = "table table-bordered table-striped" cellpadding="0" width ="100%">
  <thead>
    <tr>
      <th>S/N</th>
      <th>DATE OF PAYMENT</th>
      <th>AMOUNT PAID</th>
      <th>PAID BY</th>
      <th>WEEK PAID FOR</th>
  </tr>
  </thead>
<%
			String payment_date = request.getParameter("paymentDate");
			
			Connection con;
			PreparedStatement pst;
			ResultSet rs;
			

			Class.forName("com.mysql.cj.jdbc.Driver");
			con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/nwanguma", "root","Nwanguma99");
			
			
			
			pst = con.prepareStatement("select * from payments where payment_date = ?");
			pst.setString(1,payment_date);
			
			rs = pst.executeQuery();
			
			while(rs.next())
			{
				String id = rs.getString("id");
%>

  <tbody>
        <tr>
        	<td><%=rs.getString("id")%></td>
            <td><%=rs.getString("payment_date")%></td>
            <td><%=rs.getString("amount")%></td>
            <td><%=rs.getString("plate_number")%></td>
            <td><%=rs.getString("week_paid_for")%></td>
        </tr>
  </tbody>
 <%
			}
%>
</table>

</div><br /><br />

</body>
</html>


