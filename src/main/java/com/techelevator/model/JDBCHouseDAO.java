package com.techelevator.model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.io.Reader;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class JDBCHouseDAO implements HouseDAO
{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCHouseDAO(DataSource dataSource)
	{
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	@Override
	public void createHouse(String address, String resident, String notes, String phone_number, String status,
			String creatorId)
	{

		jdbcTemplate.update(
				"INSERT INTO house(address, resident,  phone_number, status,notes,creator_id) VALUES (?, ?, ?, ?, ?, ?)",
				address, resident,phone_number, status,notes, creatorId);
	}

	@Override
	public int createHouseMultiple(String textArea, String userName)
	{
	
		String[] line = textArea.split("\n");

		try
		{
				for (String field : line)
				{
					if(!field.isEmpty()) {
					String[] values = field.split("\\|");
					createHouse(values[0], values[1], values[2], values[3], values[4], userName);
					}
				}
		} catch (Exception e)
		{
			System.out.println("This did not work");
			return 1;
		}
			return 0;
	}

	@Override
	public List<House> viewHouses(String userName)
	{
		List<House> houseList = new ArrayList<House>();
		String sql = "SELECT * FROM house WHERE creator_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userName);

		while (results.next())
		{
			houseList.add(mapToRow(results));
		}

		return houseList;
	}
	
	@Override
	public List<House> viewAssignedHouses(String userName){
		List<House> houseList = new ArrayList<House>();
		String sql = "SELECT * FROM house WHERE assignment_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userName);

		while (results.next())
		{
			houseList.add(mapToRow(results));
		}

		return houseList;
	}
	
	@Override
	public House getHouseById(long houseId) {
		House house = new House();
		String sql = "SELECT * FROM house WHERE house_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql,houseId);
		results.next();
		house = mapToRow(results);
		return house;
	}
	
	@Override
	public int updateAssignment(long houseId, String assignmentId) {
	
		String updateSql = "UPDATE house SET assignment_id = ? WHERE house_id =?";
		
		try {
			jdbcTemplate.update(updateSql,assignmentId,houseId);
			
		}catch (Exception e) {
			return 1;
		}
		
		
		
		return 0;
	}

	private House mapToRow(SqlRowSet results)
	{
		House house = new House();
		house.setHouseId(results.getLong("house_id"));
		house.setAddress(results.getString("address"));
		house.setAssignmentId(results.getString("assignment_id"));
		house.setCreatorId(results.getString("creator_id"));
		house.setNotes(results.getString("notes"));
		house.setPhoneNumber(results.getString("phone_number"));
		house.setResident(results.getString("resident"));
		house.setStatus(results.getString("status"));
		return house;
	}

	@Override
	public List<House> getHouseByTeam(long teamId)
	{

		return null;
	}



}
