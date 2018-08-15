package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


@Component
public class JDBCTeamDAO implements TeamDAO {
	
	private JdbcTemplate jdbcTemplate;
	private UserDAO userDao;
	
	@Autowired
	public JDBCTeamDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void createNewTeam(String name, String username) {
		Long teamId = null;
		Long adminId = userDao.getUserIdByUserName(username);
		
		String createTeamSql = "INSERT INTO team (name) " + 
									 "VALUES (?) RETURNING team_id";
		SqlRowSet createTeamResult = jdbcTemplate.queryForRowSet(createTeamSql, name);
		while(createTeamResult.next()) {
			teamId = createTeamResult.getLong("team_id");
		}
		
		String matchAdminToTeamSql = "INSERT INTO user_team (user_id, team_id) " + 
											 "VALUES (?, ?)";
		jdbcTemplate.update(matchAdminToTeamSql, adminId, teamId);
		
		
	}

	@Override
	public Team getTeamInfo(long team_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addSalesmanToTeam(User salesman) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getTeamAdmin(long team_id) {
		User adminUser = new User();
		String getTeamAdminSql = "SELECT * " + 
										"FROM app_user au " + 
										"JOIN user_team ut " + 
										"ON au.user_id = ut.user_id " + 
										"WHERE role='Admin' AND team_id=?;";
		SqlRowSet result = jdbcTemplate.queryForRowSet(getTeamAdminSql, team_id);
		
		while(result.next()) {
			adminUser.setFirstName(result.getString("first_name"));
			adminUser.setLastName(result.getString("last_name"));
			adminUser.setEmail(result.getString("email"));
			adminUser.setRole(result.getString("role"));
		}
		
		return adminUser;
	}

	@Override
	public List<User> getAllTeamMembers(long team_id) {
		List<User> teamMembers = new ArrayList<>();
		String getTeamMembersSql = "SELECT * " + 
										   "FROM app_user au " + 
										   "JOIN user_team ut " + 
										   "ON au.user_id = ut.user_id " + 
										   "WHERE ut.team_id = ?;";
		SqlRowSet results = jdbcTemplate.queryForRowSet(getTeamMembersSql, team_id);
		
		while(results.next()) {
			User user = new User();
			
			user.setFirstName(results.getString("first_name"));
			user.setLastName(results.getString("last_name"));
			user.setEmail(results.getString("email"));
			user.setRole(results.getString("role"));
			
			teamMembers.add(user);
			
		}
		return teamMembers;
	}
	
	

	
}
