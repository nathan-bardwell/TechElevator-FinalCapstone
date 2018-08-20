<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />


<h2>
	<c:out value="Information on ${house.resident}'s House:" />
</h2>
<table>
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
			</strong>
		</td>
		<td>
			<c:url var="formAction" value="/updateStatus" />
			<form action="${formAction}" method="POST">
				<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> 
				<input type="hidden" name="houseId" value="${house.houseId}" /> 
				<select name="status">
					<option disabled selected>
						<c:out value="-- Update Status --" />
					</option>
					<c:if test="${house.status != 'FU'}">
						<option value="FU"><c:out value="Follow Up" /></option>
					</c:if>
					<c:if test="${house.status != 'NV'}">
						<option value="NV"><c:out value="Not Visited" /></option>
					</c:if>
					<c:if test="${house.status != 'NI'}">
						<option value="NI"><c:out value="Not Interested" /></option>
					</c:if>
					<c:if test="${house.status != 'O'}">
						<option value="O"><c:out value="Ordered" /></option>
					</c:if>
					<c:if test="${house.status != 'CL'}">
						<option value="CL"><c:out value="Closed" /></option>
					</c:if>
				</select>
				<button type="submit" class="btn btn-submit">
					<c:out value="Update" />
				</button>
			</form>
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

<table>
	<tr>
		<th><c:out value="Note" /></th>
		<th>
			<c:url var="addNoteUrl" value="/addNote" />
			<form action="${addNoteUrl}" method="GET">
				<input type="hidden" name="houseId" value="${house.houseId}" />
				<button><c:out value="New Note" /></button>
			</form>
		</th>
		<th><c:out value="Timestamp" /></th>
	</tr>
	<c:forEach var="note" items="${notes}">
		<tr>
			<td><c:out value="${note.text}" /></td>
			<td></td>
			<td><c:out value="${note.timestamp}" /></td>
		</tr>
	</c:forEach>
</table>

<c:import url="/WEB-INF/jsp/footer.jsp" />