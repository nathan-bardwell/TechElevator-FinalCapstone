<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<h2>
	<c:out value="Information on ${house.resident}'s House:" />
</h2>
<table>
	<tr>
		<th><c:out value="Information on ${house.resident}'s House" /></th>
	</tr>
	<tr>
		<td><c:out value="Address" /></td>
		<td><c:out value="${house.address}" /></td>
	</tr>
	<tr>
		<td><c:out value="Resident" /></td>
		<td><c:out value="${house.resident}" /></td>
	</tr>
	<tr>
		<td><c:out value="Phone Number" /></td>
		<td><c:out value="${house.phoneNumber}" /></td>
	</tr>
	<tr>
		<td><c:out value="Created By" /></td>
		<td><c:out value="${house.creatorId}" /></td>
	</tr>
	<tr>
		<td><c:out value="Assigned To" /></td>
		<td><c:out value="${house.assignmentId}" /></td>
	</tr>

	<tr>
		<td><c:out value="Current Status: " /> <strong> <c:choose>
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
		</strong></td>
		<td>
			<button>
				<c:out value="Change Status" />
			</button>
		</td>
	</tr>
</table>


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
<c:set var="buttonTest" value="false" />
<c:forEach var="note" items="${notes}">
	<table>
		<tr>
			<th><c:out value="Note" /></th>
			<th>
				<c:url var="addNoteUrl" value="/addNote" />
				<form action="${addNoteUrl}" method="GET">
					<input type="hidden" name="houseId" value="${house.houseId}" />
					<c:choose>
						<c:when test="${buttonTest == false}">
							<button><c:out value="New Note" /></button>
							<c:set var="buttonTest" value="true" />
						</c:when>
					</c:choose>
				</form>
			<th>
			<th><c:out value="Timestamp" /></th>
		</tr>
		<tr>
			<td><c:out value="${note.text}" /></td>
			<td></td>
			<td><c:out value="${note.timestamp}" /></td>
		</tr>
	</table>
</c:forEach>


<iframe width="300" height="300" frameborder="0" style="border: 0"
	src="https://www.google.com/maps/embed/v1/view?zoom=10&center=41.4993%2C-81.6944&key=AIzaSyBJfBa4dO1dPPe7d3pKyQ5HkwqX21jLU_o"
	allowfullscreen></iframe>
<c:import url="/WEB-INF/jsp/footer.jsp" />