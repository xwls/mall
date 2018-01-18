function edit(pid) {
    //打开iframe弹出层
    layer.open({
        type: 2,//类型
        area: ['700px', '450px'],//弹出窗口的大小
        title: '百度',//窗口的标题
        maxmin: true,//最大化和最小化按钮
        shadeClose: false,//点击窗口外侧使用关闭窗口，值为true时，会关闭
        content: 'https://www.baidu.com'//窗口加载的地址
    });
}