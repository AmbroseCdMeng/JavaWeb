<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dropify</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<%@include file="/resources/common/jslib.jsp"%>

<link href="https://cdn.bootcss.com/Dropify/0.2.2/css/dropify.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.bootcss.com/Dropify/0.2.2/js/dropify.js"></script>
</head>
<body>

	<input class="dropify" id="input-file-now" type="file">

	<input class="dropify_submit" id="dropifyImg" name="dropifyImg" type="file" data-allowed-file-extensions="png jpg jpeg"
		data-max-file-size="1M" data-url="${ctx }/form/saveDropifyImg">

	<script type="text/javascript">
		$(function() {
			$('input.dropify').dropify();
		})

		/* dropify 初始化 */
		$('input.dropify').dropify({

			/******************/
			/* 常用属性 start */
			/******************/

			defaultFile : '',//默认文件

			height : '500',//高度。单位 px
			minHeight : '300',
			maxHeight : '1366',
			minWidth : '300',
			maxWidth : '1366',

			disable : false,//禁用
			showRemove : true,//移除按钮

			maxFileSize : '10M',//上传文件的大小限制。单位 K 或 M

			showErrors : true,//显示错误信息
			errorPosition : 'outside',//错误信息位置。默认 overlay：覆盖在控件上； outside：显示在控件外
			allowedFileExtensions : '*',//允许选择的文件扩展名。多个之间用空格隔开

			maxFileSizePreview : '1M',//预览图像的最大文件大小。单位 K 或 M 或 G

			messages : {
				'default' : '拖动文件至此处或单击选择',
				'replace' : '可拖动文件或单击选择替换',
				'remove' : '移除',
				'error' : '出错了',
			},
			error : {
				'fileSize' : '文件超出最大限制，最大值为(10M)',
				'minWidth' : '图像宽度最小为(300px})',
				'maxWidth' : '图像宽度最大为(1366px)',
				'minHeight' : '图像高度最小为(300px)',
				'maxHeight' : '图像高度最大为(1366px)',
				'imageFormat' : '图像格式不符合，允许({{value}})',
				'fileExtension' : '文件后缀不符合，允许({{value}})',
			},
		/* end */

		/******************/
		/*  常用监听事件  */
		/******************/

		/*移除前*/
		}).on('dropify.beforeClear', function(event, element) {
			return layer.confirm("确认删除 \"" + element.file.name + "\" 文件吗？ ");
		/*移除后*/
		}).on('dropify.afterClear', function(event, element) {
			console.info('afterClear');
		/*发生错误时*/
		}).on('dropify.errors', function(event, element) {
			console.error('errors');
		}).on('dropigy.error.fileSize', function (event, element) {
			console.error('可以具体指定错误事件');
		})
	</script>
	
	
	<script type="text/javascript">
	
	$('#dropifyImg').dropify();
	$('#dropifyImg').change(function (e) {
		var $this = $(this), file = e.target.files[0], data = new FormData();
		data.append($this.attr('name'), file);
		
		$.ajax({
			data : data,
			type:'POST',
			url:$this.data('url'),
			contentType:false,
			processData:false,
			success:function(json){
				if (json.statusCode == 200) {
					layer.msg(json.map.imgUrl);
				}else{
					layer.msg(json.message);
				}
			},
		});
	});
	
	</script>
</body>
</html>