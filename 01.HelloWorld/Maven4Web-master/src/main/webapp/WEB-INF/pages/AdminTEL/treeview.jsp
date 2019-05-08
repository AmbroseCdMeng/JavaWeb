<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLTE -- treeview</title>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${ pageContext.request.contextPath}"></c:set>
<link type="text/css" rel="stylesheet" href="${ctx}/resources/css/treeview/bootstrap-treeview.min.css">

<%@include file="/resources/common/jslib.jsp"%>
<script type="text/javascript" src="${ctx}/resources/js/treeview/bootstrap-treeview.min.js"></script>
</head>
<body>
	<h2>BootStrap -- TreeView</h2>

	<div id="treeview"></div>

	<script type="text/javascript">
		var treeviewDefaultDate = [ {
			text : '目录',
			nodes : [ {
				text : '第一章',
				nodes : [ {
					text : '1-1'
				}, {
					text : '1-2'
				} ]
			}, {
				text : '第二章',
				nodes : [ {
					text : '2-1'
				}, {
					text : '2-2'
				} ]
			}, {
				text : '第三章'
			}, {

				/**********************/
				/*******常用属性*******/
				/**********************/

				text : '第四章', //必填。树节点所显示文本
				icon : '', //树节点显示的图标。可以使用内置的  glyphicon glyphicon-stop 等、也可以使用 FontAwesome 的图标，如 fa fa-square-o
				selectedIcon : '', //树节点被选中后的图标
				color : '#000', //前景色
				backColor : '#FFF', //背景色
				href : '#node-1', //指定节点的锚标记。通常结合 enableLinks 使用
				selectable : true, //是否可以选择。false 会将节点默认展开切不能选择
				state : { //指定节点的初始状态
					checked : true, //选中
					disable : true, //不可选
					expanded : true,//展开
					selected : true
				//可选
				},
				tags : [ 'available' ],//结合 showTags 配置项，在树节点右侧添加额外的信息。接收字符串数组。
				nodes : [ {
					text : '总结'
				} ]
			} ]
		} ]

		/**********************/
		/*******常用配置*******/
		/**********************/

		$('#treeview').treeview({
			data : treeviewDefaultDate, //对象数组		数据源
			backColor : '#FFF', //String.		所有树视图节点的背景色
			borderColor : 'DDD', //String.		树视图容器的边框原色
			checkedIcon : 'glyphicon glyphicon-check', //String		选中的图标
			collapseIcon : 'glyphicon glyphicon-minus', //String	收缩节点的图标
			color : '#000', //String		树视图所有节点的前景色
			emptyIcon : 'glyphicon', //String		没有节点时的图标
			enableLinks : 'false', //Boolean	是否将节点文本显示为超链接。需要在节点中提供 href 值
			expandIcon : 'glyphicon glyphicon-plus', //String	可展开节点的图标
			HighlightSearchResults : true, //Boolean	高亮显示搜索结果
			HighlightSelected : true, //高亮显示选中节点
			onhoverColor : '#F5F5F5', //String	鼠标悬浮颜色
			levels : 2,//默认展开层级。默认 2 。表示当嵌套层级大于 2 时展开前 2 层。
			multiSelect : false, //Boolean	是否允许多选
			showCheckbox : true, // Boolean	显示复选框
		})

		/**********************/
		/*******常用方法*******/
		/**********************/

		//调用方法的两种方式
		//$("#mytreeview").treeview('functionname', params);//参数：方法名， 参数
		//$("#mytreeview").data('treeview').functionname(params);
		/*	1、勾选所有节点	*/
		$('#treeview').treeview('checkAll', {
			silent : true
		});//selent:true 可以阻止 nodeChecked 事件的发生

		/*	2、勾选指定节点	*/
		$('#treeview').treeview('checkNode', [ 2, {
			silent : true
		} ]);//仅勾选指定节点，不包含子节点

		/*	3、获取勾选的节点	*/
		$('#treeview').treeview('getChecked');//返回数组。

		/*	4、取消勾选的所有节点	*/
		$('#treeview').treeview('uncheckAll', {
			silent : true
		});//取消勾选的所有节点

		/*	5、取消勾选指定节点	*/
		$('#treeview').treeview('uncheckNode', [ 3, {
			silent : true
		} ]);//

		/*	6、获取未勾选的节点	*/
		$('#treeview').treeview('getUnchecked');

		/*	7、切换节点的勾选状态	*/
		$('#treeview').treeview('toggleNodeChecked', [ 4, {
			silent : true
		} ]);//不会影响到子节点

		/*	8、折叠所有节点	*/
		$('#treeview').treeview('collapseAll', {
			silent : true
		});//silent:true 可以阻止 nodeCollapsed 事件的发生; 	

		/*	9、折叠指定节点和子节点	*/
		$('#treeview').treeview('collapseNode', [ 2, {
			silent : true,
			ignoreChildren : false
		} ]);//ignoreChildren:false 忽略子节点

		/*	10、获取折叠节点	*/
		$('#treeview').treeview('getCollapsed');//叶子节点没有子节点，不存在展开状态，默认会作为折叠节点返回

		/*	11、展开所有指定等级的节点	*/
		$('#treeview').treeview('expandAll', {
			level : 1,
			silent : true
		});//如果没有指定 level 则默认所有

		/*	12、展开指定的树节点	*/
		$('#treeview').treeview('expandNode', [ 3, {
			silent : true
		} ]);

		/*	13、获取展开节点	*/
		$('#treeview').treeview('getExpanded');//返回一个数组

		/*	14、切换指定节点的展开和折叠状态	*/
		$('#treeview').treeview('toggleNodeExpanded', [ 4, {
			silent : true
		} ]);//

		/*	15、禁用所有节点	*/
		$('#treeview').treeview('disableAll', {
			silent : true
		});//

		/*	16、禁用指定节点（含子节点）	*/
		$('#treeview').treeview('disableNode', [ 3, {
			silent : true
		} ]);//子节点也会被禁用

		/*	17、获取被禁用的节点	*/
		$('#treeview').treeview('getDisabled');//

		/*	18、启用所有节点	*/
		$('#treeview').treeview('enableAll', {
			silent : true
		});//

		/*	19、启用指定节点	*/
		$('#treeview').treeview('enableNode', [ 3, {
			silent : true
		} ]);//

		/*	20、获取可用节点	*/
		$('#treeview').treeview('getEnabled');//

		/*	21、切换节点的可用和不可用状态	*/
		$('#treeview').treeview('toggleNodeDisabled', [ 4, {
			silent : true
		} ]);//

		/*	22、选择指定的节点	*/
		$('#treeview').treeview('selectNode', [ 1, {
			silent : true
		} ]);//

		/*	23、获取选择节点	*/
		$('#treeview').treeview('getSelected');//

		/*	24、取消选择指定节点	*/
		$('#treeview').treeview('unselectNode', [ 3, {
			silent : true
		} ]);//

		/*	25、获取未选择的节点	*/
		$('#treeview').treeview('getUnselected');//

		/*	26、切换节点的选择和未选择状态	*/
		$('#treeview').treeview('toggleNodeSelected', [ 2, {
			silent : true
		} ]);//

		/*	27、获取指定节点的节点对象	*/
		$('#treeview').treeview('getNode', 1);//

		/*	28、获取指定节点的父节点	*/
		$('#treeview').treeview('getParent', 2);//

		/*	29、获取指定节点的兄弟节点数组	*/
		$('#treeview').treeview('getSiblings', 3);//

		/*	30、显示一个节点到根节点的所有节点（追溯到根节点）	*/
		$('#treeview').treeview('revealNode', 4);//

		/*	31、搜索与指定字符匹配的节点并凸显	*/
		$('#treeview').data('treeview').search('第二章', {
			ignoreCase : true,//忽略大小写
			exactMatch : false,//精确匹配。false：模糊匹配
			revealResults : true,//展开搜索到的节点
		})

		/*	32、清空搜索结果	*/
		$('#treeview').treeview('clearSearch');//
		
		
		/**********************/
		/*******常用监听*******/
		/**********************/
		
		//nodeChecked(event, node)		勾选
		//nodeUnchecked(event, node)	取消勾选
		//nodelSelected(event, node)	选择
		//nodeUnselected(event, node)	取消选择
		//nodeCollapsed(event, node)	折叠
		//nodeExpanded(event, node)		展开
		//nodeDisabled(event, node)		禁用
		//nodeEnabled(event, node)		启用
		//searchComplete(event, results)	搜索完成
		//searchCleared(event, results)		搜索结果被清除
		
// 		$('#treeview').treeview({
// 			onNodeChecked:function(event, data){
// 				console.log("onNodeChecked:function");
// 			}
// 		})
	</script>
</body>
</html>