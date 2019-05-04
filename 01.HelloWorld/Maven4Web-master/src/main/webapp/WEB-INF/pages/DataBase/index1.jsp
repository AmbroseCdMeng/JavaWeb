<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>数据库</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!-- css 引用 -->
<link rel="stylesheet" type="text/css" href="">

<!-- 公共页面 -->
<%@ include file="/resources/common/jslib.jsp"%>

<!-- js 引用 -->
<script type="text/javascript" src=""></script>

</head>
<body>
	<p>用户 ${name} 登陆成功！</p>
</body>
</html>
