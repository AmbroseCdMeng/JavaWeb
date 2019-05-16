<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileInput</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<%@include file="/resources/common/jslib.jsp"%>
</head>
<body>

	<!-- <input id="input-b1" name="input-b1" type="file"> -->

	<h5>Form 表单提交</h5>
	<div>
		<form action="${ctx }/form/saveDropifyImg" id="form1" enctype="multipart/form-data" method="post" role="form">
			<div class="form-group">
				<input class="file" name="input-b2" type="file" data-language="zh" data-requied="true" data-msg-file-required="至少选择一个文件">
			</div>
			<div class="box-footer text-center">
				<button type="submit" class="btn btn-lg btn-success">
					<i class="fa fa-upload">上传</i>
				</button>
			</div>
		</form>
	</div>
	
	
	<h5>内置 Ajax 提交</h5>
	<div>
		<input id="input-b2" name="input-b2" type="file" data-url="${ctx }/form/saveDropifyImg">
	</div>

	<script type="text/javascript">
		$(function() {

		})

		/*默认初始化*/
		$('#input-b1').fileinput();

		/*带参初始化:语言*/
		$('#input-b1').fileinput({
			'language' : 'zh'
		});

		/************/
		/*  FileInput 有两种上传文件模式 ：Form 表单 & 内置 Ajax  */
		/*  两种方式都可以使用，但 切记	两种模式	交叉	使用		*/
		/************/

		/* 1、Form 表单 */
		/* Form 表单提交时。对于文件多选的情况，FileInput 会覆盖和清除之前的选择 */
		$('#form1').submit(function(e) {
			e.preventDefault();
			var $form = $(this), data = new FormData($form[0]);

			$.ajax({
				data : data,
				type : 'POST',
				url : $form.attr('action'),
				contentType : false,
				processData : false,
				success : function(json) {
					if (json.statusCode == 200) {
						layer.msg(json.map.imgUrl);
					} else {
						layer.msg(json.message);
					}
				}
			})
		})
		
		
		/* 2、内置 Ajax */
		/* 必须将 uploadUrl 选项设置为有效的 Ajax 请求。 */
		$('#input-b2').fileinput({
			language:'zh',
			uploadUrl:$(this).data('url'),
			
		})
	</script>
</body>
</html>