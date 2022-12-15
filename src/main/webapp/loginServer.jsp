<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String username = request.getParameter("uname");
String password = request.getParameter("pass");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commerce", "root", "");
	String sql = "select * from register where phoneNo = '"+username+"' OR email ='"+username+"' and password='" + password + "'";
	PreparedStatement pst = con.prepareStatement(sql);
	ResultSet rs = pst.executeQuery();
	if (rs.next()) 
	{
		response.sendRedirect("home.jsp");
	}
	else
	{
		session.setAttribute("seslogfail","Login Failed");
		response.sendRedirect("login.jsp");
	}

}
catch (Exception ex) 
{
	out.println(ex);
}
%>


<!-- if(user.equalsIgnoreCase(usertype)) 
		{
			if (user.equalsIgnoreCase("Student"))
			{
				session.setAttribute("seslog",username);
				session.setAttribute("seslog1",usertype);
				response.sendRedirect("AdminDashboard.jsp");
			} 
			else if (user.equalsIgnoreCase("Admin"))
			{
				session.setAttribute("seslog",username);
				session.setAttribute("seslog1",usertype);
				response.sendRedirect("AdminDashboard.jsp");
			}
		}
		else
		{
				session.setAttribute("seslogf", "Login Failed");
				response.sendRedirect("login.jsp");
		} --> 