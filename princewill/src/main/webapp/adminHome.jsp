<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>


<%
    
        String DFname = request.getParameter("DFname");
        String DLname = request.getParameter("DLname");
        String plate_number = request.getParameter("plate_number");
        String gender = request.getParameter("inlineRadioOptions");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String car_type = request.getParameter("car_type");
      
       Connection con;     
       Class.forName("com.mysql.cj.jdbc.Driver");
       con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/nwanguma", "root","Nwanguma99");  
       PreparedStatement pst = con.prepareStatement("insert into drivers (DFname,DLname,plate_number,gender, email,phone,car_type ) values(?,?,?,?,?,?,?)");
          
           
           pst.setString(1, DFname);
           pst.setString(2,DLname);
           pst.setString(3,plate_number);
           pst.setString(4,gender);
           pst.setString(5, email);
           pst.setString(6,phone);
           pst.setString(7,car_type);
          
           pst.executeUpdate();
       
       %>
    <script type="text/javascript">
	alert("Driver Record Added Successfully. You want to add another?");
	</script>
	
	<%
	response.sendRedirect("adminHome.html"); 
	%>
	
       
       
       
    



