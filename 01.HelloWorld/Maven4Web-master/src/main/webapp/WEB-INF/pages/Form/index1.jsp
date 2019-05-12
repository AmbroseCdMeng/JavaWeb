<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form 表单 --</title>
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

#form2, #form3 {
	margin: 55px 100px 55px 100px;
	width: 40%;
	float: left;
}

#form2 table input, #form3 table input {
	width: 355px;
}

#form2, #form3 input[type='submit'] {
	width: 420px;
}

#form3 {
	
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
		<form id="loginForm" action="${ctx }/form/login" method="post">
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
					<tr>
						<th>Age：</th>
						<td><input name="age" type="text" placeholder="Please Input Your Age" class="form-control" data-bv-notempty
								data-bv-between="true" data-bv-between-min="1" data-bv-between-max="150"
								data-bv-between-message="The Age allowed between 1 and 150"></td>
					</tr>
					<tr>
						<th>RegisterKey：</th>
						<td><input name="registerkey" type="text" placeholder="Please Input Your registerkey" class="form-control"></td>
					</tr>
					<tr>
						<th>fullname：</th>
						<td><input name="fullname" type="text" placeholder="Please Input Your fullname" class="form-control"></td>
					</tr>
				</table>
			</div>
			<div>
				<input class="btn btn-primary btn-block btn-flat" type="submit" value="Login">
			</div>
		</form>
	</div>

	<div id="form3">
		<form id="remoteForm" action="${ctx }/form/login" method="post">
			<div class="form-group has-feedback">
				<table>
					<tr>
						<th>UserName：</th>
						<td><input name="username" type="text" placeholder="Please Input Your Name" class="form-control"></td>
					</tr>
					<tr>
						<th>Password：</th>
						<td><input name="password" type="password" placeholder="Please Input Your Password" class="form-control"></td>
					</tr>
					<tr>
						<th>Email：</th>
						<td><input name="email" type="email" placeholder="Please Input Your Email" class="form-control"></td>
					</tr>
					<tr>
						<th>RegisterKey：</th>
						<td><input name="registerkey" type="text" placeholder="Please Input Your registerkey" class="form-control"></td>
					</tr>
					<tr>
						<th>fullname：</th>
						<td><input name="fullname" type="text" placeholder="Please Input Your fullname" class="form-control"></td>
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

		/* ★ 参与验证的表单域必须被 class 为 form-group 的 div 包裹，否则会初始化失败 */
		$(function() {

			/* bv 的验证分为两种，一种是 JS 代码验证（如下），一种是 html 代码验证(如form中示例与下面注释部分)*/
			$("#loginForm").bootstrapValidator({
				live : 'enabled', // live : 'enabled'。字段值发生变化时触发该验证。submitted 为提交时验证
				fields : {
					/*值范围验证*/
					age : {
						validators : {
							between : {
								min : 1,
								max : 150,
								message : 'The Age allowed between 1 and 150'
							}
						}
					},
					/*异同验证*/
					/*html属性：data-bv-different-field	data-bv-different-message*/
					registerkey : {
						validators : {
							different : {
								field : 'username',//要比较的字段名，多个字段用逗号隔开
								message : 'registerkey 不能与 username 的值相同',
							}
						}
					},
					/*大于等于验证*/
					/*html属性：data-bv-greaterthan="true" data-bv-greaterthan-value data-bv-greaterthan-message*/

					/*小于等于验证*/
					/*html属性：data-bv-lessthan="true" data-bv-lessthan-value	data-bv-lessthan-message*/

					/*为空验证*/
					/*html属性：data-bv-notempty*/

					/*整数验证*/
					/*html属性：data-bv-digits*/

					/*数字验证*/
					/*html属性：data-bv-numeric*/

					/*正则验证*/
					/*html属性：data-bv-regexp="true" pattern="^$" data-bv-regexp-message="验证失败" */
					fullname : {
						validators : {
							regexp : {
								regexp : /^[a-z\s]+$/,
								message : 'Full Name can only consist of letters and spaces'
							}
						}
					},
				}
			}).on('success.form.bv', function(e) {//'success.form.bv'。单击提交按钮时触发时间
				e.preventDefault();//e.preventDefault()。阻止表单的默认提交行为。为了测试，否则提交后将跳转到新页面
			})
		})
	</script>

	<script type="text/javascript">
		$(function() {
			$('#remoteForm').bootstrapValidator({

				/***************/
				/****远程检查****/
				/***************/

				/* 通过 Ajax 请求执行远程检查，如：验证用户名是否已经存在？ */

				live : 'enabled',
				fields : {
					username : {
						threshold : 3,//触发验证的字符数。username 输入超过 3 个字符时开始触发 remote 验证
						verbose : false,//冗余验证。 为 false 时阻止下一个验证触发。即当一个字段有多个验证器时，一个验证器失败，阻止下一个验证器触发。（一般遵循客户端验证优先服务器端验证的原则）
						validators : {
							notEmpty : {
								message : 'UserName can not be Empty'
							},
							stringLength : {
								min : 4,
								max : 22,
								message : 'The Length of username must be 4-22 characters'
							},
							remote : {
								//String 或者 Function。	远程 URL， 即 Ajax 请求的服务器端地址
								url : '${ctx}/form/username/check',

								//Object 或者 Function。	远程 URL 数据
								data : function(validator, $field, value) {
									return {
										email : validator.getFieldElements('email').val()
									};
								},

								//Number。	指定延迟触发时间。单位 ms
								delay : 1000,

								//Boolean。	跨域请求
								crossDomain : true,

								//String。	服务器返回的数据类型
								dataType : 'json',

								//String。	发送到服务器的方式
								type : 'GET',

								//String。	有效的钥匙串。默认 valid 。一般在需要连接到第三方远程库验证 API 时使用比较有价值
								validKey : 'valid',

								//String。	需要验证的字段名
								name : 'username',

								//String。	错误提示信息
								message : 'UserName already exist',
							}
						}
					}
				}
			}).on('success.form.bv', function(e) {
				e.preventDefault();//为了演示，阻止表单默认提交方式

				/********************/
				/****Ajax 提交表单****/
				/********************/
				var $form = $(e.target);
				bv = $form.data('bootstrapValidator');//获取 BootStrapValidator 实例

				$.ajax({
					type : $form.attr("method") || 'POST',
					url : $form.attr("action"),
					data : $form.serializeArray(),
					cache : false,
					dataType : "json",
					success : function(json) {
						console.info(json);
						alert(json.message);
					},
				});
			})
		})
	</script>
</body>

</html>