<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="SpringPrac.jdbc.model.Employee,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deleted Employee Details</title>
</head>
<body>
<%
	String s=(String)request.getAttribute("status");
	if(s.equals("Fail"))
	{
%>
<p style="color:red;" align="center">Delete of the employee Failed</p>
<%} else{ 
	Employee e= (Employee)request.getAttribute("empdel");
%>
<h1>Employee Name: <%=e.getEName() %></h1>
<h2>Employee Salary:<%=e.getSalary() %></h2>
<p>Deleted </p><%} %>
<a href="emplist"><button type="button" >Home</button></a>

</body>
</html>