<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String email1=request.getParameter("emailtxt");
   try
   {
	   	Class.forName("com.mysql.jdbc.Driver");
   	 	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce","root","");
    	String sql="select * from register where email='"+email1+"'";
       	PreparedStatement pst=con.prepareStatement(sql);
       	ResultSet rs=pst.executeQuery();
       	if(rs.next())
       	{
       		/* session.setAttribute("sessionemail", "dummy"); */
       		out.print("Email Already Exists");
       	}
       	/* else
       		session.setAttribute("sessionemail", null); */
   }
   catch(Exception e)
   {
	   out.println(e);
   }
%>