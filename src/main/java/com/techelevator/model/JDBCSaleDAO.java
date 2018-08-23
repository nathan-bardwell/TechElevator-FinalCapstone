package com.techelevator.model;

import java.math.BigDecimal;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JDBCSaleDAO implements SaleDAO {
	
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCSaleDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public List<Sale> getSalesByHouseId(Long houseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> getSalesByProductId(Long productId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> getSalesByUserId(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BigDecimal getSalesTotal(List<Sale> sales) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveNewSale(Long houseId, Long productId, Long userId, int quantity) {
		String newSaleSql = "INSERT INTO sales(house_id, product_id, user_id, quantity) "
							   + "VALUES (?, ?, ?, ?); ";
		
		String setSaleTotalSql =	"UPDATE sales "
							   + "SET cost_in_cents = (SELECT (price_in_cents * ?) "
							   							+ "FROM product "
							   						  	+ "WHERE product_id = ?);";
		
		
	}

}
