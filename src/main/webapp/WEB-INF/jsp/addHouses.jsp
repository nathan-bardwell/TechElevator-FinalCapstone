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
	<c:url var="addHouseUrl" value="/addHouse"/>
	<form action="${addHouseUrl}" method="POST">
		<div  id="individualHouseForm">
			Address:<br><input type="text" class="form-control"><br>
			Resident Name:<br><input type="text" class="form-control"><br>
			Phone:<br><input type="tel" class="form-control"><br>
			Status:<br><input type="text" class="form-control"><br>
			Notes:<br><textarea class="form-control"></textarea><br>
			<input type="submit" value="Submit" >
		</div>
	</form>
	<c:url var="importCsvUrl" value="/addHousesByCsv"/>
	<form action="${importCsvUrl}" method="POST">
		<div style="display: none" id="importCsvForm">
			<h3>Select CSV file below</h3>
			<input type="file" accept=".csv">
			<input type="submit" value="Submit">
		</div>
	</form>
	</div>
	<div class="col-sm-4"></div>
	</div>


<c:import url="/WEB-INF/jsp/footer.jsp" />