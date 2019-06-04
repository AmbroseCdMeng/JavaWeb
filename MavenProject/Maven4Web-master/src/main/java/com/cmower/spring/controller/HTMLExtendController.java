package com.cmower.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author MengChengdu
 * HTML 扩展
 */
@Controller
@RequestMapping("HTMLExtend")
public class HTMLExtendController {

	@RequestMapping("index1")
	public String index1() {
		return "HTMLExtend/index1";
	}
	
	@RequestMapping("index2")
	public String index2(){
		return "HTMLExtend/index2";
	}
}
