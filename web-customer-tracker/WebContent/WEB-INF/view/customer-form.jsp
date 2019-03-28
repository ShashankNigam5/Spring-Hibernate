<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
	<title>
	Save Customer
	</title>
	
	<link type="text/css"
 	  rel="styleSheet"
 	  href="${pageContext.request.contextPath}/resources/css/style.css" /> <!-- it will give name og the app -->
	
	<link type="text/css"
 	  rel="styleSheet"
 	  href="${pageContext.request.contextPath}/resources/css/add-customer-style.css" /> <!-- it will give name og the app -->
	
</head>

<body>
	<div id="wrapper">
		<div od="header">
		<h2>CRM: Customer Relationship Management</h2>
		</div>
	</div>
	
	<div id="container">
	<h3>Save Customer</h3>
	
	<form:form action="saveCustomer" modelAttribute="customer" method="POST">
	
		<!-- need to associate this data with customer id -->
		<form:hidden path="id" />
		<table>
			<tbody>
				<tr>
					<td><label>First Name:</label></td>
					<td><form:input path="firstName" /></td>	
		
				</tr>
				
				<tr>
					<td><label>Last Name:</label></td>
					<td><form:input path="lastName" /></td>	
		
				</tr>
				
				<tr>
					<td><label>Email:</label></td>
					<td><form:input path="email" /></td>	
		
				</tr>
				
				<tr>
					<td><label></label></td>
					<td><input type="submit"  class="save"/></td>	
		
				</tr>
			</tbody>
		</table>
		
	</form:form>
	
	<div style="clear;both;"></div>
	<p>
		<a  href="${pageContext.request.contextPath}/customer/list">Back to List</a>
	
	</div>

</body>

</html>
