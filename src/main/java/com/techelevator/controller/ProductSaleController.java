package com.techelevator.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.ProductDAO;
import com.techelevator.model.SaleDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

@Controller
public class ProductSaleController {
	
	private ProductDAO productDAO;
	private SaleDAO saleDAO;
	private UserDAO userDAO;
	
	@Autowired
	public ProductSaleController(ProductDAO productDAO, SaleDAO saleDAO, UserDAO userDAO) {
		this.productDAO = productDAO;
		this.saleDAO = saleDAO;
		this.userDAO = userDAO;
	}
	
	@RequestMapping(path="/addProduct", method=RequestMethod.GET)
	public String showAddProductForm(HttpSession session) {
		
		return "/addProduct";
	}
	
	@RequestMapping(path="/addProduct", method=RequestMethod.POST)
	public String submitNewProduct(@RequestParam String name, @RequestParam double price, RedirectAttributes flash) {
		int success = productDAO.saveNewProduct(name, productDAO.convertDollarsToCents(price));
		
		if(success == 0) {
			flash.addAttribute("message", "Successfully added " + name + " to your product list with a price of: $" +price);
			return "redirect:/admin";
		} else {
			flash.addAttribute("errorMessage", "There was an error while adding your new product. Please try again");
			return "redirect:/admin";
		}
		
	}
	
	@RequestMapping(path="/newSale", method=RequestMethod.POST)
	public String makeNewSale(HttpServletRequest request, HttpSession session, @RequestParam String productId, @RequestParam String quantity, @RequestParam Long houseId) {
		
		String[] products = request.getParameterValues("productId");
		String[] quantities = request.getParameterValues("quantity");
		String userId = userDAO.getUserIdByUserName(((User) session.getAttribute("currentUser")).getUserName()).toString();

		for (int i = 0; i < products.length; i++) {
			
			saleDAO.saveNewSale(houseId, Long.parseLong(products[i]), Long.parseLong(userId), Integer.parseInt(quantities[i]));
		}
		return "redirect:/houseDetail?houseId=" + houseId;
	}

}
