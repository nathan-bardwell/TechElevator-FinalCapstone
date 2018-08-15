package com.techelevator.controller;


import java.io.IOException;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.HouseDAO;

/**
 * Handles requests for the application file upload requests
 */
@Controller
public class FileUploadController
{
	private HouseDAO houseDAO;

	@Autowired
	public FileUploadController(HouseDAO houseDAO)
	{
		this.houseDAO = houseDAO;
	}

	/**
	 * Upload single file using Spring Controller
	 * @throws IOException 
	 */
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler(RedirectAttributes flash, @RequestParam("file") MultipartFile file) throws IOException
	{

		if (!file.isEmpty())
		{
			try (Scanner fileReader = new Scanner(file.getInputStream()))
			{

				int success = houseDAO.createHouseByCsv(file);
				if (success == 1)
				{
					flash.addFlashAttribute("Failure Message", "The Import was not Succesful");
				}
			}
		}
		return "redirect:/addHouses";

	}
}
