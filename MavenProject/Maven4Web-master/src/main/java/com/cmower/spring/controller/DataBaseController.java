package com.cmower.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cmower.database.entity.Users;
import com.cmower.spring.service.UserService;

@Controller
@RequestMapping("DataBase")
public class DataBaseController {

	@Autowired
	private UserService userService;
	
	
	@RequestMapping("index1")
	public String index1(Model model) {
		Users user = userService.select(1);
		model.addAttribute("name", user.getUsername());
		return "DataBase/index1";
	}
}
