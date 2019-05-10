package com.cmower.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("form")
@Controller
public class FormController {

	@RequestMapping("index1")
	public String index1() {
		return "Form/index1";
	}
}
