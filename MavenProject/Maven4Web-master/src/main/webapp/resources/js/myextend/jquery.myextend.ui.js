/**
 * HTML 扩展的 Jquery 插件  -- 效果
 */

/**
 * 定义 initUI 方法（该方法不同于 myextend.core.js 中的 initUI）
 * @param {*} $p 
 */
function initUI($p) {
    /**
     * lazy load 图片延迟加载
     */
    $("img.lazyload", $p).lazyload();
}

$(function () {
    // 将 initUI 方法放入 myExtend.regPlugins 数组中 以便于 core.js 中的 initUI 方法遍历
    myExtend.regPlugins.push(initUI);
    $(document).initUI();
})



















