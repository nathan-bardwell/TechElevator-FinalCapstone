<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url var="addHouseUrl" value="/addHouse"/>
<form action="${addHouseUrl}">
	Address:<br><input type="text">
	Resident Name:<br><input type="text">
	Phone:<br><input type="tel">
	Status<br><input type="text">
	Notes:<br><textarea></textarea>
	<input type="submit" value="Submit">
</form>

<c:import url="/WEB-INF/jsp/footer.jsp" />