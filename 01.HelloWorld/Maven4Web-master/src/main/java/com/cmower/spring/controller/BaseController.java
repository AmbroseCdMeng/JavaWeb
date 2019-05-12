package com.cmower.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseController {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	protected HttpServletRequest request;

	public BaseController setSessionAttr(String key, Object value) {
		request.getSession().setAttribute(key, value);
		return this;
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getSessionAttr(String key) {
		HttpSession session = request.getSession(false);
		return session != null ? (T)session.getAttribute(key):null;
	}
	
	
	public String getPara(String name) {
		return request.getParameter(name);
	}

	public String getPara(String name, String defaultValue) {
		String result = request.getParameter(name);
		return result != null && !"".equals(result) ? result : defaultValue;
	}

}
