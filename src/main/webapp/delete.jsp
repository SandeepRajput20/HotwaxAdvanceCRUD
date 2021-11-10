<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	String id = request.getParameter("id");
	System.out.println(id);
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql:///advancehotwax", "root", "root");
		Statement st = conn.createStatement();
		int i = st.executeUpdate("DELETE FROM party WHERE partyid="+id+"");
		out.println("<h1>Data Deleted Successfully!</h1>");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
	%>

</body>
</html>