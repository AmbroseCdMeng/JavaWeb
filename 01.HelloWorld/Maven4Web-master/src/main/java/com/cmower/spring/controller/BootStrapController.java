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
	
	@RequestMapping("index3")
	public String index3() {
		return "bootstrap/index3";
	}
	
	@RequestMapping("index4")
	public String index4() {
		return "bootstrap/index4";
	}
	
	@RequestMapping("index5")
	public String index5() {
		return "bootstrap/index5";
	}
}
