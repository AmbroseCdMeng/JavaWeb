package com.cmower.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseController {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	protected HttpServletRequest request;

	public String getPara(String name) {
		return request.getParameter(name);
	}

	public String getPara(String name, String defaultValue) {
		String result = request.getParameter(name);
		return result != null && !"".equals(result) ? result : defaultValue;
	}

}
