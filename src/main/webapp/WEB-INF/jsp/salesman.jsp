<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />


<h2><c:out value = "You Have Been Assigned The Following Houses:"/></h2>

<table class="table">
<tr>
	<th>Resident Name</th>
	<th>Address</th>
	<th>Phone Number</th>
	<th>Status</th>
</tr>

<c:forEach var = "house" items = "${houses }">
<tr>
 <c:url var = "detailPageUrl" value = "/houseDetail?houseId=${house.houseId}"/>	
 <td><a href = "${detailPageUrl }"><c:out value = "${house.resident }"/></a></td>
 <td><c:out value = "${house.address }"/></td>
 <td><c:out value = "${house.phoneNumber }"/></td>
 <td>
 	<c:choose>
 		<c:when test = "${house.status == 'NV' }">
 		<c:out value = "Not Visited"/>
 		</c:when>
 		<c:when test = "${house.status == 'NS' }">
 		<c:out value = "No Solicitors"/>
 		</c:when>
 		<c:when test = "${house.status == 'O' }">
 		<c:out value = "Ordered"/>
 		</c:when>
 		<c:when test = "${house.status == 'FU' }">
 		<c:out value = "Follow Up"/>
 		</c:when>
 		<c:when test = "${house.status == 'NI' }">
 		<c:out value = "Not Interested"/>
 		</c:when>
 	
 	</c:choose>
 </td>	


</tr>
</c:forEach>
</table>

<iframe width="300" height="300" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/view?zoom=10&center=41.4993%2C-81.6944&key=AIzaSyBJfBa4dO1dPPe7d3pKyQ5HkwqX21jLU_o" allowfullscreen></iframe> 
<c:import url="/WEB-INF/jsp/footer.jsp" />