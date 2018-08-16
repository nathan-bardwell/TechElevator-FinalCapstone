<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />







<div class = "teamTable">
<table class="table">
<tr>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Email</th>
	
</tr>

<c:forEach var = "teamMember" items = "${teamMembers }">
<tr>
 <td><c:out value = "${teamMember.firstName }"/></td>
 <td><c:out value = "${teamMember.lastName}"/></td>
 <td><c:out value = "${teamMember.email }"/></td>

 

</tr>
</c:forEach>
</table>



</div>

<iframe width="300" height="300" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/view?zoom=10&center=41.4993%2C-81.6944&key=AIzaSyBJfBa4dO1dPPe7d3pKyQ5HkwqX21jLU_o" allowfullscreen></iframe>  
<c:import url="/WEB-INF/jsp/footer.jsp" />