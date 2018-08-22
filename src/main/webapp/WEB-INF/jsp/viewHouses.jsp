<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<table id="houseTable" class="table">
	<tr>
		<th><c:out value="Resident Name" /></th>
		<th><c:out value="Address" /></th>
		<th><c:out value="Phone Number" /></th>
		<th><c:out value="Assigned To" /></th>
		<th><c:out value="Update" /></th>

	</tr>

	<c:forEach var="house" items="${houses}">
	<c:url var = "houseDetail" value = "/houseDetail?houseId=${house.houseId}"/>
		<tr class="table-row">
			<td><a href="${houseDetail}"><c:out value = "${house.resident}"/></a></td>
			<td><a href="${houseDetail}"><c:out value="${house.address} ${house.city}, ${house.state} " /></a></td>
			<td><a href="${houseDetail}"><c:out value="${house.phoneNumber}" /></a></td>
			<td><c:choose>
					<c:when test="${house.assignmentId == null }">
						<c:out value="Not Assigned" />
					</c:when>
					<c:otherwise>
						<c:out value="${house.assignmentId }" />
					</c:otherwise>
				</c:choose></td>
			<td><c:url var="formAction" value="/updateAssignment" />
				<form action="${formAction }" method="POST">
					<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" /> <input
						type="hidden" name="houseId" value="${house.houseId}" /> <select
						name="assignmentId">
						<option disabled selected><c:out
								value="-----SELECT AN OPTION-----" /></option>
						<c:forEach var="team" items="${teamMembers }">
							<c:if test="${team.role == 'Salesman' }">
								<c:if test="${house.assignmentId != team.userName }">
									<option value="${team.userName }"><c:out
											value="${team.userName }" />
									</option>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${house.assignmentId != null }">
							<option value=""><c:out value="Remove Assignment" /></option>
						</c:if>
					</select>
					<button type="submit" class="btn">
						<c:out value="Update" />
					</button>
				</form></td>
		</tr>
	</c:forEach>
	
</table>

<c:import url="/WEB-INF/jsp/footer.jsp" />
