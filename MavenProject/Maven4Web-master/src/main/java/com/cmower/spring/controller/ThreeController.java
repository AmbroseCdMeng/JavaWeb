package com.cmower.spring.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author MengChengdu
 *
 */
@Controller
@RequestMapping("three")
public class ThreeController {

	@RequestMapping
	public String index() {

		return "three/index";
	}

	/**
	 * Data Response ResponseBody
	 * 	注解将请求处理方法返回的对象通过恰当的转换器转换为指定格式，然后写入到HttpServletResponse对象的body区中 ResponseBody
	 * 	一般用来返回 JSON 或 XML 数据，效果等同于通过 HTTPServletResponse 对象输出指定格式的数据 ResponseBody
	 * 	处理返回的String字符串在 SpringMVC 中会会调用 StringHTTPMessageConverter 类来进行转换，默认的编码是 ISO-8859-1 
	 * 	解决中文乱码问题： 
	 * 	局部： RequestMapping 注解中增加参数 produces = "text/html;charset=UTF-8"
	 * 	全局：配置文件 context-dispatcher.xml 的 <mvc:annotation-driven> 节点中增加消息转换器 P77
	 * 
	 * @return
	 */
	@RequestMapping(value = "ajaxNprogress", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String ajaxNprogress() {
		try {
			Thread.sleep(5000);
		} catch (Exception e) {

		}
		return "你好！";
	}

	/**
	 * Data Response 使用 HTTPServletResponse 对象输出指定格式的数据。效果同上
	 * 
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "ajaxNprogress2")
	public void ajacNprogress_ByHTTPServletResponse(HttpServletResponse response) throws IOException {
		response.getWriter().write("你好");
	}
}
