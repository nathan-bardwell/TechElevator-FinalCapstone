package com.techelevator.model;

import java.util.List;


public interface HouseDAO {

	public void createHouse(String address, String resident, String notes, String phone_number, String status, String creatorId);

	List<House> viewHouses(String userName);
	
	public int createHouseMultiple(String textArea, String userName);
	
	public List<House> getHouseByTeam(long teamId);
	
	public House getHouseById(long houseId);

	List<House> viewAssignedHouses(String userName);

	int updateAssignment(long houseId, String assignmentId);
}
