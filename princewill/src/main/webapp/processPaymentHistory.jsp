<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>ALL HOSTEL APPLICATIONS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-4.3.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		
</head>
<body>
<div class ="container">
<table id ="drivers_table" class = "table table-bordered table-striped" cellpadding="0" width ="100%">
  <thead>
    <tr>
      <th>Driver ID</th>
       <th>Vehicle Registration Number</th>
      <th>Driver First Name</th>
      <th>Driver Last Name</th>
      <th>Payment Date</th>
      <th>Amount Paid</th>
      <th>Week Paid For</th>
  </tr>
  </thead>
<%			String plate_number = request.getParameter("plate_number");
			
			
			Connection con;
			PreparedStatement pst;
			ResultSet rs;

			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/nwanguma", "root","Nwanguma99");
			
			
			
			pst = con.prepareStatement("select * from payments where plate_number = ?");
			pst.setString(1,plate_number);
			
			rs = pst.executeQuery();
			String [] arr = new String[7]; 
			
			while(rs.next())
			{
			String id = rs.getString("id");
			plate_number = rs.getString("plate_number");
			String DFname = rs.getString("DFname");
			String DLname = rs.getString("DLname");
			String payment_date = rs.getString("payment_date");
			String amount = rs.getString("amount");
			String week_paid_for = rs.getString("week_paid_for");
			
            
			arr[0]=id; arr[1] = plate_number; arr[2] = DFname; arr[3] = DLname; arr[4] = payment_date;
               arr[5] = amount; arr[6] = week_paid_for;
		   
               
               %>
       <tbody>
        <tr>
        	<td><%=arr[0]%></td>
            <td><%=arr[1]%></td>
            <td><%=arr[2]%></td>
            <td><%=arr[3]%></td>
            <td><%=arr[4]%></td>
            <td><%=arr[5]%></td>
            <td><%=arr[6]%></td>
         </tr>
  </tbody><%
   
               
           
			}
//Create a Table to Display the Payment History
     
%>
</table>
</div>
</body>

</body>
</html>