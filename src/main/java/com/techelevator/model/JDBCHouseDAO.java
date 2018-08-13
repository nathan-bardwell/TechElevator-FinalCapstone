package com.techelevator.model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


@Component
public class JDBCHouseDAO implements HouseDAO {

	private JdbcTemplate jdbcTemplate;
	
	
	
	@Autowired
	public JDBCHouseDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		
	}
	
	@Override
	public void createHouse(String address, String resident, String notes, String phone_number, String status) {
		
		jdbcTemplate.update("INSERT INTO house(address, resident, notes, phone_number, status) VALUES (?, ?, ?, ?, ?)",
				address, resident, notes, phone_number, status);
	}
	
	@Override
	public int createHouseByCsv(String imported) 
	{
		File houseInput = new File(imported);
		try
		{
			BufferedReader reader = new BufferedReader(new FileReader(houseInput));
			String currentLine = reader.readLine();
			while(currentLine!=null) 
			{
				String [] houseFields = currentLine.split(",");
				jdbcTemplate.update("INSERT INTO house(address, resident, notes, phone_number, status) VALUES (?, ?, ?, ?, ?)",
						houseFields[0], houseFields[1], houseFields[2], houseFields[3], houseFields[4]);
			
			}

		} catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("There was an error in the csv import method");
			
			return 1;
			
		}
		
		return 0;
	}
	
	

}
