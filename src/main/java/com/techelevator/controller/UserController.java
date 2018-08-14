package com.techelevator.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;

	@Autowired
	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "newUser";
	}
	
	@RequestMapping(path="/users", method=RequestMethod.POST)
    public String createUser(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("user", user);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            return "redirect:/users/new";
        }
        
        userDAO.saveUser(user.getFirstName(), user.getLastName(), user.getUserName(), user.getPassword(), user.getEmail(), user.getRole() );
        return "redirect:/login";
    }
	
	@RequestMapping(path="/newSalesman", method=RequestMethod.GET)
	public String displayNewSalesmanForm(ModelMap modelHolder, RedirectAttributes flash) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		if(flash.containsAttribute("message")) {
			
		}
		return "newSalesman";
	}
	
	@RequestMapping(path="/newSalesman", method=RequestMethod.POST)
    public String createNewSalesman(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("user", user);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            return "redirect:/newSalesman";
        }
        
        userDAO.saveUser(user.getFirstName(), user.getLastName(), user.getUserName(), user.getPassword(), user.getEmail(), user.getRole() );
        flash.addFlashAttribute("message", "New Salesman " + user.getFirstName() + " Created Successfully!");
        return "redirect:/newSalesman";
    }
	
	
	
	@RequestMapping(path="/salesman", method=RequestMethod.GET)
	public String showSalesmanPage() {
		return "/salesman";
	}
	
	@RequestMapping(path="/admin", method=RequestMethod.GET)
	public String showWelcomeAdminPage() {
		return "/viewTeam";
	}
	
	
}
