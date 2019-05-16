<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- BootStrap 使用到的某些 HTML 元素和CSS属性需要将页面设置为 HTML5 文档类型。所以需要进行如下格式设置 start -->
<html lang="zh-CN">
<!-- end -->

<head>

<!-- 三个 meta 标签， 必须放在最前面 -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- viewport 元数据标签确保页面可以适当的绘制和触屏缩放，全面支持移动设备 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end -->


<style type="text/css">
/* 固定页面的 css */

/* html 满屏 其内元素相对定位 */
html {
	position: relative;
	min-height: 100%;
}
/* 页脚 绝对定位 距离底部 0 */
.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 60px;
	background-color: #5F5F5F;
	font-size: 35px;
}
</style>

<title>BootStrap</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<!-- 引入 bootstrap 相关 js 文件 和 css 文件  start -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap/bootstrap.css">
<%@include file="/resources/common/jslib.jsp"%>
<script src="${ctx}/resources/js/bootstrap/bootstrap.js"></script>
<!-- end -->

</head>
<body>
	<header>
		<h1>BootStrap Demo</h1>
	</header>
	<div class="main">

		<div class="container main">
			<div class="page-header">
				<h2>粘脚页的情况</h2>
			</div>
			<p class="lead">蓬生麻中，不扶而直；白沙在涅，与之俱黑</p>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">这里是页脚</p>
		</div>
	</footer>
</body>

<script type="text/javascript">
<!-- 或者使用 js 来固定页面 -->
	$(function() {

		$(".main").height($(document).height() - $("header").height() - $("footer").height());
	})
</script>
</html>



















