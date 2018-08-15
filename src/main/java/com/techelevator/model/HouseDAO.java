package com.techelevator.model;

import java.util.List;


public interface HouseDAO {

	public void createHouse(String address, String resident, String notes, String phone_number, String status, String creatorId);

	List<House> viewHouses(String userName);
	
	public void createHouseMultiple(String textArea, String userName);
	
	public List<House> getHouseByTeam(long teamId);
}
