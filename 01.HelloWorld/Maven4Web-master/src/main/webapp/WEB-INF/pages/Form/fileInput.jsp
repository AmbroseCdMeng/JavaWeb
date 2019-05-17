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
			
			/*配置 -- 信息*/
			msgPlaceholder:'选择文件...',//没有选择文件时的占位符
			msgZoomModalHeading:'标题',//预览文件对话框的完整标题。适用于文本文件
			msgFileRequired:'请选择...',//没有选择文件时的提示
			msgSizeTooSmall:'{name}(<b>{size} KB</b> 必须大于限定大小 <b>{minSize}KB</b>)',
			msgSizeTooLarge:'',
			msgFilesTooLess:'上传的数量小于指定值',
			msgFilesTooMany:'',
			msgFileNotFound:'',
			msgFileSecured:'由于浏览器安全策略阻止文件被读取',
			msgFileNotReadable:'FileReader API 无法读取所选文件',
			msgFilePreviewAborted:'文件预览被中止',
			msgFilePreviewError:'文件预览出错',
			msgFileInvalidFileName:'所选文件包含非法字符',
			msgFileInvalidFileType:'所选文件类型不符合',
			msgInvalidFileExtension:'所选 文件扩展名不符合',
			msgUploadAborted:'点击取消按钮中止文件上传时的提示',
			msgUploadBegin:'进度条进度为 0% 时的提示。',//默认“正在初始化...”
			msgUploadEnd:'进度条进度为 100% 时的提示',//默认“完成”
			msgUploadEmpty:'内置 Ajax 上传文件，文件不存在无法上传时显示的信息',
			msgUploadError:'内置 Ajax 上传文件，服务器端抛出异常时显示的信息',
			msgSelected:'多个文件选择时，在文件标题栏中显示的进度信息',
			msgImageWidthSmall:'选择的文件图像宽度小于指定值',
			msgImageHeightSmall:'选择的文件图像高度小于指定值',
			msgImageWidthLarge:'选择的文件图像宽度大于指定值',
			msgImageHeightLarge:'选择的文件图像高度大于指定值',
			
			/*配置 -- 验证*/
			required:true,//必须选择文件
			minFileSize:0,//最小文件大小。为null时不验证，默认为0。单位KB
			maxFileSize:0,//最大文件大小。为0时不验证，默认为0。单位KB
			minFileCount:0,//多选情况下最小文件数。为0不验证。默认0
			maxFileCount:0,//
			allowedFileTypes:['image', 'html', 'text', 'video', 'flash'],//允许的文件类型。默认 null 不限制
			allowedFileExtensions:null,//允许的文件扩展名。默认 null 不限制
			minImageWidth:null,//单位 px
			maxImageWidth:null,
			minImageHeight:null,
			minImageWidth:null,
			
			/*配置 -- 需求*/
			hideThumbnailContent:false,//隐藏预览区域中的缩略图（图像、PDF）
			showCaption:true,//显示文件标题
			showPreview:true,//显示文件预览
			showRemove:true,//显示移除按钮
			showUpload:true,//显示上传按钮
			showCancel:true,//显示取消按钮
			showClose:true,//显示关闭按钮
			showBrowse:true,//显示选择按钮
			browseOnZoneClick:false,//点击预览区域时，启用文件浏览或选择功能
			autoReplace:false,//选择文件数目达到最大时，自动替换预览中的文件。设置了 maxFileCount 时有效。
			rtl:false,//开启 Right-To-Left。原来左右的部件位置调换
			dropZoneEnabled:true,//启用并显示文件拖拽区域
			reversePreviewOrder:false,//是否反转预览中显示的文件顺序
			purifyHtml:true,//预览中净化HTML文本内容
			
			/*配置 -- 预览*/
			initialPreview:[],//初始预览内容。字符串或字符串数组
			initialPreviewAsData:false,//初始预览内容解析为数据而不是原始标记
			initialPreviewFileType:"image",//预览区域中的模板类型
			initialPreviewConfig:[],//数组类型。初始化的一些属性。
			deleteUrl:'',//删除的Ajax请求
			deleteExtraData:{},//删除的Ajax请求的参数
			initialCaption:'',//初始化预览标题
			overwriteInitial:true,//选择新文件是否覆盖之前的预览项目
			validateInitialCount:true,//将初始化预览文件数量计入总量验证
			
			/*配置 -- 外观*/
			browseLabel:'选择...',//文件选择器按钮的标签
			browseIcon:'<i class="glyphicon glyphicon-folder-open"></i>',//文件选择器按钮的图标。默认文件夹图标
			browseClass:'btn btn=primary',//文件选择器按钮Css类
			removeLabel:'',
			removeIcon:'',
			removeClass:'',
			removeTitle:'移除选中文件',//悬停在移除按钮上显示的文字
			uploadLabel:'',
			uploadIcon:'',
			uploadClass:'',
			uploadTitle:'',
			previewZoomButtonIcons:{
				prev:'<i class="fa fa-backward"></i>', 
				next:'<i class="fa fa-forward"></i>',
				toggleheader:'<i class="fa fa-arrows-v"></i>',
				fullscreen:'<i class="fa fa-fa-arrows-alt"></i>',
				borderless:'<i class="fa fa-expand"></i>',
				closes:'<i class="fa fa-times"></i>',
			},
			previewZoomButtonClasses:{
				
			},
			previewZoomButtonTitles:{
				
			},
			dropZoneTitle:'',//拖拽区域的标题
			dropZoneTitleClass:'file-drop-zone-title',
			dropZoneClickTitle:'<br>',
			progressClass:'',//进度条
			progressErrorClass:'',
			
			/*配置 -- 内置Ajax*/
			uploadUrl:$(this).data('url'),//Ajax请求地址。input 中定义了 name 属性，则到达服务器的参数名就为 name 的值。否则，参数名默认 file-data
			uploadExtraData:{},//Ajax请求附加参数
			showAjaxErrorDetails:true,//上传服务器抛出异常时，是否显示详情堆栈信息。
			uploadAsync:true,//异步上传多个文件
			
			/*配置 -- 图像*/
			resizeImage:false,//调整图像大小
			resizeImageQuality:0.92,//缩放图像的质量。0.00~1.00 之间
			resizeDefaultImageType:'image/jpeg',//图像缩放后的 MIME 类型
			resizeIfSizeMoreThan:'0',//超过此数的图像才会调整。单位 KB
			resizePreferece:'width',//根据宽度还是高度调整的默认首选项。
			
			/*配置 -- 其他*/
			defaultPreviewContent:'预览内容的占位符',
			maxFilePreviewSize:25600, //可预览的文件大小。默认25M，超过25M不能预览
			previewFileType:'image',//可预览的文件类型
			elErrorContainer:'',//显示错误信息的容器
			zoomModalHeight:480,//预览窗口的默认高度。默认480，单位 px
// 			slugCallback:function(){
				
// 			},//将文件名转为安全字符的回调函数
			textEncoding:'UTF-8', //读取文件时的编码
		})
	</script>
</body>
</html>