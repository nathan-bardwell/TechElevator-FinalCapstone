package com.techelevator.model;

import java.util.List;

public interface HouseDAO {

	public void createHouse(String address, String resident, String notes, String phone_number, String status, String creatorId);

	public int createHouseByCsv(String path);

	List<House> viewHouses(String userName);
	
}
