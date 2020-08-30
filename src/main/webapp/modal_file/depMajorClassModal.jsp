<%--
  Created by IntelliJ IDEA.
  User: itcolors
  Date: 2020/8/27
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>院系专业班级操作</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/depMajorClass.js"></script>
<body>


<%--添加院系操作--%>
<%--------------------------------------------------------------------------------------------------------%>
<%------------------------------------------------------------------------------------------------------------------------------------%>
<!--修改院系信息-->
<div class="modal fade" id="dep_modal" tabindex="-1" role="dialog" aria-labelledby="dep_modal_do"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="dep_modal_do">
                    添加院系
                </h4>
            </div>
            <div class="modal-body">
                <form id="form_dep" class="form-inline required-validate" role="form" >
                        <input id="dId" name="dId" hidden="true">
                        <label for="dName" class="sr-only">院系</label>
                        院&nbsp;&nbsp;&nbsp;系：&nbsp;
                        <input type="text" class="form-control" id="dName" name="dName" placeholder="院系" autofocus/>
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

<%---------------------------------------------------------------------------------------------------------------%>
<%--添加专业的操作major--%>
<%--修改专业操作 major--%>
<div class="modal fade" id="major_modal" tabindex="-1" role="dialog" aria-labelledby="major_modal_do"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="major_modal_do">
                    添加专业
                </h4>
            </div>
            <div class="modal-body">
                <form id="form_major" class="form-inline required-validate" role="form" >
                    <input id="mId" name="mId" hidden="true">
                    <label for="mName" class="sr-only">专业</label>
                    专&nbsp;&nbsp;&nbsp;业：&nbsp;
                    <input type="text" class="form-control" id="mName" name="mName" placeholder="专业" autofocus/>
                    <br><br>
                    <label for="mTeacher" class="sr-only">老师</label>
                    老&nbsp;&nbsp;&nbsp;师：
                    <select id="mTeacher" name="mTeacher" class="selectpicker" title="--请选择--">
                        <option>--请选择--</option>
                    </select>

                    <input id="mDep" name="mDep" hidden="true">

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

<%------class 添加班级操作------------------------------------------------------------------------------------------------------%>
<%--class 修改班级操作--%>
<div class="modal fade" id="class_modal" tabindex="-1" role="dialog" aria-labelledby="class_modal_do"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="class_modal_do">
                    添加班级
                </h4>
            </div>
            <div class="modal-body">
                <form id="form_class" class="form-inline required-validate" role="form" >
                    <input id="clId" hidden="true" name="clId">
                    <div class="form-group" style="padding-right: 1px">
                        <label for="clName" class="sr-only">班级名称</label>
                        班级名称：&nbsp;
                        <input type="text" class="form-control" id="clName" name="clName" placeholder="班级名称" autofocus/>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <label for="clTeacher" class="sr-only">班主任</label>
                        班&nbsp;主&nbsp;任：&nbsp;
                        <select name="clTeacher" class="selectpicker" id="clTeacher" title="--请选择--">
                        </select>
                    </div>

                    <input id="clMajor" name="clMajor" hidden="true">
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
    $('.modal').on('hide.bs.modal', function () {
        $("#form_dep")[0].reset();//重置表单，此处用jquery获取Dom节点时一定要加[0]
        $("#form_major")[0].reset();//重置表单，此处用jquery获取Dom节点时一定要加[0]
        $("#form_class")[0].reset();
        //$('#teacher_modal').data('bootstrapValidator').resetForm(true);
        // $('#teacher_modal').data("bootstrapValidator").resetForm();
        //$("#form_teacher").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
        clearForm($("#form_dep"));
        clearForm($("#form_major"));
        clearForm( $("#form_class"));

    });

</script>

</html>

