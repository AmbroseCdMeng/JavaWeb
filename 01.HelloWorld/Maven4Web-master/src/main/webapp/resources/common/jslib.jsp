<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS库文件管理</title>
<!-- JQuery程序库 -->

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<script type="text/javascript" src="${ctx}/resources/js/jquery-3.3.1.js"></script>

<!-- 引入 bootstrap 相关 js 文件 和 css 文件  -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap/bootstrap.css">
<script src="${ctx}/resources/js/bootstrap/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/fontAwesome4.7.0/font-awesome.css">
<link href="${ctx}/resources/css/flat-ui/flat-ui.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.bootcss.com/headroom/0.9.4/headroom.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/headroom/0.9.4/jQuery.headroom.js"></script>

<script type="text/javascript" src="${ctx }/resources/js/flat-ui/flat-ui.js"></script>
<script type="text/javascript" src="${ctx }/resources/js/flat-ui/application.js"></script>

<script src="${ctx}/resources/js/videojs/video-4.7.3.js"></script>

<!-- 引入 adminLTE 相关 js 文件 和 css 文件 -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/adminlte/AdminLTE.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/adminlte/_all-skins.css">
<script type="text/javascript" src="${ctx}/resources/js/adminlte/adminlte.js"></script>
<%-- <script type="text/javascript" src="${ctx}/resources/js/adminlte/righter.js"></script> --%>

<!-- 引入 layer 相关 js 文件 和 css 文件 -->
<!-- <link rel="stylesheet" type="text/css" href=""> -->
<script type="text/javascript" src="https://cdn.bootcss.com/layer/3.1.0/layer.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/layer/layer.js"></script>

<!-- BootStrapValidator -->
<link href="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/language/zh_CN.js"></script>

<!-- 引入 BootStrap-fileinput 文件输入框 -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/fileinput/fileinput.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/fileinput/fileinput-rtl.css">
<!-- 如果需要以下三个功能 则必须在 fileinput 之前引入 -->
<!-- 上传之前调整图像大小 -->
<script type="text/javascript" src="${ctx}/resources/js/fileinput/piexif.js"></script>
<!-- 预览区域对文件进行排序 -->
<script type="text/javascript" src="${ctx}/resources/js/fileinput/sortable.js"></script>
<!-- 预览HTML文件时对其净化 -->
<script type="text/javascript" src="${ctx}/resources/js/fileinput/purify.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/fileinput/fileinput.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/fileinput/zh.js"></script>

<!-- Summernote 富文本编辑器 -->
<link href="https://cdn.bootcss.com/summernote/0.8.10/summernote.css" rel="stylesheet">
<script type="text/javascript" src="https://cdn.bootcss.com/summernote/0.8.10/summernote.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/summernote/0.8.10/lang/summernote-zh-CN.js"></script>

</head>
<body>
	<!-- 必须加入JSP头部信息，写明编码，否则乱码 -->

	<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->

</body>
</html>