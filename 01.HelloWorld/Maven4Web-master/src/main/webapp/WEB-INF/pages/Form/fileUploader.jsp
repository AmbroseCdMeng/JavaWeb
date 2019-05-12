<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileUploader</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<link href="${ctx }/resources/css/form/validform/style.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
<%@include file="/resources/common/jslib.jsp"%>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/language/zh_CN.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/form/validform/Validform_v5.3.2.js"></script>

</head>
<body>

	<div id="demo1">
		<span>当提交带有文件的表单时，需要配置表单的 enctype="multipart/form-data" </span>
		<form id="headimgForm" action="${ctx }/form/saveHeadimg" enctype="multipart/form-data" method="post" role="form">
			<div class="box-body">
				<div class="form-group">
					<label>头像</label>
					<input name="headimg" type="file" accept="image/*">
					<p class="help-block">Please Choose one Image</p>
				</div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		//---------------------------
		/* Ajax 提交表单并对其进行验证 */
		//---------------------------
		$('#headimgForm').bootstrapValidator({
			fields : {
				headimg : {
					validators : {
						notEmpty : {
							message : '请选择一张图片'
						},
						file : {
							extension : 'jpeg,jpg,png',
							type : 'image/jpeg, image/png',
							maxSize : 2097152,//大小 2048*1024
							message : '格式不正确或超过2M'
						}
					}
				}
			}
		}).on('success.form.bv', function(e) {
			e.preventDefault();
			//Ajax 提交

			//---------------------------------
			// 使用 FormData 对象传递文件对象
			//---------------------------------

			var $form = $(e.target), bv = $form.data("bootstrapValidator"), data = new FormData($form[0]);
			$.ajax({
				type : $form.attr('method') || 'POST',
				url : $form.attr('action'),
				data : data,
				chche : false,
				dataType : 'json',
				contenType : false,//发送数据到服务器所使用的内容类型。默认为 true，即文本URL类型。上传文件时，必须设置为 false，即form-data类型。
				processData : false,//请求发送的数据是否转换为查询字符串。默认为 true，即转换。上传文件时，设置为 false，不需要转换。
				success : function(json) {
					console.info(json);

				}
			});
		})
	</script>
</body>
</html>