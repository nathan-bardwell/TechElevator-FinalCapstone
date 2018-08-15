package com.techelevator.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.TeamDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;
	private TeamDAO teamDAO;

	@Autowired
	public UserController(UserDAO userDAO, TeamDAO teamDAO) {
		this.userDAO = userDAO;
		this.teamDAO = teamDAO;
	}

	@RequestMapping(path="/users/new", method=RequestMethod.GET)
	public String displayNewAdminForm(ModelMap modelHolder) {
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "newUser";
	}
	
	@RequestMapping(path="/users", method=RequestMethod.POST)
    public String createAdmin(@Valid @ModelAttribute User user, @RequestParam String teamName, BindingResult result, RedirectAttributes flash) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("user", user);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            flash.addFlashAttribute("errorMessage", "Error creating new Admin.");
            return "redirect:/users/new";
        }
        
        userDAO.saveUser(user.getFirstName(), user.getLastName(), user.getUserName(), user.getPassword(), user.getEmail(), user.getRole() );
        flash.addFlashAttribute("message", "New Admin " + user.getFirstName() + " Created Successfully!");
        
        teamDAO.createNewTeam(teamName, user.getUserName());
        
        return "redirect:/login";
    }
	
	@RequestMapping(path="/newSalesman", method=RequestMethod.GET)
	public String displayNewSalesmanForm(ModelMap modelHolder, RedirectAttributes flash, HttpSession session) {
		
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login?destination=/newSalesman";
		} else if (!((User) session.getAttribute("currentUser")).getRole().equals("Admin")) {
			return "/notAuthorized";
		}
		
		if( ! modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		if(flash.containsAttribute("message")) {
			
		}
		return "newSalesman";
	}
	
	@RequestMapping(path="/newSalesman", method=RequestMethod.POST)
    public String createNewSalesman(@Valid @ModelAttribute User user, BindingResult result, HttpSession session, RedirectAttributes flash) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("user", user);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            flash.addFlashAttribute("errorMessage", "Error creating new Salesman.");
            return "redirect:/newSalesman";
        }
        
        userDAO.saveUser(user.getFirstName(), user.getLastName(), user.getUserName(), user.getPassword(), user.getEmail(), user.getRole() );
        flash.addFlashAttribute("message", "New Salesman " + user.getFirstName() + " Created Successfully!");
        long team_id  = teamDAO.getTeamId(((User)session.getAttribute("currentUser")).getUserName());
        teamDAO.addSalesmanToTeam(team_id, user.getUserName());
        return "redirect:/newSalesman";
    }
	
	
	
	@RequestMapping(path="/salesman", method=RequestMethod.GET)
	public String showSalesmanPage(HttpSession session) {
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login?destination=/salesman";
		}
		return "/salesman";
	}
	
	@RequestMapping(path= {"/admin", "/viewTeam"}, method=RequestMethod.GET)
	public String showTeam(HttpSession session, ModelMap modelHolder) {
		if(session.getAttribute("currentUser") == null) {
			return "redirect:/login?destination=/admin";
		}
		
		long id  = teamDAO.getTeamId(((User)session.getAttribute("currentUser")).getUserName());
		modelHolder.put("teamMembers",teamDAO.getAllTeamMembers(id));
		return "/viewTeam";
	}
	
	
}
