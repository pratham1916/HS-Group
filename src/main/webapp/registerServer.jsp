<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%
	String name=request.getParameter("fullname");
    String email=request.getParameter("email");  
    String phone=request.getParameter("phno");   
    String password=request.getParameter("password");
    
    try
    {
    	Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
        String sql= "select * from register where email='"+email+"'";
        PreparedStatement pst=con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
      	if(rs.next())
      	{
      		/* session.setAttribute("sesexist","Email Id Already Exist");
       		response.sendRedirect("register.jsp"); */
       	}
      	else
      	{
      	    String sql1="insert into register (name,email,phoneNo,password) values('"+name+"','"+email+"','"+phone+"','"+password+"')";
      	    PreparedStatement pst1=con.prepareStatement(sql1);
      	 	int i = pst1.executeUpdate();
      	  	if(i>0)
      	  	{
      	  		/* session.setAttribute("sesreg",name); */
       			response.sendRedirect("login.jsp");
      	  	}
      	}
    }
    catch(Exception e)
    {
    	
    }
%>