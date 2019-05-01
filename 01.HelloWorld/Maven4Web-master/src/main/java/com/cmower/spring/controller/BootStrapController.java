package com.cmower.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("bootstrap")
public class BootStrapController {

	@RequestMapping("index")
	public String index() {
		return "bootstrap/index";
	}
	
	@RequestMapping("index2")
	public String index2() {
		return "bootstrap/index2";
	}
}
