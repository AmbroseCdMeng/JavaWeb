<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form -- Captcha 验证码</title>
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
	<div class="row kaptcha">
		<div class="col-xs-8">
			<div class="form-group has-feedback">
				<input type="text" class="form-control" name="kaptchaCode" data-bv-notempty data-bv-blank placeholder="验证码">
				<span class="glyphicon glyphicon-screenshot form-control-feedback"></span>
			</div>
		</div>
		<div class="col-xs-4">
			<img class="img-responsive" alt="" src="${ctx}/form/kaptcha">
		</div>
	</div>


	<script type="text/javascript">
	
		/* 点击图片切换验证码 */
		$('.kaptcha img').click(function() {
			var $this = $(this), $kaptchaCode = $this.closest(".kaptcha").find("input[name=kaptchaCode]");
			$this.attr("src", $this.attr("src") + "?r=" + Math.random());
			$kaptchaCode.val("");
		})
	</script>
</body>
</html>