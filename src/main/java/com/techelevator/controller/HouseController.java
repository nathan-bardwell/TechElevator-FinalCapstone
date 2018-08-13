package com.techelevator.controller;

import org.mockito.internal.debugging.WarningsCollector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String addNewHouses(@RequestParam String address, @RequestParam String resident, @RequestParam String status, @RequestParam String phoneNumber, @RequestParam String notes) {
		houseDAO.createHouse(address,resident,notes,phoneNumber,status);
		return "redirect:/addHouses";
	}
	
	@RequestMapping(path = "/addHousesByCsv",method = RequestMethod.POST)
	public String addNewHousesByCsv(RedirectAttributes flash, @RequestParam String address, @RequestParam String resident, @RequestParam String status, @RequestParam String phoneNumber, @RequestParam String notes) {
		int success = houseDAO.createHouseByCsv(address,resident,notes,phoneNumber,status);
		if(success == 1) {
			flash.addFlashAttribute("Failure Message" , "The Import was not Succesful" );
		}
		return "redirect:/addHouses";
	}
	
}
