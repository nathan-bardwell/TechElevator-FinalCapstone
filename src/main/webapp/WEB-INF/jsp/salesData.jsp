<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>Sales Data:</h2>

<c:url var="formAction" value="/salesData" />
<form method = "GET" action = "${formAction }">
		<label for="sort">Sort By:</label> 
		<select name="sort"	id="sort">
			<option value="timestamp">Time</option>
			<option value="userId">Salesman</option>
			<option value="status">Status</option>

			
		</select>
<input type = "submit" value = "Get Data"/>

</form>

<div class = "teamTable">
<table class="table">
<tr>
	<th>Resident</th>
	<th>Address</th>
	<th>Salesmen</th>
	<th>Current Status</th>

	
</tr>

	<c:forEach var = "house" items = "${houses }">
	<c:url var = "houseDetail" value = "/houseDetail?houseId=${house.houseId }"/>
	
		<tr>
		<td><a class = "nameLink" href = "${houseDetail}"><c:out value = "${house.resident }"/></a></td>
		<td><c:out value = "${house.address }"/></td>
		<td><a class = "nameLink" href ="#"><c:out value = "${house.assignmentId }"/></a></td>
		<td><c:out value = "${house.status }"/></td>
		</tr>
		

	</c:forEach>
</table>



</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />