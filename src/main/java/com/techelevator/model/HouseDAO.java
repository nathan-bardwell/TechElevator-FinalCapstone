package com.techelevator.model;

import java.io.File;
import java.util.List;

public interface HouseDAO {

	public void createHouse(String address, String resident, String notes, String phone_number, String status);

	public int createHouseByCsv(File file);
	
	public List<House> getHouseByTeam(long teamId);
}
