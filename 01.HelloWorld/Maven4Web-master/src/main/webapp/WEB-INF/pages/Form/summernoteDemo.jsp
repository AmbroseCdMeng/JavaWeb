<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>summernoteDemo</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<%@include file="/resources/common/jslib.jsp"%>


</head>
<body>

	<h3>Demo - 1</h3>
	<form id="form1" action="${ctx }/form/saveDetail" method="POST" role="form">
		<div class="form-group">
			<textarea rows="" cols="" id="summernote" name="detail"></textarea>
		</div>
		<div class="box-footer text-center">
			<button type="submit" class="btn btn-lg btn-success">
				<i class="fa fa-upload"></i>提交
			</button>
		</div>
	</form>
	<hr>
	<h3>Demo - 2</h3>
	<form id="queryForm" action="${ctx }/form/sitemesh?p=summernoteDemo" method="post" role="form">
		<div class="input-group input-group-sm" style="width: 150px">
			<input type="text" name="username" value="${param.realname }" class="form-control pull-right" placeholder="username">
			<div class="input-group-btn">
				<button type="submit" class="btn btn-default">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
	</form>

	<table class="table table-hover">
		<tr>
			<th>头像</th>
			<th>昵称</th>
			<th>备注</th>
		</tr>
		<c:forEach var="item" items="${list }">
			<tr>
				<td><img style="width: 150px" height="150px" class="directr-chat-img" src="${item.headImg }" alt="${item.username }"></td>
				<td>${item.username }</td>
				<td>${item.detail }</td>
			</tr>
		</c:forEach>
	</table>



	<script type="text/javascript">
		$.ajax({
			url : 'https://api.github.com/emojis',
			async : false
		}).then(function(data) {
			// Object.keys() 方法会返回一个由一个给定对象的自身可枚举属性组成的数组，数组中属性名的排列顺序和使用 for...in
			// 循环遍历该对象时返回的顺序一致 。
			window.emojis = Object.keys(data);
			window.emojiUrls = data;
		});

		var $form1 = $('#form1'), $summernoteDetail = $form1.find("[name=detail]");

		$summernoteDetail.summernote({
			lang : 'zh-CN',
			placeholder : '输入“:+英文字母” 可以选择 emoji 表情',
			/* 自动匹配 */
			hint : {
				match : /:([\-+\w]+)$/,
				search : function(keyword, callback) {
					//过滤数组元素，返回过滤后的数组
					callback($.grep(emojis, function(item) {
						return item.indexOf(keyword) === 0;
					}));
				},
				template : function(item) {
					var content = emojiUrls[item];
					return '<img src="'+content+'" width="20" />: ' + item + ':';
				},
				content : function(item) {
					var url = emojiUrls[items];
					if (url) {
						return $('<img />').attr('src', url).css('width', 20)[0];
					}
					return '';
				}
			},

			callbacks : {
				onInit : function() {
					$form1.bootstrapValidator({
						fields : {
							detail : {
								//Summernote 会将 textarea 设置为不可见。所以需要 excluded = false 设置该字段进行验证
								excluded : false,
								validators : {
									callback : {
										message : '内容不允许为空',
										callback : function(input) {
											var flag = $summernoteDetail.summernote('isEmpty');
											return !flag;
										}
									}
								}
							},
						}
					}).on('success.form.bv', function(e) {
						e.preventDefault();
						var $form = $(e.target), bv = $form.data('bootstrapValidator');
						$.ajax({
							type : $form.attr("method") || 'POST',
							url : $form.attr("action"),
							data : $form.serializeArray(),
							cache : false,
							dataType : 'json',
							success : function(json) {
								if (json.statusCode == 200) {
									layer.msg(json.message);
								} else {
									bv.updateMessage(json.field, 'blank', json.message);
									bv.updateStatus(json.field, 'INVALID', 'blank');
								}
							},
						});
					});
				},

				onChange : function() {
					var bv = $form1.data('bootstrapValidator');
					bv.revalidateField('detail');
				}
			}
		});
	</script>
</body>
</html>