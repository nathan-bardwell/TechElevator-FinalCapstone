<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<table class="table">
<tr>
	<th>Resident Name</th>
	<th>Address</th>
	<th>Phone Number</th>
	<th>Assigned To</th>
</tr>

<c:forEach var = "house" items = "${houses }">
<tr>
 <td><c:out value = "${house.resident }"/></td>
 <td><c:out value = "${house.address }"/></td>
 <td><c:out value = "${house.phoneNumber }"/></td>
 <c:choose>
 	<c:when  test = "${house.assignmentId == null }">
 	<td><c:out value = "Not Assigned"/></td>
 	</c:when>
 	<c:otherwise>
 	<td><c:out value = "${house.assignmentId }"/></td>
 	</c:otherwise>
 </c:choose>
 

</tr>
</c:forEach>
</table>

<c:import url="/WEB-INF/jsp/footer.jsp" /> 