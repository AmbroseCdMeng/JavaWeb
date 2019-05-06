package com.cmower.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("adminlte")
public class AdminLTEController {

	@RequestMapping("index1")
	public String index1() {
		return "AdminTEL/index1";
	}
	
	/**
	 * SiteMesh 装饰器页面
	 * @return
	 */
	@RequestMapping("decorator")
	public String decorator() {
		return "AdminTEL/decorator";
	}
	
	/**
	 * SiteMesh 被装饰页面
	 * @return
	 */
	@RequestMapping("sitemesh")
	public String sitemesh() {
		return "AdminTEL/sitemesh";
	}
}
