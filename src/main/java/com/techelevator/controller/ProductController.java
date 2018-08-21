package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.model.ProductDAO;

@Controller
public class ProductController {
	
	private ProductDAO productDAO;
	
	@Autowired
	public ProductController(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}
	
	@RequestMapping(path="/addProduct", method=RequestMethod.GET)
	public String showAddProductForm(HttpSession session) {
		
		return "/addProduct";
	}

}
