package com.cmower.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("DataBase")
public class DataBaseController {

	@RequestMapping("index1")
	public String index1() {
		return "DataBase/index1";
	}
}
