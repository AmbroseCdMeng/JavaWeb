<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap 的栅格系统和常用CSS样式</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/bootstrap/bootstrap.css">
<%@include file="/resources/common/jslib.jsp"%>
<script type="text/javascript"
	src="${ctx }/resources/js/bootstrap/bootstrap.js"></script>

</head>
<body>
	<div>
		<h1>BootStrap 的常用样式</h1>
	</div>

	<div>
		<h3>列表 & 文本的常用样式</h3>
	</div>
	<div>
		<p class="text-left">左对齐</p>
		<p class="text-center">居中对齐</p>
		<p class="text-right">右对齐</p>
		<p class="text-justify">两端对齐</p>
	</div>
	<hr>
	<div>
		<p>1、默认的无序列表（默认小圆点 & 内边距）</p>
		<ul>
			<li>面对敌人需要勇气</li>
			<li>但敢于直面朋友，需要更大的勇气</li>
		</ul>
		<p>2、无样式列表（移除默认小圆点 & 内边距）</p>
		<ul class="list-unstyled">
			<li>真正的爱情不是一时的好感</li>
			<li>而是我知道遇到你不容易，错过了会更可惜</li>
		</ul>
		<p>3、水平排列（常用来对表单数据进行描述）</p>
		<dl>
			<dt>姓名</dt>
			<dd>James Harden</dd>
			<dt>位置</dt>
			<dd>双能卫</dd>
			<dt>号码</dt>
			<dd>13</dd>
		</dl>
		<dl class="dl-horizontal">
			<dt>姓名</dt>
			<dd>James Harden</dd>
			<dt>位置</dt>
			<dd>双能卫</dd>
			<dt>号码</dt>
			<dd>13</dd>
		</dl>
	</div>
	<hr>
	<div>
		<h3>表格的常用样式</h3>
	</div>
	<p>BootStrap 为表格提供了 4 种附加样式：</p>
	<ul>
		<li>条纹状表格(.table-striped)</li>
		<li>带边框的表格(.table-bordered)</li>
		<li>鼠标悬停表格(.table-hover)</li>
		<li>紧缩表格(.table-condensed)</li>
	</ul>

	<!-- 	在 table 的外部元素包裹 .table-responsive 实现响应式 -->
	<div class="table-responsive">
		<table class="table-striped">
			<tr>
				<td>水是眼波横</td>
				<td>山是眉峰聚</td>
				<td>世事大梦一场</td>
				<td>人生几度秋凉</td>
			</tr>
			<tr>
				<td>消失在人海</td>
				<td>错过就不在</td>
			</tr>
		</table>
		<hr>
		<table class="table-bordered">
			<tr>
				<td>水是眼波横</td>
				<td>山是眉峰聚</td>
				<td>世事大梦一场</td>
				<td>人生几度秋凉</td>
			</tr>
			<tr>
				<td>消失在人海</td>
				<td>错过就不在</td>
			</tr>
		</table>
		<hr>
		<table class="table-hover">
			<tr>
				<td>水是眼波横</td>
				<td>山是眉峰聚</td>
				<td>世事大梦一场</td>
				<td>人生几度秋凉</td>
			</tr>
			<tr>
				<td>消失在人海</td>
				<td>错过就不在</td>
			</tr>
		</table>
		<hr>
		<table class="table-condensed">
			<tr>
				<td>水是眼波横</td>
				<td>山是眉峰聚</td>
				<td>世事大梦一场</td>
				<td>人生几度秋凉</td>
			</tr>
			<tr>
				<td>消失在人海</td>
				<td>错过就不在</td>
			</tr>
		</table>
	</div>

	<hr>
	<div>
		<h3>表单的常用样式</h3>
	</div>
	<div class="container">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">推荐人</label>
				<div class="col-sm-10">
					<p class="form-control-static">王老二</p>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" placeholder="邮箱">
					<span class="help-block">使用邮箱登录</span>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label><input type="checkbox">记住密码</label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-defaule">登录</button>
				</div>
			</div>
		</form>
	</div>

	<hr>

	<div>
		<h3>按钮的常用样式</h3>
	</div>
	<div>
		<button type="button" class="btn btn-default">默认</button>
		<button type="button" class="btn btn-primary">首选项</button>
		<button type="button" class="btn btn-success">成功</button>
		<button type="button" class="btn btn-info btn-lg">一般信息</button>
		<button type="button" class="btn btn-warning btn-sm">警告</button>
		<button type="button" class="btn btn-danger btn-xs">危险</button>
		<button type="button" class="btn btn-link">连接</button>
		<!-- .btn-block 拉伸到父元素100% -->
		<button type="button" class="btn btn-danger btn-block">危险</button>
	</div>

	<hr>

	<div>
		<h3>图片的常用样式</h3>
		<!-- 圆角方形 -->
		<div>
			<img class="img-rounded" alt=""
				src="${ctx}/resources/images/mmexport1538743116457.jpg">
		</div>
		<!-- 圆形 -->
		<div>
			<img class="img-circle" alt=""
				src="${ctx}/resources/images/mmexport1538743116457.jpg">
		</div>
		<!-- 缩略图 -->
		<div>
			<img class="img-thumbnail" alt=""
				src="${ctx}/resources/images/mmexport1538743116457.jpg">
		</div>
	</div>

	<hr>

	<div>
		<h3>浮动常用样式</h3>
		<ul>
			<li>左浮动（.pull-left）</li>
			<li>右浮动（.pull-right）</li>
			<li>居中浮动（.center-block）</li>
			<li>清除浮动（.clearfix）</li>
		</ul>
	</div>
</body>
</html>