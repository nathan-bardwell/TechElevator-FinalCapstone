<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<table class="table">
<tr>
	<th>Resident Name</th>
	<th>Address</th>
	<th>Phone Number</th>
	<th>Assigned To</th>
	<th>Update</th>
	
</tr>

<c:forEach var = "house" items = "${houses }">
<tr>
 <td><c:out value = "${house.resident }"/></td>
 <td><c:out value = "${house.address }"/></td>
 <td><c:out value = "${house.phoneNumber }"/></td>
 <td>
 <c:choose>
 <c:when test = "${house.assignmentId == null }">
 	<c:out value = "Not Assigned"/>
 </c:when>
 <c:otherwise>
 	<c:out value = "${house.assignmentId }"/>
 </c:otherwise>
 </c:choose>
 </td>

 	
 	<td>
 	<c:url var = "formAction" value = "/updateAssignment"/>
 	<form action = "${formAction }" method = "POST">
 		<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
 		<input type="hidden" name="houseId" value="${house.houseId}"/>
 		<select name = "assignmentId">
 		<option disabled selected><c:out value = "-----SELECT AN OPTION-----"/></option>
 		
 		<c:forEach var = "team" items = "${teamMembers }">
 			
		 		
		 	
 		<c:if test = "${team.role == 'Salesman' }">
 			<c:if test = "${house.assignmentId != team.userName }">
 				<option value = "${team.userName }"><c:out value = "${team.userName }"/></option>
 			</c:if>
 		
 		
 		</c:if>
 		
 		
 		</c:forEach>
 		<c:if test = "${house.assignmentId != null }">
 			<option value = ""><c:out value = "Remove Assignment"/></option>
 		</c:if>
 		
 		
 		</select>
 		<button type="submit" class="btn"><c:out value="Update" /></button>
 	
 	
 	
 	</form>
 	
 	</td>
 
 

</tr>
</c:forEach>
</table>

<c:import url="/WEB-INF/jsp/footer.jsp" /> 