<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>From 表单 --</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<%-- <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/form/"> --%>
<link href="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">

<%@include file="/resources/common/jslib.jsp"%>
<%-- <script type="text/javascript" src="${ctx }/resources/js/form/"></script> --%>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js">
	
</script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/language/zh_CN.js"></script>

<style>
#form1 table {
	border-collapse: collapse
}

tr td {
	width: 255px;
	border: solid 1px #000;
}

tr td input, select, textarea {
	width: 150px;
	margin: 10px 5px 10px 5px;
}

#form1 thead {
	background-color: #888;
	border: black;
	text-align: center;
}

#form2 {
	margin-top: 55px;
}

#form2 table input {
	width: 355px;
}

#form2 input[type='submit'] {
	width: 420px;
}
</style>
</head>

<body>
	<div id="form1">
		<form action="">
			<table>
				<tr>
					<td><input type="text" value="text"></td>
					<td><input type="button" value="button"></td>
					<td><select><option>Select-1</option></select></td>
					<td><textarea>textarea</textarea></td>
					<td><input type="password" value="password"></td>
					<td><input type="radio" value="1">radio</td>
					<td><input type="checkbox" value="1">checkbox</td>
					<td><input type="number" value="123456789"></td>
					<td><input type="file" value="file"></td>
					<td><input type="color"></td>
					<td><input type="email" value="395239311@qq.com"></td>
				</tr>
				<tr>
					<td><input type="search" value="search"></td>
					<td><input type="tel" value="tel"></td>
					<td><input type="url" value="/Maven4Web/form/index1"></td>
					<td><input type="range"></td>
					<td><input type="date"></td>
					<td><input type="datetime"></td>
					<td><input type="datetime-local"></td>
					<td><input type="month"></td>
					<td><input type="week"></td>
					<td><input type="time"></td>
					<td><input type="submit" value="submit"></td>
				</tr>
			</table>

		</form>
	</div>

	<div id="form2">
		<form id="loginForm" action="${ctx }/form/checkLogin" method="post">
			<div class="form-group has-feedback">
				<table>
					<tr>
						<th>UserName：</th>
						<td><input name="username" type="text" placeholder="Please Input Your Name" class="form-control" data-bv-notempty></td>
					</tr>
					<tr>
						<th>Password：</th>
						<td><input name="password" type="password" placeholder="Please Input Your Password" class="form-control" data-bv-notempty></td>
					</tr>
				</table>
			</div>
			<div>
				<input class="btn btn-primary btn-block btn-flat" type="submit" value="Login">
			</div>
		</form>
	</div>

	<script type="text/javascript">
		/* 使用 BootStrapValidator 初始化 form 表单 */
		$(function() {
			
			$("#loginForm").bootstrapValidator({
				live : 'enabled',		// live : 'enabled'。字段值发生变化时触发该验证。submitted 为提交时验证
			}).on('success.form.bv', function(e) {//'success.form.bv'。单击提交按钮时触发时间
				e.preventDefault();//e.preventDefault()。阻止表单的默认提交行为。为了测试，否则提交后将跳转到新页面
			})
		})
	</script>
</body>

</html>