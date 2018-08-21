<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/WEB-INF/jsp/header.jsp" />
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.3.3/dist/leaflet.css"
	integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.3.3/dist/leaflet.js"
	integrity="sha512-tAGcCfR4Sc5ZP5ZoVz0quoZDYX5aCtEm/eu1KhSLj2c9eFrylXZknQYmxUssFaVJKvvc0dJQixhGjG2yXWiV9Q=="
	crossorigin=""></script>


<h2>
	<c:out value="You Have Been Assigned The Following Houses:" />
</h2>

<table class="table">
	<tr>
		<th><c:out value="Resident Name" /></th>
		<th><c:out value="Address" /></th>
		<th><c:out value="Phone Number" /></th>
		<th><c:out value="Status" /></th>
	</tr>

	<c:forEach var="house" items="${houses }">
		<tr>
			<c:url var="detailPageUrl"
				value="/houseDetail?houseId=${house.houseId}" />
			<td><a class="nameLink" href="${detailPageUrl }"><c:out
						value="${house.resident }" /></a></td>
			<td class="address"><c:out
					value="${house.address} ${house.city }, ${house.state } " /></td>
			<td><c:out value="${house.phoneNumber }" /></td>
			<td><c:choose>
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
				</c:choose></td>

		</tr>
	</c:forEach>
</table>

<form>
	<select name="mapHouses" id="mapHouse">
		<option disabled selected><c:out
				value="Choose Address To View" /></option>
		<c:forEach var="mapHouse" items="${houses}">
			<option value="${mapHouse.address}"><c:out
					value="${mapHouse.address}" /></option>
		</c:forEach>
	</select>
</form>

<div id="mapid"></div>
<style>
#mapid {
	height: 50rem;
	width: 75rem;
}
</style>

<script>

navigator.geolocation.getCurrentPosition(function(location) {
	  console.log(location.coords.latitude);
	  console.log(location.coords.longitude);
	  console.log(location.coords.accuracy);
	});








	// variables
	let house = document.getElementsByClassName("address"); 																					// get address from DOM
	var mymap = L.map('mapid').setView([ 41.4993, -81.6944 ], 10); 																				// map from leaflet
	let marker = []; 																															// array for marker variables

	// map and layers
	L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
					{
						attribution : 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>,Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
						maxZoom : 18,
						id : 'mapbox.streets',
						accessToken : 'pk.eyJ1IjoiZXRhY2FscGhhIiwiYSI6ImNqbDJ4M2w5bTF2ODQzcHA0bzlxMDc3dzQifQ.nGrjnJwmCl7mG46Fy01_LQ'
					}).addTo(mymap);

	//geocoding
	for (var i = 0; i < house.length; i++) { 																									// loop to reverse geocode address and add marker 
	let	address = (house[i].innerText); 																										// assign adress from jsp to each address in js
		var request = new XMLHttpRequest(); 																									// front end API call object
		request.open('GET','http://www.mapquestapi.com/geocoding/v1/address?key=Mtbu18nHxlnliiqzIQuzjPlbm3zUrdQk&location='+ address, true); 	// api call
		request.onload = function() {																											// function to get data from api and parse as JSON

			// Begin accessing JSON data here
			var data = JSON.parse(this.response);
			let lat = (data.results[0].locations[0].displayLatLng.lat); 																		// assign latitude from api jason
			let lng = (data.results[0].locations[0].displayLatLng.lng);																			// assign longitude form api json

			//markers
			marker[i] = L.marker([ lat, lng ]).addTo(mymap); 																					// place marker

			//popups
			marker[i].bindPopup("<b>Hello world!</b><br>this is my address: " + address).openPopup(); 											// create popup on each marker that says address
		}
		request.send();																													 // I assume that this is sending the request to API and the above works on a promise
	}
	
</script>


<c:import url="/WEB-INF/jsp/footer.jsp" />