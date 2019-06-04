<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
