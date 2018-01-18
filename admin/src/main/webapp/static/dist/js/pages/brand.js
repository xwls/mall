function edit(bid, name, status) {
    $("input[name='bid']").val(bid);
    $("input[name='name']").val(name);
    // $("select[name='status']").find("option[value="+status+"]").attr("selected",true);
    $("select[name='status']").val(status);
    return false;
}
function add() {
    $("input[name='bid']").val("");
    $("#brand-form")[0].reset();
}
function saveOrUpdate() {
    var nameInput = $("input[name='name']");
    var statusSelect = $("select[name='status']");
    nameInput.focus(function () {
        nameInput.parent("div").removeClass("has-error");
    });
    if(!nameInput.val()){
        nameInput.parent("div").addClass("has-error");
    }
    statusSelect.focus(function () {
        statusSelect.parent("div").removeClass("has-error");
    });
    if(!statusSelect.val()){
        statusSelect.parent("div").addClass("has-error");
    }
    var form = $("#brand-form");
    if(!form[0].checkValidity()){
        return;
    }
    var cid = $("input[name='bid']").val();
    if(cid){
        layer.confirm("编辑\""+nameInput.val()+"\"?",submitForm);
    }else{
        layer.confirm("添加\""+nameInput.val()+"\"?",submitForm);
    }
}
function submitForm() {
    var formData = $("#brand-form").serialize();
    $.ajax({
        url:path+"/brand/saveOrUpdate",
        method:"post",
        data:formData,
        success:function (res) {
            console.log(res);
            if(res.success){
                location.replace(path+"/brand/list")
            }else{
                layer.alert(res.reason,{icon:2})
            }
        }
    });
}