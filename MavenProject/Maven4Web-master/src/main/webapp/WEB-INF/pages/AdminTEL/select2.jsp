<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLTE -- select2</title>
<link href="https://cdn.bootcss.com/select2/4.0.5/css/select2.css" rel="stylesheet" type="text/css">
<%@include file="/resources/common/jslib.jsp"%>
<script type="text/javascript" src="https://cdn.bootcss.com/select2/4.0.5/js/select2.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/select2/4.0.5/js/i18n/zh-CN.js"></script>

</head>
<body>
	<h2>强大的下拉框插件</h2>

	<div id="base">
		<select class="js-example-basic-single form-control">

			<optgroup label="东">
				<option value="JS">江苏</option>
				<option value="SD">山东</option>
				<option value="AH">安徽</option>
				<option value="ZJ">浙江</option>
			</optgroup>
			<optgroup label="南">
				<option value="HN">湖南</option>
				<option value="GD">广东</option>
				<option value="GX">广西</option>
				<option value="GZ">贵州</option>
			</optgroup>
			<optgroup label="西">
				<option value="XJ">新疆</option>
				<option value="XZ">西藏</option>
				<option value="QH">青海</option>
			</optgroup>
			<optgroup label="北">
				<option value="NM">内蒙</option>
				<option value="XJ">甘肃</option>
				<option value="JL">陕西</option>
			</optgroup>
		</select>
	</div>

	<hr>
	<br>
	<br>

	<p>经过select2初始化后的下拉框会自动多出来模糊检索输入框</p>
	<div id="select2_demo">
		<select class="js-example-basic-multiple form-control" multiple="multiple">
			<optgroup label="东">
				<option value="JS">江苏</option>
				<option value="SD">山东</option>
				<option value="AH">安徽</option>
				<option value="ZJ">浙江</option>
			</optgroup>
			<optgroup label="南">
				<option value="HN">湖南</option>
				<option value="GD">广东</option>
				<option value="GX">广西</option>
				<option value="GZ">贵州</option>
			</optgroup>
			<optgroup label="西">
				<option value="XJ">新疆</option>
				<option value="XZ">西藏</option>
				<option value="QH">青海</option>
			</optgroup>
			<optgroup label="北">
				<option value="NM">内蒙</option>
				<option value="GS">甘肃</option>
				<option value="SX">陕西</option>
			</optgroup>
		</select>
	</div>


	<script type="text/javascript">
		$(function() {
			//在 DOM 元素未加载完成的情况下进行初始化 select2 是不安全的。所以 select2 的初始化放在 $(function) 中
			//经过select2初始化后的下拉框会自动多出来模糊检索输入框
			$("#select2_demo .js-example-basic-multiple").select2({

				placeholder : "点击此处选择",//空白提示字符串
				ajax : null,//Ajax 数据源
				allowClear : false,//清除按钮
				closeOnSelect : true,//选择后关闭下拉框
				disabled : false,//是否可用
				//dropdownParent:$("")//指定下拉框所属位置（JQ选择器或DOM节点）
				//escapeMarkup : Utils.escapeMarkUp,//自定义模板（回调函数）
				language : "EnglishTransilation",//语言环境
				matcher : matchFunc,//检索输入框匹配规则
				maximumSelectionLength : 0,//允许多选时的最大项目数。小于 1 时不限制
				maximumInputLength : 0,//可检索项最大字符数
				minimumInputLength : 0,//触发检索的最小字符数
				minimumResultsForSearch : 0,//下拉列表中显示搜索框所需的最小结果数
				multiple : true,//启用多选模式
				selectOnClose : false, //下拉列表关闭时自动选择一个
			//templateResult:function(){},//搜索结果自定义模板（回调函数）
			//TemplateSelection : function() { },//选择选项后呈现的效果自定义模板（回调函数）
			});
		});

		// 自定义 select2 的检索输入框匹配规则
		function matchFunc(params, data) {
			// 如果没有输入条件，返回所有 data
			if ($.trim(params.term) === '') {
				return data;
			}

			//跳过没有自数据的数据，即只检索数据子项
			if (typeof data.children === 'undefined') {
				return null;
			}

			var filteredChildren = [];
			$.each(data.children, function(index, child) {
				//params.term	检索关键字
				//data.text		数据对象要显示的文本
				//data.id		数据对象唯一索引

				//值或文本都与检索输入框进行匹配
				if (child.text.toUpperCase().indexOf(params.term.toUpperCase()) > -1
						|| child.id.toUpperCase().indexOf(params.term.toUpperCase()) > -1) {
					filteredChildren.push(child);
				}
			});

			//返回检索结果
			if (filteredChildren.length) {
				var modifiedData = $.extend({}, data, true);
				modifiedData.children = filteredChildren;
				//返回数据
				return modifiedData;
			}
			return null;
		}
	</script>

	<script type="text/javascript">
		// 	Select2 的操作
		$("#myselect").val('1');//选中值为 1 的选项
		$("#myselect").val(['1', '2']);// 选中值为 1 和 2 的选项
		
		$("#myselect").trigger('change');//通知组件选中项发生了变化
		
		$("#myselect").val(null).trigger('change');//清除选中项
		
		$("#myselect").select2('data');//返回当前项的所有源数据
		$("#myselect").find(":selected");//返回当前项的 JQuery 对象。不包含源数据
		
		$("#myselect").on('select2:select', function(e){
			var data = e.params.data;
			console.log(data);
		});
		
	</script>
</body>
</html>