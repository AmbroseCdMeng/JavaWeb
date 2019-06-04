<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form -- Validform</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<link href="${ctx }/resources/css/form/validform/style.css" rel="stylesheet">
<%@include file="/resources/common/jslib.jsp"%>
<script type="text/javascript" src="${ctx }/resources/js/form/validform/Validform_v5.3.2.js"></script>

<style type="text/css">
table {
	border-collapse: collapse
}

tr th,td {
	min-width: 105px;
	min-height:26px;
	border: solid 1px #000;
	text-align: center;
	font-size: 18px;
}
th {
	background-color: #999;
}
caption{
text-align: center;
font-size: 30px;
}
div {
	margin-bottom: 50px;
}
</style>
</head>
<body>

	<div id="form1">
		<div>
			<table summary="2019年5月12日19:43:22">
				<caption>datatype 常用的规则：</caption>
				<tr>
					<th></th>
					<th>示例</th>
					<th>描述</th>
				</tr>
				<tr>
					<td>1</td>
					<td>*</td>
					<td>任意字符</td>
				</tr>
				<tr>
					<td>2</td>
					<td>*4-6</td>
					<td>4~6位任意字符</td>
				</tr>
				<tr>
					<td>3</td>
					<td>n</td>
					<td>任意数字</td>
				</tr>
				<tr>
					<td>4</td>
					<td>n4-6</td>
					<td>4~6位任意数字</td>
				</tr>
				<tr>
					<td>5</td>
					<td>m</td>
					<td>手机号码</td>
				</tr>
				<tr>
					<td>6</td>
					<td>e</td>
					<td>邮箱账号</td>
				</tr>
				<tr>
					<td>7</td>
					<td>\w{3,10}/i</td>
					<td>自定义的正则表达式。 3~10 位大小写字母</td>
				</tr>
				<tr>
					<td>8</td>
					<td>m,n</td>
					<td>逗号表示"且"。纯数字且为手机号码</td>
				</tr>
				<tr>
					<td>9</td>
					<td>m|e</td>
					<td>竖线表示e"或"。手机号码或者邮箱站好</td>
				</tr>
				<tr>
					<td>10</td>
					<td>m|e,*4-18|\w{3,6}/i</td>
					<td>datatype 还支持简单的逻辑运算。表示：手机号码，或者4~18位邮箱账号，或者3~6位大小写字母。（或的权重大于且）</td>
				</tr>
				<tr>
					<td colspan="3">Other Tips</td>
					
				</tr>
				<tr>
					<td>11</td>
					<td>nullmsg</td>
					<td>输入的内容不满足验证条件时的提示信息</td>
				</tr>
				<tr>
					<td>12</td>
					<td>ignore</td>
					<td>非必须输入，但如果输入了内容，需要验证规则</td>
				</tr>
				<tr>
					<td>13</td>
					<td>recheck</td>
					<td>与表单中其他的元素进行比较。例如最常见的注册用户时两次密码是否相同确认！</td>
				</tr>
			</table>

		</div>


		<form id="validForm" action="" method="post">
			<div class="form-group has-feedback">
				<!-- datatype 表示验证规则。datatype="*" 意为任意不为空的字符，datatype="*4-16" 意为4~16位任意字符。 nullmsg 为验证失败时的提示信息 -->
				<input type="text" name="username" datatype="*" nullmsg="Please Input Your Username" placeholder="Username" />
			</div>

			<div class="form-group has-feedback">
				<input type="password" name="password" datatype="*" nullmsg="Please Input Your Password" placeholder="Password" />
			</div>
			<div class="row">
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat">Login</button>
				</div>
			</div>
		</form>
	</div>

</body>


<script type="text/javascript">
	$(function() {
		//---------------------
		// 表单 ValidForm 初始化
		//---------------------

		$("#validForm").Validform({
			/* 提示信息显示（内置4种显示方式，也可以自定义）：
				1：弹出框显示
				2：当前元素的父级的next对象的子级中显示
				3：当前元素的siblings对象中显示
				4：当前元素的父级的next对象中显示 	*/
			tiptype : 3,
			ignoreHidden:false,//为 true 时，type = 'hidden' 的元素不做验证
			dragonfly:false,//为 true 时，值为空的元素不做验证
			tipSweep:false,//为 true 时，表单只在提交时进行验证。为 false 时，表单元素失去焦点时触发验证
			showAllError:true,//为 true 时，显示所有元素的验证信息。为 false 时，只要有元素验证失败就直接显示，不进行后面元素的检查
			ajaxPost:false,//为 true 时，使用 Ajax 方式提交表单数据
			callback:function(json){//回调方法，与ajaxPost配合使用。
				console.info(json);
			}
		})
	})
</script>
</html>