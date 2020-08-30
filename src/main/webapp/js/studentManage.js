/**
 * 加载数据库中学生的系别并加载到响应的下拉列表中
 */
$(function () {
    $.ajax(
        {
            url: "department/getAllDep",
            type: 'get',
            dataType: 'json',
            success: function (data) {
                //拼接下拉框
                for (var i = 0; i < data.length; i++) {
                    $("#sDep").append("<option value='" + data[i].dId + "'>" + data[i].dName + "</option>");
                    $("#update_sDep").append("<option value='" + data[i].dId + "'>" + data[i].dName + "</option>");
                }
                $("#sDep").selectpicker("refresh");
                $("#update_sDep").selectpicker("refresh");
            }
        }
    );
});

/**
 * 根据当前选中的学院获取该学院下的系别并加载到班级下拉列表中
 * @param operation 所要执行的操作（添加或修改）
 */
function getMajor(operation) {
    var options1 = document.getElementById("sMajor");
    var options2 = document.getElementById("sClass");
    var options3 = document.getElementById("update_sMajor");
    var options4 = document.getElementById("update_sClass");
    var dId = 1;
    if (operation == "add") {
        if (options1 != null) {
            options1.length = 1;
        }
        if (options2 != null) {
            options2.length = 1;
        }
        dId = $("#sDep").val();
    }
    if (operation == "update") {
        if (options3 != null) {
            options3.length = 1;
        }
        if (options4 != null) {
            options4.length = 1;
        }
        dId = $("#update_sDep").val();
    }

    $.ajax(
        {
            url: "major/findMajorByDep",
            type: 'post',
            data: {"dId": dId},
            dataType: "json",
            success: function (data) {
                if (operation == "add") {
                    for (var i = 0; i < data.length; i++) {
                        $("#sMajor").append("<option value='" + data[i].mId + "'>" + data[i].mName + "</option>");
                    }
                    $("#sMajor").selectpicker("refresh");
                    $("#sClass").selectpicker("refresh");
                }
                if (operation == "update") {
                    for (var i = 0; i < data.length; i++) {
                        $("#update_sMajor").append("<option value='" + data[i].mId + "'>" + data[i].mName + "</option>");
                    }
                    $("#update_sMajor").selectpicker("refresh");
                    $("#update_sClass").selectpicker("refresh");
                }
            }
        }
    );
}

/**
 * 根据当前选中的系别获取该系别下的班级并加载到班级下拉列表中
 * @param operation 所要执行的操作（添加或修改）
 */
function getClass(operation) {
    var options = document.getElementById("sClass");
    var options1 = document.getElementById("update_sClass");
    var mId = 1;
    if (operation == "add") {
        if (options != null) {
            options.length = 1;
        }
        mId = $("#sMajor").val();
    }
    if (operation == "update") {
        if (options1 != null) {
            options1.length = 1;
        }
        mId = $("#update_sMajor").val();
    }

    $.ajax(
        {
            url: "classes/getClassesByMajor.do",
            type: 'post',
            data: {"mId": mId},
            dataType: "json",
            success: function (data) {
                if (operation == "add") {
                    for (var i = 0; i < data.length; i++) {
                        $("#sClass").append("<option value='" + data[i].clId + "'>" + data[i].clName + "</option>");
                    }
                    $("#sClass").selectpicker("refresh");
                }
                if (operation == "update") {
                    for (var i = 0; i < data.length; i++) {
                        $("#update_sClass").append("<option value='" + data[i].clId + "'>" + data[i].clName + "</option>");
                    }
                    $("#update_sClass").selectpicker("refresh");
                }
            }
        }
    );
}

/**
 * 初始化修改信息modal，将需要修改的学生信息初始化在修改界面上
 * @index 要修改的学生所在表格位置的索引
 */
function updateInit(index) {
    var rowData = $("#mytab").bootstrapTable('getData')[index];
    $("#update_sId").val(rowData.sId);
    $("#update_sName").val(rowData.sName);
    $("#update_sBirthday").val(rowData.sBirthday);
    if (rowData.sGender == "男") {
        $("#update_sGenderF").attr("checked", true);
    }
    if (rowData.sGender == "女") {
        $("#update_sGenderM").attr("checked", true);
    }
    //根据学生信息获取院系
    var dep = $("#update_sDep");
    dep.val(rowData.department.dId);
    dep.selectpicker("refresh");
    //根据院系获取专业,并设置为该学生的专业
    var major = document.getElementById("update_sMajor");
    major.length = 1;
    var classes = document.getElementById("update_sClass");
    classes.length = 1;
    $.ajax(
        {
            url: "major/findMajorByDep",
            type: 'post',
            data: {"dId": rowData.department.dId},
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#update_sMajor").append("<option value='" + data[i].mId + "'>" + data[i].mName + "</option>");
                }
                $("#update_sMajor").val(rowData.major.mId);
                $("#update_sMajor").selectpicker("refresh");
                //根据专业获取班级，并设置为该学生的班级
                $.ajax(
                    {
                        url: "classes/getClassesByMajor.do",
                        type: 'post',
                        data: {"mId": rowData.major.mId},
                        dataType: "json",
                        success: function (data) {
                            for (var i = 0; i < data.length; i++) {
                                $("#update_sClass").append("<option value='" + data[i].clId + "'>" + data[i].clName + "</option>");
                            }
                            $("#update_sClass").val(rowData.classes.clId);
                            $("#update_sClass").selectpicker("refresh");
                        }
                    }
                );

            }
        }
    );
    $("#myModal_edit").modal("show");
}

function updateStu() {
    var myform = $("#form_edit_user");
    toastr.warning("正在处理！！！");
    setTimeout(function () {
        $.ajax({
            url: "student/updateStudent",
            type: "post",
            data: myform.serialize(),
            dataType: "json",
            beforeSend:function(){
                toastr.clear();
            },
            success: function (result) {
                if (result.status === 1) {
                    $("#myModal_edit").modal('hide')
                    toastr.success(result.message)
                } else {
                    $("#myModal_edit").modal('hide')
                    toastr.error(result.message)
                }
            },
            error: function (result) {
                if (result != null) {
                    toastr.error(result.message)
                } else {
                    toastr.error("操作失败")
                }
            },
            complete: function () {
                $("#myModal_edit").modal('hide')
                //刷新数据
                $("#mytab").bootstrapTable("refresh")
                clearForm(myform);
            }
        })
    },1000);

}

/**
 * 获取一个要删除的学生的id并放入集合中传给dialog_del方法
 * @index 要删除的学生所在表格位置的索引
 */
function del_one(index) {
    var delId = $("#mytab").bootstrapTable('getData')[index].sId;
    var ids = new Array();
    ids.push(delId);
    console.log(delId);
    var del_url="student/delStudent?ids=";
    dialog_del(ids,del_url);
}

/**
 * 获取表格中选中的要删除的学生的id并放入集合中传给dialog_del方法
 * @index 要删除的学生所在表格位置的索引
 */
function del_more() {
    var delRows = $("#mytab").bootstrapTable('getSelections');
    if (delRows.length == 0) {
        toastr.warning("没有选中数据!");
    } else {
        var ids = new Array();
        delRows.forEach(function (delRow) {
            ids.push(delRow.sId);
            console.log(delRow.sId);
        });
        var del_url="student/delStudent?ids=";
        dialog_del(ids,del_url);
    }
}

