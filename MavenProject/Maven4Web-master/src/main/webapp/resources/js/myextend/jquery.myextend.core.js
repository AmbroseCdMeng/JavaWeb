/**
 * HTML 扩展的 Jquery 插件 -- 功能
 */

/***************************************************/
/**
 *  扩展关键代码 -- 立即调用函数
 */
/*
(function($){
	
})(jQuery);
*/
/***************************************************/


//定义局部变量 内部包含一个空数组
var myExtend = {
		regPlugins :[]
};

//为所有的 jQuery 对象增加一个 initUI 的方法， 用来初始化页面组件
(function($) {
	$.fn.extend({
		initUI:function(){
			return this.each(function() {
				var $this = $(this);
				$.each(myExtend.regPlugins, function(index, fn){
					fn($this);
				});
			});
		},
	});
})(jQuery);

/**
 * jQuery 的 initUI 调用示例
 */
//$(document).initUI();


/**
 * 为 String 扩展一个 trim 方法
 * 
 * /(^\s*)|(\s*$)|\r|\n/g
 * ^ 	开头
 * \s 	空白
 * *	0 个或多个
 * |	或者
 * $	结尾
 * g	全局
 */
$.extend(String.prototype, {
	trim : function() {
		return this.replace(/(^\s*)|(\s*$)|\r|\n/g, "");
	},
});

/**
 * String 的 trim 调用示例
 */
//console.log($("#id").text().trim());



















