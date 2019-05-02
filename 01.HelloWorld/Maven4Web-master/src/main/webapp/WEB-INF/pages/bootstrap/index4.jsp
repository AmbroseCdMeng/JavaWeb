<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap 字体库和导航条</title>

<!-- 为 headroom 提供自定义的 css 样式 -->
<style type="text/css">
.headroom {
	/* 增强页面渲染性能 */
	will-change: transform;
	/* 以 transform 的形式来进行过渡，持续时间为 200ms ，运行形式为 linear */
	transition: transform 200ms linear;
}

.headroom--pinned {
	/* 	基于原来的位置，沿 y 轴平移 */
	transform: translateY(0%);
}

.headroom--unpinned {
	/* 	-100% 总能保证元素完全从视窗中移除 */
	transform: translateY(-100%);
}
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/fontAwesome4.7.0/font-awesome.css">
<link href="${ctx}/resources/css/flat-ui/flat-ui.css" rel="stylesheet">

<%@include file="/resources/common/jslib.jsp"%>
<script type="text/javascript"
	src="${ctx }/resources/js/bootstrap/bootstrap.js"></script>

<script type="text/javascript"
	src="https://cdn.bootcss.com/headroom/0.9.4/headroom.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/headroom/0.9.4/jQuery.headroom.js"></script>

<script type="text/javascript"
	src="${ctx }/resources/js/flat-ui/flat-ui.js"></script>
<script type="text/javascript"
	src="${ctx }/resources/js/flat-ui/application.js"></script>

<script src="${ctx}/resources/js/videojs/video-4.7.3.js"></script>


</head>
<body>
	<h1>BootStrap 的图标字体库</h1>
	<span class="glyphicon glyphicon-search">search</span>
	<span class="glyphicon glyphicon-asterisk">asterisk</span>
	<span class="glyphicon glyphicon-plus">plus</span>
	<span class="glyphicon glyphicon-euro">euro</span>
	<span class="glyphicon glyphicon-eur">eur</span>
	<span class="glyphicon glyphicon-minus">minus</span>

	<span class="glyphicon glyphicon-cloud">cloud</span>
	<span class="glyphicon glyphicon-envelope">envelope</span>
	<span class="glyphicon glyphicon-pencil">pencil</span>
	<span class="glyphicon glyphicon-glass">glass</span>
	<span class="glyphicon glyphicon-music">music</span>

	<span class="glyphicon glyphicon-heart">heart</span>
	<span class="glyphicon glyphicon-star">star</span>
	<span class="glyphicon glyphicon-empty">empty</span>
	<span class="glyphicon glyphicon-user">user</span>
	<span class="glyphicon glyphicon-film">film</span>
	<hr>
	<!-- 放大 -->
	<i class="fa fa-bath"></i>
	<i class="fa fa-bath fa-lg">放大 33%</i>
	<i class="fa fa-bath fa-2x">放大 2倍</i>
	<i class="fa fa-bath fa-3x">放大 3 倍</i>
	<i class="fa fa-bath fa-4x">放大 4 倍</i>
	<i class="fa fa-bath fa-5x">放大 5 倍</i>

	<hr>
	<!-- 定宽 -->
	<div class="list-group">
		<a class="list-group-item" href="#"> <i class="fa fa-home fa-fw"></i>
			&nbsp; 主页
		</a> <a class="list-group-item" href="#"> <i class="fa fa-book fa-fw"></i>
			&nbsp;帮助
		</a> <a class="list-group-item" href="#"> <i class="fa fa-cog fa-fw"></i>
			&nbsp;设置
		</a>
	</div>

	<hr>

	<!-- 列表 -->
	<div>
		<ul class="fa-ul">
			<li><i class="fa-li fa fa-check-square"></i>黄金</li>
			<li><i class="fa-li fa fa-check-square"></i>白银</li>
			<li><i class="fa-li fa fa-square"></i>青铜</li>
		</ul>
	</div>

	<hr>

	<!-- 动画 -->
	<div>
		<i class="fa fa-spinner fa-2x fa-spin"></i> <i
			class="fa fa-circle-o-notch fa-2x fa-spin"></i> <i
			class="fa fa-refresh fa-2x fa-spin"></i> <i
			class="fa fa-cog fa-2x fa-spin"></i> <i
			class="fa fa-spinner fa-2x fa-pulse"></i>
	</div>
	<!-- 旋转与反转 -->
	<div>
		<i class="fa fa-shield"></i>正常 <br> <i
			class="fa fa-shield fa-rotate-90"></i>旋转90度 <br> <i
			class="fa fa-shield fa-rotate-180"></i>旋转180度 <br> <i
			class="fa fa-shield fa-rotate-270"></i>旋转270度 <br> <i
			class="fa fa-shield fa-flip-horizontal"></i>水平翻转 <br> <i
			class="fa fa-shield fa-flip-vertical"></i>垂直翻转 <br>
	</div>

	<hr>

	<!-- BootStrap 融合 -->
	<div class="btn-group">
		<a class="btn btn-default" href="#"><i class="fa fa-align-left"></i></a>
		<a class="btn btn-default" href="#"><i class="fa fa-align-center"></i></a>
		<a class="btn btn-default" href="#"><i class="fa fa-align-right"></i></a>
		<a class="btn btn-default" href="#"><i class="fa fa-align-justify"></i></a>
	</div>
	<div class="input-group">
		<span class="input-group-addon"> <i
			class="fa fa-envelope-o fa-fw"></i>
		</span> <input class="form-control" type="text" placeholder="邮箱">
	</div>

	<hr>
	<hr>
	<h1>BootStrap 的导航条</h1>

	<!-- 基础导航条	 -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">主页</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">页面一</a></li>
			<li><a href="#">页面二</a></li>
		</ul>
	</nav>

	<!-- 带有表单的导航条	 -->

	<nav class="navbar navbar-default">
		<ul class="nav navbar-nav"></ul>
		<form class="navbar-form navbar-left" action="">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="请输入名称">
			</div>
			<button type="submit" class="btn btn-default">搜索</button>
		</form>
	</nav>

	<!-- 响应式导航条	 -->
	<button class="btn btn-primary" type="button" data-toggle="collapse"
		data-target="#collapseExample">触发按钮</button>
	<div id="collapseExample">折叠区域</div>
	<!-- <div class="collapse" id="collapseExample">折叠区域</div> -->

	<hr>

	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading" id="headingOne">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne"> 每日一句 # 1</a>
				</h4>
			</div>
			<div class="panel-collapse collapse in" id="collapseOne">
				<div class="panel-body">
					如果你真的照顾号自己的心，那么你会惊讶的发现，有那么多的姑娘在你的门前排好长队</div>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo">每日一句 #2</a>
				</h4>
			</div>
			<div class="panel-collapse collapse" id="collapseTwo">
				<div class="panel-body">不要强迫你的朋友爱你所爱，除非他们自愿</div>
			</div>
		</div>
	</div>

	<hr>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- 			<button type="button" class="navbar-toggle collapsed" -->
				<button type="button" class="" data-toggle="collapse"
					data-target="#navbar-collapse-1">
					<span class="glyphicon glyphicon-star"></span> <span
						class="glyphicon glyphicon-star"></span> <span
						class="glyphicon glyphicon-star"></span>
				</button>
				<a class="navbar-brand" href="#">王老二</a>
			</div>
			<!-- 			<div class="collapse navbar-collapse" id="navbar-collapse-1"> -->
			<div class="" id="navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">BootStrap</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<hr>

	<!-- 顶部固定导航条 结合 Flat-UI 插件 -->
	<!-- 	<nav class="navbar navbar-default navbar-fixed-top"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<ul class="nav navbar-nav"> -->
	<!-- 				<li class="active"><a href="#">导航条</a></li> -->
	<!-- 				<li><a href="#">Flat-UI</a></li> -->
	<!-- 			</ul> -->
	<!-- 		</div> -->
	<!-- 	</nav> -->


	<div class="demo-icons">
		<div class="demo-content">
			<span class="fui-info-circle"></span> <span class="fui-alert-circle"></span>
			<span class="fui-question-circle"></span> <span
				class="fui-check-circle"></span> <span class="fui-cross-circle"></span>
			<span class="fui-android"></span> <span class="fui-apple"></span>
		</div>
	</div>


	<div class="col-xs-8">
		<video class="video-js" preload="auto"
			poster="${ctx}/resources/images/poster.jpg" data-setup="{}">
			<source
				src="http://iurevych.github.com/Flat-UI-videos/big_buck_bunny.mp4"
				type="video/mp4">
			<source
				src="http://iurevych.github.com/Flat-UI-videos/big_buck_bunny.webm"
				type="video/webm">

		</video>

	</div>

	<!-- 滚动隐藏导航条 结合 Headroom 插件-->

	<header class="headroom"></header>
	<header class="headroom headroom--unpinned"></header>
	<header class="headroom headroom--pinned"></header>
	<nav class="navbar nabvar-default navbar-fixed-top">
		<div class="container">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">BootStrap</a></li>
				<li><a href="#">Flat-UI</a></li>
			</ul>
		</div>
	</nav>

	<script type="text/javascript">
		/*headroom 只是为需要滚动时隐藏或显示的滚动条增加对应的 css 类的变化，具体的样式需要自定义*/
		$("nav.navbar-fixed-top").headroom({
			//状态改变之前的容差
			tolerance : 5,
			//在元素没有固定之前，垂直方向的偏移量
			offset : 505,
			//对于每个状态都可以自定义 css classes
			classes : {
				//当元素初始化后所设置的 class
				initial : "headroom",
				//向下滚动时设置的 class
				pinned : "headroom--pinned",
				//向上滚动时所设置的 class
				unpinned : "headroom--unpinned"
			}
		});
	</script>

	<script>
		videojs.options.flash.swf = "${ctx}/resources/js/bideojs/video-js.swf"
	</script>
</body>
</html>