package com.techelevator.model;

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
	
	
}
