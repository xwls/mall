function edit(cid, name, status) {
    $("input[name='cid']").val(cid);
    $("input[name='name']").val(name);
    // $("select[name='status']").find("option[value="+status+"]").attr("selected",true);
    $("select[name='status']").val(status);
    return false;
}
function add() {
    $("#category-form")[0].reset();
}