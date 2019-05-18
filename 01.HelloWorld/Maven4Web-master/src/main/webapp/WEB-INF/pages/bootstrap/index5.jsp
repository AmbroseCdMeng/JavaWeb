<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BootStrap 导航条</title>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/fontAwesome4.7.0/font-awesome.css">
<link href="${ctx}/resources/css/flat-ui/flat-ui.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/animate/animate.css">


<%@include file="/resources/common/jslib.jsp"%>
<script type="text/javascript" src="${ctx }/resources/js/bootstrap/bootstrap.js"></script>

<script type="text/javascript" src="https://cdn.bootcss.com/headroom/0.9.4/headroom.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/headroom/0.9.4/jQuery.headroom.js"></script>

<style type="text/css">
/*@keyfromes slideDown {  */
@
-webkit-keyframes slideDown { /* Safari and Chrome*/ from { -webkit-transform:translateY(-4em)
	
}

to {
	-webkit-transform: translateY(0)
}

}
.animated.slideDown {
	-webkit-animation-name: slideDown;
}

/*@keyframes slideUp {*/
@
-webkit-keyframes slideUp { /* Safari and Chrome*/ from { -webkit-transform:translateY(0);
	
}

to {
	-webkit-transform: translateY(-4em);
}

}
.animated.slideUp {
	-webkit-animation-name: slideUp;
}

@
-webkit-keyframes swingInX { 0% {
	-webkit-transform: perspective(400px) rotateX(-90deg)
}

100%
{
-webkit-transform


:perspective(400px)

 

rotateX


(0
deg
)


    

}
}
.animated.swingInX {
	-webkit-transform-origin: top;
	-webkit-backface-visibility: visible !important;
	-webkit-animation-name: swingInX;
}

@
-webkit-keyframes swingOutX { 0% {
	-webkit-transform: perspective(400px) rotateX(0deg)
}

100%
{
-webkit-transform


:

 

perspective


(400
px
)

 

rotateX


(-90
deg
)


    

}
}
.animated.swingOutX {
	-webkit-transform-origin: top;
	-webkit-animation-name: swingOutX;
	-webkit-backface-visibility: visible !important;
}

@
-webkit-keyframes flipInX { 0% {
	-webkit-transform: perspective(400px) rotateX(90deg);
	opacity: 0
}

100%
{
-webkit-transform


:

 

perspective


(400
px
)

 

rotateX


(0
deg
);


        

opacity


:

 

1
}
}
.animated.flipInX {
	-webkit-backface-visibility: visible !important;
	-webkit-animation-name: flipInX;
}

@
-webkit-keyframes flipOutX { 0% {
	-webkit-transform: perspective(400px) rotateX(0deg);
	opacity: 1
}

100%
{
-webkit-transform


:

 

perspective


(400
px
)

 

rotateX


(90
deg
);


        

opacity


:

 

0
}
}
.animated.flipOutX {
	-webkit-animation-name: flipOutX;
	-webkit-backface-visibility: visible !important;
}

@
-webkit-keyframes bounceInDown { 0% {
	opacity: 0;
	-webkit-transform: translateY(-200px)
}

60%
{
opacity


:

 

1;
-webkit-transform


:

 

translateY


(30
px
)


    

}
80%
{
-webkit-transform


:

 

translateY


(-10
px
)


    

}
100%
{
-webkit-transform


:

 

translateY


(0)
}
}
.animated.bounceInDown {
	-webkit-animation-name: bounceInDown;
}

@
-webkit-keyframes bounceOutUp { 0% {
	-webkit-transform: translateY(0)
}

30%
{
opacity


:

 

1;
-webkit-transform


:

 

translateY


(20
px
)


    

}
100%
{
opacity


:

 

0;
-webkit-transform


:

 

translateY


(-200
px
)


    

}
}
.animated.bounceOutUp {
	-webkit-animation-name: bounceOutUp;
}
</style>

</head>
<body>

	<!-- 其他导航条效果 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<ul class="nav navbar-nav">
				<li><a href="javascript:;" data-headroom-classes='{"initial":"animated", "pinned":"slideDown", "unpinned":"slideUp"}'>滑动</a></li>


				<li><a href="javascript:;" data-headroom-classes='{"initial":"animated", "pinned":"swingInX", "unpinned":"swingOutX"}'>摇摆</a></li>

				<li><a href="javascript:;" data-headroom-classes='{"initial":"animated", "pinned":"flipInX", "unpinned":"flipOutX"}'>翻动</a></li>


				<li><a href="javascript:;"
					data-headroom-classes='{"initial":"animated", "pinned":"bounceInDown", "unpinned":"bounceOutUp"}'>弹跳</a></li>

			</ul>
		</div>
	</nav>


	<script type="text/javascript">
		var navbar_fixed_top = $("nav.navbar-fixed-top");
		var defaults = {
			"tolerance" : 5,
			"offset" : 505,
			"classes" : {
				"initial" : "animated",
				"pinned" : "slideDown",
				"unpinned" : "slideUp"
			}
		};

		navbar_fixed_top.find("ul.navbar-nav li a").click(function(event) {
			var $this = $(this), classes = $this.data("headroom-classes");
			options = $.extend(defaults, {
				"classes" : classes
			});
			navbar_fixed_top.headroom("destroy").headroom(options);
			event.preventDefault();
		})
	</script>
</body>
</html>