<%--
  Created by IntelliJ IDEA.
  User: caoxi
  Date: 2020/3/13
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>教师信息操作</title>
</head>

<body>

<%--添加教师操作--%>
<%--------------------------------------------------------------------------------------------------------%>
<%------------------------------------------------------------------------------------------------------------------------------------%>
<!--修改教师信息-->
<div class="modal fade" id="teacher_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_add"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel_add">
                    添加教师
                </h4>
            </div>

            <div class="modal-body">
                <form id="form_teacher" class="form-inline required-validate" role="form" method="post">
                    <div class="form-group" style="padding-right: 1px">
                        <label for="tName" class="sr-only">姓名</label>
                        姓&nbsp;&nbsp;&nbsp;名：&nbsp;
                        <input type="text" class="form-control" id="tName" name="tName" placeholder="姓名" autofocus/>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="tId" class="sr-only">工号</label>
                        工&nbsp;&nbsp;&nbsp;号：&nbsp;
                        <input type="text"  class="form-control" id="tId" name="tId"
                               placeholder="工号"/>
                    </div>
                    <br><br>
                    <div class="form-group" >
                        <label for="tDep" class="sr-only">院系</label>
                        院&nbsp;&nbsp;&nbsp;系：&nbsp;
                        <select id="tDep" class="selectpicker" name="tDep" data-live-search="true"
                                title="--请选择--">
                            <%-- <option selected >--请选择--</option>--%>
                        </select>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="tDep" class="sr-only">性别</label>
                        性&nbsp;&nbsp;&nbsp;别：&nbsp;
                        <select class="selectpicker" id="tGender"  name="tGender">
                            <option value="男" selected>男</option>
                            <option value="女">女</option>
                        </select>
                    </div>

                    <br><br>
                    <div class="form-group" >
                        <label for="tTel" class="sr-only">请输入您的手机号</label>
                        联系方式:
                        <input type="text" id="tTel" name="tTel" class="form-control" placeholder="请输入您的手机号"/>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="tBirthday" class="sr-only">年/月/日</label>
                        生&nbsp;&nbsp;&nbsp;日：&nbsp;
                        <input type="date" class="form-control datepicker" id="tBirthday"
                               name="tBirthday" placeholder="年/月/日"/>
                    </div>
                    <br><br>
                    <span id="add_tip"></span>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-info glyphicon glyphicon-remove-sign" data-dismiss="modal">
                            取消
                        </button>
                        <button type="button" onclick="saveInfo(this)"
                                class="btn btn-primary glyphicon glyphicon glyphicon-ok-sign">
                            保存
                        </button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<%-------------------------------------------------------------------------------------------------------------------------------------------%>
<%----------------------------------------------------------------------------------------------------------------------------------------%>
<%--文件上传--%>
<!--导入数据操作层-->
<form>
    <div class="modal fade" id="import" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_import">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel_import">请选择Excel文件</h4>
                </div>
                <div class="modal-body">
                    <a href="${pageContext.request.contextPath}/downLoadExcelModel/test1.xlsx" class="form-control"
                       style="border:none;">下载导入模板</a>
                    <input type="file" name="txt_file" id="txt_file" multiple class="file-loading"/>
                </div>
            </div>
        </div>
    </div>
</form>


</body>

<script>
    /*
    * 动态加载所有院系，以便选择
    * */
    $(function () {
        //初始化下拉框
        //动态加载
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/department/getAllDep',
            dataType: "json",
            success: function (data) {
                //拼接下拉框
                for (var i = 0; i < data.length; i++) {
                    $("#tDep").append("<option value='" + data[i].dId + "'>" + data[i].dName + "</option>");
                }
                //这一步不要忘记 不然下拉框没有数据
                $("#tDep").selectpicker("refresh");
            }
        });
    });


    //当关闭modal的时候清除modal里面的数据
    $('#teacher_modal').on('hide.bs.modal', function () {
        //clearForm($("#teacher_modal"));
        $("#form_teacher")[0].reset();//重置表单，此处用jquery获取Dom节点时一定要加[0]
        //$('#teacher_modal').data('bootstrapValidator').resetForm(true);
       // $('#teacher_modal').data("bootstrapValidator").resetForm();
        $("#form_teacher").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
        clearForm($("form_teacher"))
    });

    //表单验证
    $(document).ready(function () {
        $('#form_teacher').bootstrapValidator({
            message: 'This value is not valid',
            excluded: ':disabled',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                tName: {
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        },
                        stringLength: {
                            min:2,
                            max:10,
                            message:'长度在2 ~ 10之间'
                        }
                        /* stringCase: {
                             message: 'The first name must contain upper case characters only',
                             case: 'upper'
                         },*/
                        /*regexp: {
                            regexp: /^[A-Z\s]+$/i,
                            message: 'The last name can only consist of alphabetical characters and spaces'
                        }*/
                    }
                },
                tId: {
                    validators: {
                        notEmpty: {
                            message: '工号不能为空'
                        },
                        /*stringCase: {
                            message: 'The last name must contain upper case characters only',
                            case: 'upper'
                        },*/
                        stringLength: {
                            //2017117102
                            min: 10,
                            max: 10,
                            message: '工号长度为10'
                        },
                        digits: {
                            message: '仅为数字'
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
                /*tDep: {
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
                },*/
                /*email: {
                    validators: {
                        emailAddress: {
                            message: 'The input is not a valid email address'
                        }
                    }
                },*/
                /*password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and cannot be empty'
                        },
                        different: {
                            field: 'username',
                            message: 'The password cannot be the same as username'
                        }
                    }
                },*/
                tGender: {
                    validators: {
                        notEmpty: {
                            message: 'The gender is required'
                        }
                    }
                },
                tTel: {
                    message: '电话号码不正确',
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '请输入11位手机号码'
                        },
                        regexp: {
                            regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                            message: '请输入正确的手机号码'
                        }
                    }
                },
                tBirthday: {
                    notEmpty:{
                      message:'不能为空'
                    },
                    validators: {
                        notEmpty:{
                          message:'生日不能为空'
                        },
                        date: {
                            format: 'YYYY/MM/DD',
                            message: '生日格式不正确'
                        }
                    }
                }

            }
        }).on('success.form.bv', function(e) {
            //e.preventDefault();//取消submit默认提交效果
            $("#form_teacher")[0].reset();//重置表单，此处用jquery获取Dom节点时一定要加[0]
            console.log("验证完毕")
        });
    });


</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/teacherManage.js"></script>
</html>
