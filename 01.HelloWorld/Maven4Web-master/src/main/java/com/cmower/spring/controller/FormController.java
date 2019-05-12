package com.cmower.spring.controller;

import java.util.HashMap;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.cmower.common.Variables;
import com.cmower.common.util.AjaxResponseUtils;
import com.cmower.common.util.CipherUtils;
import com.cmower.dal.AjaxResponse;
import com.cmower.database.entity.Users;
import com.cmower.spring.service.UserService;

@RequestMapping("form")
@Controller
public class FormController extends BaseController {

	@Autowired
	private UserService userService;
	
	
	@RequestMapping("index1")
	public String index1() {
		return "Form/index1";
	}
	
	@RequestMapping("login")
	@ResponseBody
	public AjaxResponse login(@RequestParam(value="username", required=false)String username,
			@RequestParam(value="password", required = false)String password){
		logger.debug("用户{}尝试登陆", username);
		AjaxResponse response =AjaxResponseUtils.getFailureResponse();
		if (StringUtils.isEmpty("username")) {
			response.setField("username");
			response.setMessage("用户名不能为空");
			return response;
		}

		Users user = this.userService.selectOne(username);
		
		if (user == null) {
			response.setField("username");
			response.setMessage("用户不存在");
			return response;
		}
		
		if (!CipherUtils.generatePassword(password).equals(user.getPassword())) {
			response.setField("password");
			response.setMessage("密码错误");
			return response;
		}
		
		response = AjaxResponseUtils.getSuccessResponse();
		response.setForwardUrl(Variables.ctx+"/form");
		return response;
	}
	
	/**
	 * Form 表单 Remote 远程验证 username
	 * @return
	 */
	@RequestMapping("username/check")
	@ResponseBody
	public HashMap<String, Object> checkLoginByRemote() {
		HashMap<String, Object> result = new HashMap<>();
		String username = getPara("username");
		String email = getPara("email");
		logger.debug("用户名{}, 邮箱{}", username, email);
		
		Users user = this.userService.selectOne(username);
		if (user != null) {
			result.put("valid", false);
			return result;
		}
		result.put("valid", true);
		return result;
	}
}

