<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS库文件管理</title>
<!-- JQuery程序库 -->

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>

<script type="text/javascript" src="${ctx}/resources/js/jquery-3.3.1.js"></script>

<!-- 引入 bootstrap 相关 js 文件 和 css 文件  -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap/bootstrap.css" >
<script src="${ctx}/resources/js/bootstrap/bootstrap.js"></script>

<!-- 引入 adminLTE 相关 js 文件 和 css 文件 -->
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/adminlte/AdminLTE.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/adminlte/_all-skins.css">
<script type="text/javascript" src="${ctx}/resources/js/adminlte/adminlte.js"></script>
<%-- <script type="text/javascript" src="${ctx}/resources/js/adminlte/righter.js"></script> --%>


</head>
<body>
<!-- 必须加入JSP头部信息，写明编码，否则乱码 -->

<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script> -->

</body>
</html>