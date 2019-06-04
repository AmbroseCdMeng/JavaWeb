<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>第一个Java Web项目</title>

<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->

<!-- 引入公共的jslib.jsp文件 -->
<%@ include file="/resources/common/jslib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script src="${ctx}/resources/components/jquery/jquery-3.3.1.js"></script>

</head>
<body>
	Hello World！
	<hr>
	<div>
		<a target="_blank" href="${ctx}/two">1 - 测试页面</a><br>
		<a target="_blank" href="${ctx}/three">2 - 请求测试 & 页面滚动条</a><br><br>
		
		<a target="_blank" href="${ctx}/HTMLExtend/index1">3 - HTML 扩展 & 大量图片延迟加载案例</a><br>
		<a target="_blank" href="${ctx}/HTMLExtend/index2">3 - HTML 扩展 & ICheck 选择框</a><br><br>
		
		<a target="_blank" href="${ctx}/bootstrap/index">4 - BootStrap & 粘角页案例</a><br>
		<a target="_blank" href="${ctx}/bootstrap/index2">4 - BootStrap & 格栅系统案例</a><br>
		<a target="_blank" href="${ctx}/bootstrap/index3">4 - BootStrap & 常用文本样式 & 表格样式 & 表单样式 & 按钮样式 & 图片样式 & 浮动样式</a><br>
		<a target="_blank" href="${ctx}/bootstrap/index4">4 - BootStrap & 图标字体库 & 导航条 & 千叶窗 & 星级评定 & 视屏播放</a><br>
		<a target="_blank" href="${ctx}/bootstrap/index5">4 - BootStrap & 常见动画效果</a><br><br>
		
		<a target="_blank" href="${ctx}/adminlte/index1">5 - AdminLTE & 模板页 - 使用了装饰器</a><br>
		<a target="_blank" href="${ctx}/adminlte/decorator">5 - AdminLTE & 装饰器</a><br>
		<a target="_blank" href="${ctx}/adminlte/sitemesh">5 - AdminLTE & 被装饰页面</a><br>
		<a target="_blank" href="${ctx}/adminlte/select2">5 - AdminLTE & select2 强大的下拉框插件</a><br>
		<a target="_blank" href="${ctx}/adminlte/treeview">5 - AdminLTE & TreeView 的使用案例（含常用扩展方法）</a><br><br>
		
		<a target="_blank" href="${ctx}/DataBase/index1">6 - DataBase & Mybatis 与 MySQL 的链接</a><br><br>
		
		<a target="_blank" href="${ctx}/form/index1">7 - Form & 表单组件使用 & BootStrapValidator 栏位验证 & 验证码生成与匹配 & 远程DB验证 </a><br>
		<a target="_blank" href="${ctx}/form/dropify">7 - Form & 文件上传案例</a><br>
		<a target="_blank" href="${ctx}/form/fileInput">7 - Form & 表单提交 & 多文件上传 & 内置Ajax提交案例</a><br>
		<a target="_blank" href="${ctx}/form/summernoteDemo">7 - Form & 富文本编辑器 & 图片上传展示 & DB查询结果展示（自带条件查询）</a><br>
		<a target="_blank" href="${ctx}/form/fileUploader">7 - Form & 图片上传并返回加载</a><br> <br>
	</div>
	<hr>
	<script type="text/javascript">
		$(function() {

			$('body').append('<p>Hello</p>').append('夏虫不可于语冰</br> 井蛙不可语于海');

		})

		/*JQuery 对象与 Dom 对象*/
		var body = document.getElementByTagName('body');
		var $body = $('body');
		/* body 等价于 $body[0] */
	</script>
</body>
</html>
