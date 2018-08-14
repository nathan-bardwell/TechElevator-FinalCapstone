package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.House;
import com.techelevator.model.HouseDAO;

@Controller
public class HouseController {
	
	private HouseDAO houseDAO;
	
	@Autowired
	public HouseController(HouseDAO houseDAO) {
		this.houseDAO = houseDAO;
	}
	
	
	@RequestMapping(path = "/addHouses",method = RequestMethod.GET)
	public String displayAddHousePage() {
		return "/addHouses";
	}
	
	@RequestMapping(path = "/addHouses",method = RequestMethod.POST)
	public String addNewHouses(@ModelAttribute House house) {
		houseDAO.createHouse(house.getAddress(), house.getResident(), house.getNotes(), house.getPhoneNumber(), house.getStatus());
		return "redirect:/addHouses";
	}
	
	@RequestMapping(path = "/addHousesByCsv",method = RequestMethod.POST)
	public String addNewHousesByCsv(RedirectAttributes flash, @RequestParam String path) {
		int success = houseDAO.createHouseByCsv(path);
		if(success == 1) {
			flash.addFlashAttribute("Failure Message" , "The Import was not Succesful" );
		}
		return "redirect:/addHouses";
	}
	
}
