<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<table width="800px" align="center" style="border: 1px solid;">
		<tr>
			<td colspan=8 align="center"><b>Search Result</b></td>
		</tr>
		<tr>
			<td><b>PartyId</b></td>
			<td><b>FirstName</b></td>
			<td><b>LastName</b></td>
			<td><b>Address</b></td>
			<td><b>City</b></td>
			<td><b>PinCode</b></td>
			<td><b>State</b></td>
			<td><b>Country</b></td>
			<td><b>Phone</b></td>
		</tr>
		<%
		int count = 0;
		if (request.getAttribute("userDetail") != null) {
			ArrayList al = new ArrayList(15);
			al = (ArrayList) request.getAttribute("userDetail");
			Iterator itr = al.iterator();

			while (itr.hasNext()) {

				count++;
				ArrayList userDetail = (ArrayList) itr.next();
		%>
		<tr>
			<td><%=userDetail.get(0)%></td>
			<td><%=userDetail.get(1)%></td>
			<td><%=userDetail.get(2)%></td>
			<td><%=userDetail.get(3)%></td>
			<td><%=userDetail.get(4)%></td>
			<td><%=userDetail.get(5)%></td>
			<td><%=userDetail.get(6)%></td>
			<td><%=userDetail.get(7)%></td>
			<td><%=userDetail.get(8)%></td>
			<td><a href="delete.jsp?id=<%=userDetail.get(0)%>"><button type="button" class="Delete">Delete</button></a></td>
			<td><a href="update.jsp?id=<%=userDetail.get(0)%>"><button type="button" class="UpDate">Edit</button></a></td>

		</tr>
		<%
		}
		}
		%>
		<%
		if (count == 0) {
		%>
		<tr>
			<td colspan=8 align="center"><b>No Record</b></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>