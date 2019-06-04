<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><sitemesh:write property='title' /></title>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" type="text/css" href="">

<%@ include file="/resources/common/jslib.jsp"%>
<script type="text/javascript"></script>

</head>

<body class="hole-transition skin-blue siderbar-mini">
	<div class="wrapper">
		<header class="main-header"></header>
		<aside class="main-sidebar"></aside>
		
		<div class="content-wrapper">
			<sitemesh:write property='body' />
		</div>
		
		<footer class="main-footer"></footer>
		<aside class="control-sidebar control-sidebar-dark"></aside>
	</div>
</body>
</html>

<!-- sitemesh:write property 的 title 和 body 将被 SiteMesh 重写， 包含从被装饰页面中提取的属性 <title> 和 <body> 中的内容 -->