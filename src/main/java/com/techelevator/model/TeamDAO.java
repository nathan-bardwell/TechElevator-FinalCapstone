package com.techelevator.model;

import java.util.List;

public interface TeamDAO {

	void createNewTeam(String name, String username);
	Team getTeamInfo(long team_id);
	void addSalesmanToTeam(User salesman);
	User getTeamAdmin(long team_id);
	List<User> getAllTeamMembers(long team_id);
}
