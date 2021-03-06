package com.cmower.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("two")
public class TwoController {

	@RequestMapping("")
	public String index() {
		return "two/index";
	}
	
	@RequestMapping("jslib")
	public String jslib() {
		return "two/index";
	}
	
	@RequestMapping("jslib/{id}")
	public String jslib(@PathVariable String id) {
		return "two/index2";
	}
}
