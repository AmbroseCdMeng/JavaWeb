<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NProgress Demo</title>

<%@ include file="/resources/common/jslib.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />


<%-- <script src="${ctx}/resources/js/jquery-3.3.1.js "></script> --%>
<script src="${ctx}/resources/js/nprogress/nprogress.js"></script>
<link style="${ctx}/resources/css/nprogress/nprogress.css">

</head>
<body>
	<h3>NProgress Demo</h3>
	<p></p>

</body>

<script type="text/javascript">
	$(function() {

		NProgress.configure({
			showSpinner : false
		});

		$(document).ajaxStart(function() {
			NProgress.start();
		}).ajaxStop(function() {
			NProgress.done();
		});

		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/three/ajaxNprogress",
			success : function(text) {
				$("p").html("Ajax请求响应结果：" + text);
				alert("Ajax请求响应结果：" + text)
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$("p").html(textStatus);
				alert(textStatus)
			}
		})

	})
</script>

</html>
