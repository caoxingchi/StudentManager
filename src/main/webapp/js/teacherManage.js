var types = [BootstrapDialog.TYPE_DEFAULT,
    BootstrapDialog.TYPE_INFO,
    BootstrapDialog.TYPE_PRIMARY,
    BootstrapDialog.TYPE_SUCCESS,
    BootstrapDialog.TYPE_WARNING,
    BootstrapDialog.TYPE_DANGER];

var dialogSizes=[
    BootstrapDialog.SIZE_NORMAL,
    BootstrapDialog.SIZE_SMALL,
    BootstrapDialog.SIZE_WIDE,
    BootstrapDialog.SIZE_LARGE
];

var url;
/*
    *添加教师操作
    * 并且修改标题 为添加教师
     * */
function addTeacher() {
    //当展示modal的时候修改title
    $('#teacher_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title=document.getElementById("myModalLabel_add");
        title.innerText="添加教师";
    });
    // $("#teacher_modal").title="添加教师";
    $("#teacher_modal").modal("show");
    url="addTeacher";
}

/*
    * 修改操作
    * bug 不可修改工号 -->后端已解决
    * */
function modal_edit(index) {
    //当展示modal的时候修改title
    $('#teacher_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title=document.getElementById("myModalLabel_add");
        title.innerText="修改教师";
    });
    var myrow=$("#mytab").bootstrapTable('getData')[index];
    //toastr.warning("准备修改 "+myrow.tName,"修改操作")
    loadTableDatasToTeacherModal(myrow);
    url="updateTeacher";
}

/**
 * 表单验证提交操作
 */
/*function saveTeacherValidate(){
    //表单验证
        $('#form_teacher').bootstrapValidator({
            message: 'This value is not valid',
            excluded: ':disabled',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            submitHandler: function(validator, form, submitButton) {
                // 实用ajax提交表单
                /!*$.post(form.attr('action'), form.serialize(), function(result) {
                    // .自定义回调逻辑
                }, 'json');*!/

                saveTeacher(form);
            },
            fields: {
                tName: {
                    validators: {
                        notEmpty: {
                            message: 'The tName is required and cannot be empty'
                        },
                        /!* stringCase: {
                             message: 'The first name must contain upper case characters only',
                             case: 'upper'
                         },*!/
                        regexp: {
                            regexp: /^[A-Z\s]+$/i,
                            message: 'The first name can only consist of alphabetical characters and spaces'
                        }
                    }
                },
                tId: {
                    validators: {
                        notEmpty: {
                            message: 'The tId is required and cannot be empty'
                        },
                        /!*stringCase: {
                            message: 'The last name must contain upper case characters only',
                            case: 'upper'
                        },*!/
                        regexp: {
                            regexp: /^[A-Z\s]+$/i,
                            message: 'The last name can only consist of alphabetical characters and spaces'
                        }
                    }
                },
                tDep: {
                    validators: {
                        notEmpty: {
                            message: 'The tId is required and cannot be empty'
                        }
                    }
                },
                /!*tDep: {
                    message: 'The tDep is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The username is required and cannot be empty'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: 'The username must be more than 6 and less than 30 characters long'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: 'The username can only consist of alphabetical, number, dot and underscore'
                        },
                        different: {
                            field: 'password',
                            message: 'The username and password cannot be the same as each other'
                        }
                    }
                },*!/
                /!*email: {
                    validators: {
                        emailAddress: {
                            message: 'The input is not a valid email address'
                        }
                    }
                },*!/
                /!*password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and cannot be empty'
                        },
                        different: {
                            field: 'username',
                            message: 'The password cannot be the same as username'
                        }
                    }
                },*!/
                tGender: {
                    validators: {
                        notEmpty: {
                            message: 'The gender is required'
                        }
                    }
                },
                tTel: {
                    validators: {
                        digits: {
                            message: 'The value can contain only digits'
                        }
                    }
                },
                tBirthday: {
                    validators: {
                        date: {
                            format: 'YYYY/MM/DD',
                            message: 'The birthday is not valid'
                        }
                    }
                }

            }
        });
}*/
/*
      表单提交，添加教师信息
      * */
function saveTeacher() {
    console.log("开始准备保存数据")
    var teacherForm=$("#form_teacher");
    /*$("#add_tip" ).html("<span style='color:blue'>正在处理...</span>");*/
    toastr.warning("正在处理！！！")
    setTimeout(function () {
        $.ajax({
            url: url,
            type: "post",
            data: teacherForm.serialize(),
            dataType: "json",
            beforeSend: function () {
                /* $("#add_tip" ).html("<span style='color:blue'>正在处理...</span>");*/
                /*toastr.info("正在处理！！！")*/
                toastr.clear();
                //数据校验
                var teacherValidate=teacherForm.data("bootstrapValidator");
                teacherValidate.validate();
                if(teacherValidate.isValid()){
                    return true;
                }else{
                    toastr.error("表单验证失败！");
                    return false;
                }
            },
            success: function (result) {
                if (result.status === 1) {
                    $("#teacher_modal").modal('hide')
                    toastr.success(result.message)
                } else {
                    $("#teacher_modal").modal('hide')
                    toastr.error(result.message)
                }
            },
            error: function (result) {
                if(result!=null){
                    toastr.error(result.message)
                }else{
                    toastr.error("操作失败")
                }
            },
            complete: function () {
                $("#teacher_modal").modal('hide')
                //刷新数据
                $("#mytab").bootstrapTable("refresh")
                clearForm(teacherForm)
            }

        })
    },1000);
}


/**
 * 将数据加载到modal中并显示出modal
 * 注意事项：selectpicker一定要记得刷新，不然数据将仍然是之前的值
 * */
function loadTableDatasToTeacherModal(myrow) {
    $("#tName").val(myrow.tName)
    $("#tId").val(myrow.tId)
    var depart=$("#tDep").val(myrow.tDep)
    var gender=$("#tGender").val(myrow.tGender)
    $("#tTel").val(myrow.tTel)
    $("#tBirthday").val(myrow.tBirthday);
    //一定要记得刷新，不然数据将不会改变
    depart.selectpicker("refresh");
    gender.selectpicker("refresh")
    //$("#tId").attr("readOnly","readOnly");
    $("#teacher_modal").modal("show")
}

/*当前行的数据删除操作
   *通过传入的index，进而获取当前行的数据
   */
function modal_del(index) {
    //获取当前行的数据，不通过checkbox
    var delrow=$("#mytab").bootstrapTable('getData')[index];
    let tIds =new Array();
    var delId=delrow.tId;
    tIds.push(delId);
    if(delrow.length!==0){
        //toastr.info("获取当前行的数据"+delrow,"title")
        console.log("tId="+delrow);
        var del_url="delTeachers?tIds=";
        dialog_del(tIds,del_url);
    }
    console.log(delrow.tId)
}

/**
 * 删除多行的操作
 */
function delMore() {
    //获取所有被选中的行 通过checkbox
    var rows = $("#mytab").bootstrapTable('getSelections');
    if (rows.length === 0) {
        toastr.warning("没有选中数据！")
    } else {
        var tIds=new Array();
        rows.forEach(rows=>{
            tIds.push(rows.tId)
        });
        var del_url="delTeachers?tIds=";
        dialog_del(tIds,del_url );
        console.log(rows)
        console.log(tIds)
    }
}



/**
 * 导出数据
 */
function exportFile(row) {
    row=$("#mytab").bootstrapTable('getSelections');
    console.log(row)
    if(row.length===0){
        toastr.warning("请选择要导出的数据！")
        return;
    }else{
        $('#mytab').tableExport({
            type: 'excel',
            exportDataType: "all",
            ignoreColumn: [0],//忽略某一列的索引
            fileName: 'teacherInfo',//下载文件名称
            onCellHtmlData: function (cell, row, col, data){//处理导出内容,自定义某一行、某一列、某个单元格的内容
                //  console.info(data);
                return data;
            },
        });
    }

}







