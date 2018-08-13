<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="addHouseUrl" value="/addHouse"/>
<form action="${addHouseUrl}" method="POST">
<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-4">
	Address:<br><input type="text" class="form-control"><br>
	Resident Name:<br><input type="text" class="form-control"><br>
	Phone:<br><input type="tel" class="form-control"><br>
	Status<br><input type="text" class="form-control"><br>
	Notes:<br><textarea class="form-control"></textarea><br>
	<input type="submit" value="Submit" >
	</div>
	<div class="col-sm-4"></div>
	</div>
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />