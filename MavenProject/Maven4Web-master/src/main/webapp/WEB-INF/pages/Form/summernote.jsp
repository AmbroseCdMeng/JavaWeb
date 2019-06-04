<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>summernote</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%@include file="/resources/common/jslib.jsp"%>

</head>
<body>

	<div id="summernote"></div>

	<script type="text/javascript">
	
		/******************/
		/**** 初始配置 ****/
		/******************/
		$('#summernote').summernote(
				{
					lang : 'zh-CN',
					toolbar : [ [ 'style', [ 'bold', 'italic', 'underline', 'clear' ] ],
							[ 'font', [ 'strikethrougn', 'superscript', 'subscript' ] ], [ 'fontsize', [ 'fontsize' ] ],
							[ 'color', [ 'color' ] ], [ 'para', [ 'ul', 'ol', 'paragraph' ] ], [ 'height', [ 'height', ] ] ],//工具栏
					placeholder : '三日可断肠，三日亦可动情',
					fontNames : [ '黑体', '宋体', '楷体', '微软雅黑' ],//字体列表
					fontNamesIgnoreCheck : [ 'Merriweather' ],//忽略字体检查
					dialogsInBody : true,//在模态框中使用 Summernote 
					dialogsFade : true,//对话框淡出淡出效果
					disableDragAndDrop : true, //允许直接拖动一段文字或图像
					height : 350,//编辑器高度。如果超出，会出现滚动条
					minHeight : 150,
					maxHeight : 550,
					focus : true,//初始化完成后，可编辑区域获得焦点
					airMode : true,//弹出式工具栏。该模式下，顶部不会有固定的工具栏，选中文本后会弹出式工具栏
					popover : {
						air : [ [ 'color', [ 'color' ] ], [ 'font', [ 'bold', 'underline', 'clear' ] ] ]
					},//弹出式工具栏
				})

		/******************/
		/**** 常用方法 ****/
		/******************/
		$('#summernote').summernote('editor.insertText', '道可道，非常道。名可名，非常名');//初始化时插入文字。其中 editor 为默认模块，可以省略
		$('#summernote').summernote('isEmpty');//内容是否为空。返回 bool。
		$('#summernote').summernote('reset');//重置。清除编辑器内容和历史记录
		$('#summernote').summernote('enable');
		$('#summernote').summernote('disable');
		$('#summernote').summernote('destory');
		$('#summernote').summernote('code');//获取编辑器的 HTML 内容。如果有多个编辑器，可以使用 JQ 的 eq 获取指定编辑器
		$('#summernote').summernote('code', 'newnode here');//设置编辑器的 HTML 内容。

		$('#summernote').summernote('insertImage', 'url', 'filename');//插入图片。filename 可以是回调函数，动态生成文件名和属性
		$('#summernote').summernote('insertNode', '<div></div>');//插入 DOM 元素。
		$('#summernote').summernote('insertText', 'text');//插入文本
		$('#summernote').summernote('creatLink', {
			url : 'https://github.com',
			text : 'GitHub',
			isNewWindo : true
		});//插入链接

		/******************/
		/**** 监听事件 ****/
		/******************/
		$('#summernote').on('summernote.init', function(){});//通过 JQuery 绑定事件。
		//通过 summernote 的 callbacks 选项绑定
		$('#summernote').summernote({
			callbacks:{
				onInit:function(){
					layer.msg('初始化完成');
				},
				onEnter:function(){
					layer.msg('按下Enter键');
				},
				onFocus:function(){
					layer.msg('编辑区获得焦点');
				},
				onBlur:function(){
					layer.msg('编辑区失去焦点');
				},
				onKeyup:function(){
					layer.msg('按键释放');
				},
				onKeydown:function(){
					layer.msg('按键按下');
				},
				onPaste:function(){
					layer.msg('粘贴');
				},
				//默认情况下，会对选择的图像进行 base64 编码，这样就可以直接提交到服务器，不需要对图片进行单独上传
				//如果有时候需要先将文件上传到服务器，然后通过服务器返回的信息将指定文件插入富文本编辑区，此时就需要操作 onImageUpload 方法
				onImageUpload:function(){
					layer.msg('插入图像');
					var $files = $(files);
					//each 遍历每个 file
					$files.each(function(i){
						var file = this;
						var data = new FormData();
						data.append('summernote_img_' + i.file);
						$.ajax({
							data:data,
							type:'POST',
							url:'${ctx}/form/saveSummernoteImg',
							contenType:false,
							processData:false,
							success:function(json){
								if (json.statusCode == 200) {
									$('#summernote').summernote('insertImage', json.map.imaUrl, json.map.paramterName)
								}
							},
						});
					});
				},
				onChange:function(){
					layer.msg('编辑器内容改变');
				}
			},
		})
	</script>

</body>
</html>