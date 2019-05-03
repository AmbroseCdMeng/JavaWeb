<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 扩展 -- LazyLoad 实现</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!-- css 引用 -->
<%-- <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/"> --%>

<!-- 公共页面引用 -->
<%@ include file="/resources/common/jslib.jsp"%>

<!-- js 引用 -->
<script type="text/javascript"
	src="${ctx}/resources/js/myextend/jquery.myextend.core.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/myextend/jquery.myextend.ui.js"></script>
<!-- 图像延迟加载 -->
<script
	src="https://cdn.bootcss.com/jquery_lazyload/1.9.7/jquery.lazyload.js"></script>
</head>
<body>
	<div class="bs-example">
		<c:forEach begin="1" end="100">
			<div class="row">
				<img class="lazyload"
					data-original="https://avatars1.githubusercontent.com/u/6011374?s=460&v=4&< %=Math.random() %>"
					style="width: 140px; height: 140px">
			</div>
		</c:forEach>
	</div>

	<script type="text/javascript">
		<!-- 图片延迟加载 lazyload 的配置信息  -->
		var settings = {
			threshold : 200,//阈值。出发目标图像加载所需要的最低值。默认 0px。 例：具体页面底部还有 200px 时开始加载
			event : "mouseover",//触发方式。默认 "click""。
			effect : "fadeIn",//显示效果。默认等待图像加载完全后，淡入。可选："slideDown （滑动） 等"
			placeholder : 'http://via.placeholder.com/350x230?text=cmower'//占位符。默认灰白色内联图片。可设置自定义内联图片
		// 快速生成内联图片的网站	http://placehold.it
		}
	</script>
</body>
</html>