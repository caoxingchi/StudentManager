<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: caoxi
  Date: 2020/3/13
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/courseManage.js"></script>
<script type="text/javascript">
    $(function () {
        $.ajax(
            {
                url: "${pageContext.request.contextPath}/department/getAllDep.do",
                type: 'get',
                dataType: "json",
                success: function (data) {
                    //拼接下拉框
                    for (var i = 0; i < data.length; i++) {
                        $("#cUnit").append("<option value='" + data[i].dId + "'>" + data[i].dName + "</option>");
                    }
                    $("#cUnit").selectpicker("refresh");
                }
            }
        );
    });




</script>

<body>
<!--课程添加的修改-->
<%--课程添加--%>
<%----------------------------------------------------------------------------------------------------------------%>
<div class="modal fade" id="course_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加课程
                </h4>
            </div>

            <div class="modal-body">
                <form id="form_course" class="form-inline" role="form">
                    <input type="hidden" id="cId" name="cId"/>
                    <div class="form-group">
                        <label for="cName" class="sr-only">课程名称</label>
                        课程名称：
                        <input type="text" class="form-control" id="cName" name="cName" placeholder="课程名称" required
                               autofocus/>
                    </div>
                    <br>
                    <br>
                    <label for="must" class="sr-only">课程类型</label>
                    课程类型：
                    <input type="radio" id="must" checked name="cType" value="必修" required/>必修
                    <input type="radio" id="nomust" name="cType" value="选修" required/>选修
                    <br>
                    <br>
                    <label for="cCredit" class="sr-only">学分</label>
                    学&nbsp;&nbsp;&nbsp;&nbsp;分：
                    <select id="cCredit" class="selectpicker" name="cCredit" data-live-search="true" data-width="100px"
                            title="--请选择--">
                        <option selected>--请选择--</option>
                        <%
                            for (int i = 1; i < 11; i++) {
                        %>
                        <option value="<%=i%>"><%=i%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                    <br>
                    <label for="cPeriod" class="sr-only">学时</label>
                    学&nbsp;&nbsp;&nbsp;&nbsp;时：
                    <select name="cPeriod" id="cPeriod" class="selectpicker" data-live-search="true" data-width="100px"
                            title="--请选择--">
                        <option>--请选择--</option>
                        <%
                            for (int i = 1; i < 109; i++) {
                        %>
                        <option value="<%=i%>"><%=i%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                    <br>
                    <label for="cTime" class="sr-only">开课时间</label>
                    开课时间：
                    <input type="date" class="form-control" id="cTime" name="cTime" placeholder="开课时间" required/>
                    <br>
                    <label for="cUnit" class="sr-only">开课单位</label>
                    开课单位：
                    <select id="cUnit" class="selectpicker" name="cUnit" data-live-search="true" data-width="175px"
                            title="--请选择--" onchange="getTeacher()">
                        <option selected>--请选择--</option>
                    </select>

                    <label for="tId" class="sr-only">任课教师</label>
                    任课教师：
                    <select id="tId" class="selectpicker" name="tId" data-live-search="true" data-width="175px"
                            title="--请选择--">
                        <option selected>--请选择--</option>
                    </select>
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

<%-------------------------------------------------------------------------------------------------------------------%>
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
                    <a href="downLoadExcelModel/模板一.xls" class="form-control" style="border:none;">下载导入模板</a>
                    <input type="file" name="txt_file" id="txt_file" multiple class="file-loading"/>
                </div>
            </div>
        </div>
    </div>
</form>

</body>

<script type="text/javascript">
    //当关闭modal的时候清除modal里面的数据
    $('#course_modal').on('hide.bs.modal', function () {
        //clearForm($("#teacher_modal"));
        console.log("课程modal隐藏")
        $("#form_course")[0].reset();//重置表单，此处用jquery获取Dom节点时一定要加[0]
        //$('#teacher_modal').data('bootstrapValidator').resetForm(true);
        // $('#teacher_modal').data("bootstrapValidator").resetForm();
        //$("#form_teacher").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
        clearForm($("#form_course"))
    });
</script>
</html>
