package com.cmower.common.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.cmower.common.Variables;

public class AppContextInitListener implements ServletContextListener, HttpSessionListener {

	/*
	 * 监听器：要在 web.xml 中配置
	 * 
	 * 	<listener>
	 *
	 *		<listener-class>com.cmower.common.listener.AppContextInitListener</listener-class>
	 *
	 *	</listener>
	 * */
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("Listener： Context destroyed");
	}

	public void contextInitialized(ServletContextEvent event) {
		System.out.println("Listener： Context Initialized");
		ServletContext context = event.getServletContext();

		Variables.ctx = context.getContextPath();
	}

	public void sessionCreated(HttpSessionEvent event) {

	}

	public void sessionDestroyed(HttpSessionEvent event) {

		HttpSession session = event.getSession();

		session.invalidate();

	}

}
