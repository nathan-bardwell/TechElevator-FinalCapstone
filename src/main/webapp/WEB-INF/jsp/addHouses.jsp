<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="customScriptUrl" value="/js/custom-methods.js"/>
<script src="${customScriptUrl}"></script>


<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		How would you like to add houses?<br>
		<form>
		<select id="formToggler" class="form-control">
			<option>--Select one--</option>
			<option value="individual" >Individually</option>
			<option  value="csv">Import CSV</option>
		</select>
		</form>
	</div>
	<div class="col-sm-4"></div>
</div>
<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
	<c:url var="addHouseUrl" value="/addHouses"/>
	<form action="${addHouseUrl}" method="POST">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
		<div  style="display:none" id="individualHouseForm">
			Address: *<br><input type="text" name="address" class="form-control" required><br>
			Resident Name: *<br><input type="text" name="resident" class="form-control" required><br>
			Phone: <br><input type="tel" name="phoneNumber" class="form-control" ><br>
			Status: *<br><select name="status" class="form-control" required>
				<option disabled selected value>--Select a status--</option>
				<option value="NV">Not Visited</option>
				<option value="O">Ordered</option>
				<option value="NI">Not Interested</option>
				<option value="FU">Follow Up</option>
				<option value="NS">No Solicitors</option>
			</select><br>
			Notes:<br><textarea class="form-control" name="notes"></textarea><br>
 		<!-- <input type="submit" value="Submit" > -->
			<button type = "submit" class = "btn btn-default"><c:out value = "Submit"/></button>
		</div>
	</form>
	
	<c:url var="importCsvUrl" value="/addHousesByCsv"/>
	<form action="${importCsvUrl}" method="POST">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
		<div style="display: none" id="importCsvForm">
			<h3>Select CSV file below</h3>
			<input type="file" name="path" accept=".csv">
			<input type="submit" value="Submit">
		</div>
	</form>
	 
	</div>
	<div class="col-sm-4"></div>
</div> 

<c:url var="addHouseUrl" value="/addHouses"/>

<c:import url="/WEB-INF/jsp/footer.jsp" /> 