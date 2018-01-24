function edit(pid) {
    console.log(pid)
    //打开iframe弹出层
    var index = layer.open({
        type: 2,//类型
        area: ['700px', '600px'],//弹出窗口的大小
        title: '商品添加或修改',//窗口的标题
        fix: false,
        maxmin: true,//最大化和最小化按钮
        shadeClose: false,//点击窗口外侧使用关闭窗口，值为true时，会关闭
        // content: 'https://www.baidu.com'//窗口加载的地址
        content: 'form?pid='+pid//窗口加载的地址
    });
    // layer.full(index);
}
function add() {
    var index = layer.open({
        type: 2,//类型
        area: ['700px', '600px'],//弹出窗口的大小
        title: '商品添加或修改',//窗口的标题
        fix: false,
        maxmin: true,//最大化和最小化按钮
        shadeClose: false,//点击窗口外侧使用关闭窗口，值为true时，会关闭
        // content: 'https://www.baidu.com'//窗口加载的地址
        content: 'form'//窗口加载的地址
    });
}
$(function () {

});
