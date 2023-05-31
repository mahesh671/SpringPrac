<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="SpringPrac.jdbc.model.Employee,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees List through Spring JDBC Template</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	function deleteEmp(empno)
	{
		$.ajax({
			url:"deleteEmp",
			method:"post",
			data:{
				empno:empno
			},
			success:function(data)
			{
				location.reload();
			}
			
		});
	}

</script>
</head>
 <BODY BGCOLOR="yellow" align="center">
       <H1>Employees List through Spring JDBC Template </H1>
		<a href="/SpringPrac/addnewemp"><button>Add Employee</button></a>
      <TABLE BORDER="1" align="center">
      <TR>
      <TH>Emp No</TH>
      <TH>Name</TH>
      <TH>Job</TH>
      <TH>Salary</TH>
      <TH>Dept No</TH>
      <th>Delete</th>
      </TR>
      <% 
      	
        List<Employee> elist=(List<Employee>)request.getAttribute("elist");
		for(Employee e:elist){
	  %>
      	<TR>
       		  <TD> <%= e.getEmpNo() %></td>
     		  <TD> <%= e.getEName() %></TD>
      		  <TD> <%= e.getJob() %></TD>
     		  <TD> <%= e.getSalary() %></TD>
     		  <TD> <%= e.getDeptNo() %></TD>
     		  <td><button onclick="deleteEmp(<%=e.getEmpNo()%>)">Delete</button></td>
      </TR>
      <% 
      	} 
      %>
     </TABLE>
     
     <div>
     <form>
     
     </form>
     
     </div>
     </BODY>
</html>