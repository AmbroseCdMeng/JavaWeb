package com.cmower.spring.controller;

import java.awt.image.BufferedImage;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.druid.util.StringUtils;
import com.cmower.common.Constants;
import com.cmower.common.Variables;
import com.cmower.common.upload.MultipartRequest;
import com.cmower.common.upload.UploadFileManager;
import com.cmower.common.util.AjaxResponseUtils;
import com.cmower.common.util.CipherUtils;
import com.cmower.dal.AjaxResponse;
import com.cmower.database.entity.UploadFile;
import com.cmower.database.entity.Users;
import com.cmower.spring.service.UserService;
import com.google.code.kaptcha.Producer;
import com.mysql.jdbc.ResultSetInternalMethods;

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
	
	public UploadFileManager getFiles(HttpServletRequest request) {
		
		/*  以下 2 行 代码用来检测 前台 form 表单 中的 enctype="multipart/form-data" 配置是否成功传递到后台，
		 *  如果传递失败，后台会报错：
		 *  类型转换异常 ： HttpServletRequestFilterable cannot be cast to MultipartHttpServletReques
		 *  */
		//MultipartResolver resolver =  new CommonsMultipartResolver(request.getSession().getServletContext());
		//boolean isMultipart = resolver.isMultipart(request);
		
		if (request instanceof MultipartRequest == false) {
			request = new MultipartRequest(request);
		}
		return ((MultipartRequest)request).getFileManager();
	}
	
	@RequestMapping("saveHeadImg")
	@ResponseBody
	public AjaxResponse savaHeadImg(HttpServletRequest request) {
		logger.debug("头像上传");
		AjaxResponse response = AjaxResponseUtils.getFailureResponse();
		//获取上传文件管理器
		UploadFileManager fileManager = getFiles(request);
		
		//获取上传文件
		UploadFile file = fileManager.getFile();
		
		//如果上传文件为空，返回错误信息
		if (file == null) {
			response.setField("headImg");
			response.setMessage("请选择图片");
			return response;
		}
		
		//验证通过后，保存上传的文件到服务器
		fileManager.save();
		System.out.println("file save success: "+System.currentTimeMillis());
		//保存上传路径到数据库
		Users user = this.userService.selectOne("MengChengdu");
		Users update = new Users();
		update.setId(user.getId());
		update.setHeadImg(file.getCompleteName());
		this.userService.update(update);
		System.out.println("insert db success: " + System.currentTimeMillis());
		response = AjaxResponseUtils.getSuccessResponse();
		//返回客户端可以访问的文件路径
		response.put("headImg", file.getCompleteName());
		System.out.println("return : " + System.currentTimeMillis());
		return response;
	}
	
	/**
	 * Dropigy 插件
	 * @return
	 */
	@RequestMapping("dropify")
	public String dropify() {
		return "Form/dropify";
	}
	
	@RequestMapping("saveDropifyImg")
	@ResponseBody
	public AjaxResponse saveDropifyImg(HttpServletRequest request) {
		logger.debug("使用 Dropigy 上传图片");
		
		AjaxResponse response = AjaxResponseUtils.getFailureResponse();
		
		//上传文件管理类
		UploadFileManager fileManager = getFiles(request);
		
		//获取上传文件
		UploadFile file = fileManager.getFile();
		
		//
		if (file  == null) {
			response.setMessage("请选择");
			return response;
		}
		
		//保存
		fileManager.save();
		
		response = AjaxResponseUtils.getSuccessResponse();
		
		//返回可访问的路径
		response.put("imgUrl", file.getCompleteName());
		
		return response;
	}
	
	/**
	 *  增强版的 Html5 文件输入框
	 * @return
	 */
	@RequestMapping("fileInput")
	public String fileInput() {
		return "Form/fileInput";
	}
	
	/**
	 * Summernote 富文本输入框的配置
	 * @return
	 */
	@RequestMapping("summernote")
	public String summernote() {
		return "Form/summernote";
	}
	
	/**
	 * summernote 的示例
	 * @return
	 */
	@RequestMapping("summernoteDemo")
	public String summernoteDemo() {
		return "Form/summernoteDemo";
	}
	
	@RequestMapping("saveDetail")
	@ResponseBody
	public AjaxResponse saveDetail() {
		logger.debug("保存 summernote 数据");
		AjaxResponse response = AjaxResponseUtils.getFailureResponse();
		String detail = getPara("detail");
		if (StringUtils.isEmpty(detail)) {
			response.setMessage("请填写详情");
			response.setField("detail");
			return response;
		}
		Users user = this.userService.selectOne("KuangKuangKuang");
		Users update = new Users();
		update.setId(user.getId());
		update.setDetail(detail);
		this.userService.update(update);
		
		response = AjaxResponseUtils.getSuccessResponse();
		response.setMessage("保存成功");
		return response;
	}
	
	
	@RequestMapping("sitemesh")
	public String sitemesh(@RequestParam(required = false, defaultValue="sitemesh") String p, Model model) {
		if ("summernoteDemo".equals(p)) {
			Users param = new Users();
			param.setUsername(getPara("username"));
			List<Users> list = this.userService.selectList(param);
			model.addAttribute("list", list);
			model.addAttribute("param", param);
		}
		return "Form/" + p;
	}
}

