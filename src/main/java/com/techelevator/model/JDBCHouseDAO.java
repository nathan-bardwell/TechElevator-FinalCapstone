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
				"INSERT INTO house(address, resident, notes, phone_number, status,creator_id) VALUES (?, ?, ?, ?, ?, ?)",
				address, resident, notes, phone_number, status, creatorId);
	}

	@Override
	public void createHouseMultiple(String textArea)
	{
		ArrayList<String> line = new ArrayList<String>();

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

	private House mapToRow(SqlRowSet results)
	{
		House house = new House();
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
