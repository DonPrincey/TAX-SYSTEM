<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>


<%
    
        String DFname = request.getParameter("DFname");
        String DLname = request.getParameter("DLname");
        String plate_number = request.getParameter("plate_number");
        String payment_date = request.getParameter("payment_date");
        String amount = request.getParameter("amount");
        String week_paid_for = request.getParameter("week_paid_for");
        
      
       Connection con;     
       Class.forName("com.mysql.cj.jdbc.Driver");
       con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/nwanguma", "root","Nwanguma99");  
       PreparedStatement pst = con.prepareStatement("insert into payments (DFname,DLname,plate_number,payment_date, amount,week_paid_for) values(?,?,?,?,?,?)");
          
           
           pst.setString(1, DFname);
           pst.setString(2,DLname);
           pst.setString(3,plate_number);
           pst.setString(4,payment_date);
           pst.setString(5, amount);
           pst.setString(6,week_paid_for);
          
           pst.executeUpdate();
       
       %>
    <script type="text/javascript">
	alert("Driver Record Added Successfully. You want to add another?");
	</script>
	
	<%
	response.sendRedirect("adminHome.html"); 
	%>
	
       
       
       
    



