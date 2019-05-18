<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap 的栅格系统</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap/bootstrap.css">
<%@include file="/resources/common/jslib.jsp"%>
<script type="text/javascript" src="${ctx }/resources/js/bootstrap/bootstrap.js"></script>

</head>
<body>
	<div>
		<h1>BootStrap 的栅格系统就是把总宽度平分为12份</h1>
		<h3>BootStrap 的栅格系统的基本用法无非就是对12等分的列进行不同方式的组合</h3>
		<h3>BootStrap 的栅格系统是响应式的，会随着整体页面宽度发生变化，也就是说，只有屏幕宽度大于 992px 时才会完全生效。否则就需要对CSS进行微调</h3>
	</div>
	<hr>
	<!-- 行（row）包含在 .container（特定宽度，两边留白）或 .container-fluid（100%宽度）中，方便合适的排列和内边距 -->
	<div class="container-fluid">

		<!-- 12 * 1 -->
		<div class="row">
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
			<div class="col-md-1">.col-md-1</div>
		</div>

		<!-- 8 + 4 -->
		<div class="row">
			<div class="col-md-8">.col.md-8</div>
			<div class="col-md-4">.col.md-4</div>
		</div>

		<!-- 4 + 4 + 4 -->
		<div class="row">
			<div class="col-md-4">.col.md-4</div>
			<div class="col-md-4">.col.md-4</div>
			<div class="col-md-4">.col.md-4</div>
		</div>

		<!-- 6 + 6 -->
		<div class="row">
			<div class="col-md-6">.col.md-6</div>
			<div class="col-md-6">.col.md-6</div>
		</div>
	</div>
	<hr>
	<div>
		<h3>列偏移</h3>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">.col-md-4</div>
			<div class="col-md-4 col-md-offset-4">col-md-4 col-md-offset-4</div>
		</div>

		<div class="row">
			<div class="col-md-3 col-md-offset-1">col-md-3 col-md-offset-1</div>
		</div>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">col-md-6 col-md-offset-3</div>
		</div>
	</div>
	<hr>
	<div>
		<h3>列嵌套</h3>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-9">
				LEVEL1:.col-md-9
				<div class="row">
					<div class="col-md-8">LEVEL2:.col-md-8</div>
					<div class="col-md-4">LEVEL2:.col-md-4</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>