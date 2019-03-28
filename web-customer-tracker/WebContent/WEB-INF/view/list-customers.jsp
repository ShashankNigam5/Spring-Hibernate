<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>

<head>

<title>
List Customers
</title>

<!-- reference style sheet -->
<link type="text/css"
 	  rel="styleSheet"
 	  href="${pageContext.request.contextPath}/resources/css/style.css" /> <!-- it will give name og the app -->

</head>
<body>

		<div id="wrapper">
				
			<div id="header">
			CRM: Customer Relationship Management
			</div>
		</div>
		
		<div id="container">
		<div id="content">
		
		<!-- put new button -->
			
			<input type="button" value = "Add Customer"
			       onclick="window.location.href='showFormForAdd'; return false;"
			       class="add-button"
			/>
			
			<!-- add out html tsble here -->
			<table>
			  <tr>
			  	<th> First Name </th>			  	
			  	<th> Last Name </th>			  	
			  	<th> Email </th>
			  	<th> Action <th>
			  </tr>
			
			<c:forEach var="tempCustomer" items="${customers}">
				<!-- construct an update link with customer id -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
					<!-- construct an update link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
			      <tr>
			  		<td> ${tempCustomer.firstName} </td>			  	
			  		<td> ${tempCustomer.lastName} </td>			  	
			  		<td> ${tempCustomer.email} </td>
			  		
			  		<td>
			  			<!-- display the update link -->
			  			<a href="${updateLink}">Update</a>
			  			|
			  			<a href="${deleteLink}"
			  			   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
			  	  </tr>
			
			</c:forEach>
			</table>
			
			
			</div>
		</div>


</body>

</html>