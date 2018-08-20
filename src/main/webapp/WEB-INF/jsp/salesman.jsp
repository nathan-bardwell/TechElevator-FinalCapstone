<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />


<h2><c:out value = "You Have Been Assigned The Following Houses:"/></h2>

<table class="table">
<tr>
	<th><c:out value="Resident Name" /></th>
	<th><c:out value="Address" /></th>
	<th><c:out value="Phone Number" /></th>
	<th><c:out value="Status" /></th>
</tr>

<c:forEach var = "house" items = "${houses }">
<tr>
 <c:url var = "detailPageUrl" value = "/houseDetail?houseId=${house.houseId}"/>	
 <td><a href = "${detailPageUrl }"><c:out value = "${house.resident }"/></a></td>
 <td><c:out value="${house.address} ${house.city }, ${house.state } " /></td>
 <td><c:out value = "${house.phoneNumber }"/></td>
 <td>
 	<c:choose>
		<c:when test="${house.status == 'NV'}">
			<c:out value="Not Visited" />
		</c:when>
		<c:when test="${house.status == 'NI'}">
			<c:out value="Not Interested" />
		</c:when>
		<c:when test="${house.status == 'O'}">
			<c:out value="Order Placed" />
		</c:when>
		<c:when test="${house.status == 'CL'}">
			<c:out value="Closed" />
		</c:when>
		<c:when test="${house.status == 'FU'}">
			<c:out value="Follow Up Required" />
		</c:when>
 	</c:choose>
 </td>	


</tr>
</c:forEach>
</table>

<form>
<select name="mapHouses" id="mapHouse">
	<option disabled selected><c:out value="Choose Address To View" /></option>
	<c:forEach var="mapHouse" items="${houses}">
		<option value="${mapHouse.address}"><c:out value="${mapHouse.address}" /></option>
	</c:forEach>
</select>
<div class="mapouter">
	<div class="gmap_canvas">
		<iframe width="600" height="500" id="gmap_canvas"
			src="https://maps.google.com/maps?q=${house.address}${house.city}${house.state}&t=&z=13&iwloc=&output=embed"
			frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
		<a href="https://www.pureblack.de">webdesigner</a>
	</div>
<style>
.mapouter {
	text-align: right;
	height: 500px;
	width: 600px;
}

.gmap_canvas {
	overflow: hidden;
	background: none !important;
	height: 500px;
	width: 600px;
}
</style>
</div> 
</form>
<c:import url="/WEB-INF/jsp/footer.jsp" />