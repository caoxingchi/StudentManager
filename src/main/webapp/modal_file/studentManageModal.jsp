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
<script type="text/javascript">

</script>
<body>
<div class="modal fade" id="myModal_add" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel_add" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel_add">
                    添加学生
                </h4>
            </div>

                <div class="modal-body">
                    <form id="form_add_user" action="${pageContext.request.contextPath}/student/addStudent" method="post" class="form-inline" role="form">
                        <label for="sName" class="sr-only">姓名</label>
                        姓&nbsp;&nbsp;名：
                        <input type="text" class="form-control" id="sName" name="sName" placeholder="姓名" required autofocus/>
                    <br>
                        <label for="sId" class="sr-only">学号</label>
                        学&nbsp;&nbsp;号：
                        <input type="text" class="form-control" id="sId" name="sId" placeholder="学号" required/>
                    <br>
                        <label for="sGenderF" class="sr-only">性别</label>
                        性&nbsp;&nbsp;别：
                        <input type="radio"  id="sGenderF" name="sGender" checked value="男" required />男
                        <input type="radio"  id="sGenderM" name="sGender" value="女" required />女
                    <br>
                    <br>
                        <label for="sId" class="sr-only">院系</label>
                        院&nbsp;&nbsp;系：
                        <select id="sDep"  class="selectpicker" name="sDep" data-live-search="true" data-width="175px" title="--请选择--" onchange="getMajor('add')">
                             <option selected >--请选择--</option>
                        </select>
                    <br>
                        <label for="sMajor" class="sr-only">专业</label>
                        专&nbsp;&nbsp;业：
                        <select name="sMajor" id="sMajor" class="selectpicker" data-live-search="true" data-width="175px" title="--请选择--" onchange="getClass('add')">

                                <option >--请选择--</option>

                        </select>
                    <br>
                        <label for="sClass" class="sr-only">班级</label>
                        班&nbsp;&nbsp;级：
                        <select name="sClass" id="sClass" class="selectpicker" data-live-search="true" data-width="175px" title="--请选择--">

                            <option >--请选择--</option>

                        </select>
                    <br>
                        <label for="sId" class="sr-only">生日</label>
                        生&nbsp;&nbsp;日：
                        <input type="date" class="form-control" id="sBirthday" name="sBirthday" placeholder="生日" required/>
                    <br>

                    <div class="modal-footer">
                    <button type="button" class="btn btn-info glyphicon glyphicon-remove-sign" data-dismiss="modal">取消
                    </button>
                    <button type="submit" class="btn btn-primary glyphicon glyphicon glyphicon-ok-sign">
                        保存
                    </button>
                </div>
            </form>
                </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--用户的修改-->
<div class="modal fade" id="myModal_edit" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-info">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    修改操作
                </h4>
            </div>
            <div class="modal-body">
                <form id="form_edit_user" class="form-control-static" role="form" >
                    <label for="sName" class="sr-only">姓名</label>
                    姓&nbsp;&nbsp;名：
                    <input type="text" class="form-control" id="update_sName" name="sName" placeholder="姓名" required autofocus/>
                    <br>
                    <input type="hidden" id="update_sId" name="sId"/>
                    <label for="sGenderF" class="sr-only">性别</label>
                    性&nbsp;&nbsp;别：
                    <input type="radio"  id="update_sGenderF" checked name="sGender" value="男" required />男
                    <input type="radio"  id="update_sGenderM" name="sGender" value="女" required />女
                    <br>
                    <br>
                    <label for="sId" class="sr-only">院系</label>
                    院&nbsp;&nbsp;系：
                    <select id="update_sDep"  class="selectpicker" name="sDep" data-live-search="true" data-width="175px" title="--请选择--" onchange="getMajor('update')">
                        <option selected >--请选择--</option>
                    </select>
                    <br>
                    <label for="sMajor" class="sr-only">专业</label>
                    专&nbsp;&nbsp;业：
                    <select name="sMajor" id="update_sMajor" class="selectpicker" data-live-search="true" data-width="175px" title="--请选择--" onchange="getClass('update')">

                        <option >--请选择--</option>

                    </select>
                    <br>
                    <label for="sClass" class="sr-only">班级</label>
                    班&nbsp;&nbsp;级：
                    <select name="sClass" id="update_sClass" class="selectpicker" data-live-search="true" data-width="175px" title="--请选择--">

                        <option >--请选择--</option>

                    </select>
                    <br>
                    <label for="sId" class="sr-only">生日</label>
                    生&nbsp;&nbsp;日：
                    <input type="date" class="form-control" id="update_sBirthday" name="sBirthday" placeholder="生日" required/>
                    <br>
                    <div class="modal-footer">
                        <button type="button"  class="btn btn-info glyphicon glyphicon-remove-sign" data-dismiss="modal">取消
                        </button>
                        <button type="button" onclick="updateStu()" class="btn btn-primary glyphicon glyphicon glyphicon-ok-sign">
                            保存
                        </button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--文件上传--%>
<!--导入数据操作层-->
<form>
    <div class="modal fade" id="import" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_import">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel_import">请选择Excel文件</h4>
                </div>
                <div class="modal-body">
                    <a href="downLoadExcelModel/模板一.xls" class="form-control" style="border:none;">下载导入模板</a>
                    <input type="file" name="txt_file" id="txt_file" multiple class="file-loading" />
                </div></div>
        </div>
    </div>
</form>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/studentManage.js"></script>
<script>
    //当关闭modal的时候清除modal里面的数据
    $('.modal').on('hide.bs.modal', function () {
        $("#form_add_user")[0].reset();//重置表单，此处用jquery获取Dom节点时一定要加[0]
        $("#form_edit_user")[0].reset();//重置表单，此处用jquery获取Dom节点时一定要加[0]

        //$('#teacher_modal').data('bootstrapValidator').resetForm(true);
        // $('#teacher_modal').data("bootstrapValidator").resetForm();
        //$("#form_teacher").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
        clearForm($("#form_add_user"))
        clearForm($("#form_edit_user"))

    });
</script>
</html>
