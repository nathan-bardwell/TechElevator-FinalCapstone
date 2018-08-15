package com.techelevator.model;

import java.util.List;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface HouseDAO {

	public void createHouse(String address, String resident, String notes, String phone_number, String status, String creatorId);

	

	List<House> viewHouses(String userName);
	public int createHouseByCsv(MultipartFile file);
	
	public List<House> getHouseByTeam(long teamId);
}
