package com.cmower.spring.controller;

import java.awt.image.BufferedImage;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.alibaba.druid.util.StringUtils;
import com.cmower.common.Constants;
import com.cmower.common.Variables;
import com.cmower.common.util.AjaxResponseUtils;
import com.cmower.common.util.CipherUtils;
import com.cmower.dal.AjaxResponse;
import com.cmower.database.entity.Users;
import com.cmower.spring.service.UserService;
import com.google.code.kaptcha.Producer;

@RequestMapping("form")
@Controller
public class FormController extends BaseController {

	@Autowired
	private UserService userService;
	
	
	/**
	 * BootStrapValidator 的使用
	 * @return
	 */
	@RequestMapping("index1")
	public String index1() {
		return "Form/index1";
	}
	
	/**
	 * 用户登陆。BootStrapValidator 下 form 表单提交 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public AjaxResponse login(@RequestParam(value="username", required=false)String username,
			@RequestParam(value="password", required = false)String password,
			@RequestParam(value="kaptchaCode", required=false) String kaptchaCode){
		logger.debug("用户{}尝试登陆", username);
		AjaxResponse response =AjaxResponseUtils.getFailureResponse();
		if (StringUtils.isEmpty("username")) {
			response.setField("username");
			response.setMessage("用户名不能为空");
			return response;
		}

		Users user = this.userService.selectOne(username);
		
		
		/*验证码的匹配*/
		if (StringUtils.isEmpty(kaptchaCode)) {
			response.setField("kaptchaCode");
			response.setMessage("验证码为空");
			return response;
		}
		if (!checkCode(kaptchaCode)) {
			response.setField("kaptchaCode");
			response.setMessage("验证码错误");
			return response;
		}
		
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
	 * 验证用户名是否存在。BootStrapValidator 下表单 Remote 远程验证
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
	
	/**
	 * Validform 的使用
	 * @return
	 */
	@RequestMapping("index2")
	public String index2(){
		return "Form/index2";
	}
	
	/**
	 * Captcha 验证码的使用
	 * @return
	 */
	@RequestMapping("index3")
	public String index3() {
		return "Form/index3";
	}
	
	/**
	 * Captcha 验证码生成
	 */
	@Autowired
	private Producer captchaProducer;
	
	@RequestMapping("kaptcha")
	public void kaptcha(HttpServletResponse response) {
		try {
			response.setContentType("image/png");
			String code = captchaProducer.createText();
			setSessionAttr(Constants.SESSION_KAPTCHA_CODE, code);
			
			BufferedImage image = captchaProducer.createImage(code);
			
			ServletOutputStream out = response.getOutputStream();
			
			ImageIO.write(image, "jpg", out);
			
			out.flush();
			out.close();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
	
	/**
	 * 验证码的校验
	 * @param response
	 * @param kaptchaCode
	 * @return
	 */
	public boolean checkCode(String kaptchaCode) {
		String sessionKapchaCode = getSessionAttr(Constants.SESSION_KAPTCHA_CODE);
		if (!sessionKapchaCode.equalsIgnoreCase(kaptchaCode)) {
			return false;
		}
		return true;
	}
	
	
	/**
	 * 文件上传
	 * @return
	 */
	@RequestMapping("fileUploader")
	public String fileUploader() {
		return "Form/fileUploader";
	}
}

