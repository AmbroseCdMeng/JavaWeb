<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 扩展 -- iCheck 复选框和单选按钮</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!-- css 引用 -->
<!--  ICheck CSS -->

<link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/iCheck/1.0.2/skins/all.css">

<!-- 公共页面引用 -->
<%@ include file="/resources/common/jslib.jsp"%>

<!-- js 引用 -->
<!-- ICheck JS -->
<script src="https://cdn.bootcss.com/iCheck/1.0.2/icheck.js"></script>
</head>
<body>
	<div id="icheck_demo01">
		<input type="checkbox" />
		<label>checkBox</label>
		<input type="checkbox" checked="checked">
		<label>checkBox</label>
		<input type="radio" name="iCheck">
		<label>radioButton </label>
		<input type="radio" name="iCheck" checked="checked">
		<label>radioButton</label>
	</div>
	<div id="icheck_demo02">
		<input type="checkbox">
		<label>checkBox</label>
		<input type="checkbox" checked="checked">
		<label>checkBox</label>
		<input type="radio" name="iCheck">
		<label>radioButton </label>
		<input type="radio" name="iCheck" checked="checked">
		<label>radioButton</label>
	</div>
	<script type="text/javascript">
	<!-- 初始化 ICheck 插件 -->
		$(function() {
			//支持所有的 JQuery 选择器， 但只会对 checkbox 和 radio 起作用
			$('#icheck_demo01 input').iCheck({
				//只初始化复选框或单选按钮。默认两种都初始化
				handle : '',
				//复选框样式
				//checkboxClass : 'icheckbox_square-blue',
				//格式： 类型_皮肤名称-颜色
				checkboxClass : 'icheckbox_minimal-red',
				//单选按钮样式
				radioClass : 'iradio_flat-orange',
				//可以点击的区域大小
				increaseArea : '20%',
				//选择标记中插入文本或HTML代码
				insert : ''
			});

			$('#icheck_demo02 input').each(function() {
				//ICheck Line 皮肤需要单独取出进行设置

				//取出 input 的 label 元素中的 text 文本
				var self = $(this), label = self.next(), label_text = label.text();
				//移除 label 元素
				label.remove();

				//对 input 进行 iCheck 初始化
				self.iCheck({
					checkboxClass : 'icheckbox_line-green',
					radioClass : 'iradio_line-purple',
					insert : '<div class="icheck_line-icon"></div>' + label_text
				});

			});
		})
	</script>
</body>
</html>