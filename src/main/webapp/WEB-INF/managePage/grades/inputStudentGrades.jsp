<%--
  Created by IntelliJ IDEA.
  User: itcolors
  Date: 2020/8/26
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>录入学生成绩</title>
    <jsp:include page="../init.jsp"/>
</head>
<style>
    .panel-body {
        height: 220px;
    }
</style>

<%--本页面实现针对学生
 在开课时间的基础上 ------>  筛选开课时间段
 对某院系          ------>   通过选择院系
 的某专业          ------>  通过选择专业
 的某班级的        ------>  通过选择班级
 某学生           ------>   每个学生下面有单独的课程表
 课程表           ------>   里面有录入操作
 进行对他每科的成绩的录入操作--%>
<body>
<%-------------------------------查询 进行录入成绩操作 form--------------------------------%>
<div class="panel-group" id="accordion">
    <div class="panel panel-info">
        <div class="panel-heading ">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="#collapseOne">
                    查&nbsp;询&nbsp;&nbsp;--->&nbsp;&nbsp;录&nbsp;入&nbsp;成&nbsp;绩
                </a>
            </h4>

        </div>
        <div id="collapseOne" class="panel-collapse collapse">
            <div class="panel-body">
                <form style="padding-top: 5px;padding-left: 5px" id="form_teacher" class="form-inline required-validate"
                      role="form" method="post">
                    <%--开课时间--%>
                    <div class="form-group">
                        <label for="startTime" class="sr-only">年/月/日</label>
                        开课时间：&nbsp;
                        <input type="date" class="form-control datepicker" id="startTime"
                               name="startTime" placeholder="年/月/日"/>
                    </div>
                    ~~
                    <div class="form-group">
                        <label for="endTime" class="sr-only">年/月/日</label>
                        <input type="date" class="form-control datepicker" id="endTime"
                               name="endTime" placeholder="年/月/日"/>
                    </div>
                    <%-------------------------------------------------------------------------------------------------------%>
                    <%--院系--%>
                    <%--ajax异步获取 嵌套获取数据--%>

                    <div class="form-group">
                        <label for="sDep" class="sr-only">院系</label>
                        院&nbsp;&nbsp;&nbsp;系：&nbsp;
                        <select id="sDep" class="selectpicker" name="sDep" data-live-search="true"
                                title="--请选择--">
                             <option selected >--请选择--</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="sMajor" class="sr-only">专业</label>
                        专&nbsp;&nbsp;&nbsp;业：&nbsp;
                        <select id="sMajor" class="selectpicker" name="sMajor" data-live-search="true"
                                title="--请选择--">
                             <option selected >--请选择--</option>
                        </select>
                    </div>
                    <br><br><br>
                    <%--------------------------------------------------------------------------%>
                    <div class="form-group">
                        <label for="sClass" class="sr-only">班级</label>
                        班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：&nbsp;
                        <select id="sClass" class="selectpicker" name="sClass" data-live-search="true"
                                title="--请选择--">
                             <option selected >--请选择--</option>
                        </select>
                    </div>
                    ----
                    <div class="form-group" style="padding-right: 1px">
                        <label for="sName" class="sr-only">姓名</label>
                        姓&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;
                        <input type="text" class="form-control" id="sName" name="sName" placeholder="姓名"/>
                    </div>
                    ----
                    <div class="form-group">
                        <label for="sId" class="sr-only">学号</label>
                        学&nbsp;&nbsp;&nbsp;号：&nbsp;
                        <input type="text" class="form-control" id="sId" name="sId"
                               placeholder="学号"/>
                    </div>
                    <br><br>
                    <div class="modal-footer">
                        <button type="button" onclick="saveTeacher()"
                                class="btn btn-primary glyphicon glyphicon glyphicon-search">
                            查询
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
    <table id="mytab" class="table bg-info"></table>
</div>

<script type="text/javascript">

    /**
     * table的初始化操作
     * */
    $('#mytab').bootstrapTable({
        url: "${pageContext.request.contextPath}/student/findAllStu",
        method: "post",
        striped: true,                      //是否显示行间隔色
        contextType: "application/json",
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        toggle: "table",
        silent: "true",
        pagination: true,//是否分页
        paginationHAlign: "right",//分页按钮位置
        paginationVAlign: "bottom",
        paginationPreText: "<<",//前一页
        paginationNextText: ">>",//后一页
        pageSize: 5,//单页记录数
        pageList: [5, 10, 20],//可选择单页记录数
        smartDisplay: true,
        sortOrder: "asc", //排序
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        search: true,                      //是否显示表格搜索
        showRefresh: true,      //是否显示刷新按钮
        showColumns: true,    //展示所有的列
        showToggle: true,
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        detailView: true,      ////是否显示父子表
        //showPaginationSwitch:false,//是否显示数据条数选择框
        // singleSelect: true,
        showExport: true,//工具栏上显示导出按钮
        //exportDataType: $(this).val(),//显示导出范围
        exportTypes: ['json', 'xml', 'png', 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx'],//导出格式
        exportOptions: {//导出设置
            fileName: 'teacherInfo',//下载文件名称
            exportDataType: "all",
            icons: "glyphicon-export",
            onCellHtmlData: function (cell, row, col, data) {//处理导出内容,自定义某一行、某一列、某个单元格的内容
                console.info(data);
                return data;
            }
        },
        //toolbar: "#toolbar",
        queryParams: function (params) {
            return {
                ct: params.offset / params.limit + 1,  //页码
                size: params.limit,   //页面大小
            };
        }, columns: [
            {
                field: 'sId',
                align: 'center',
                title: '学号'
            },
            {
                field: 'sName',
                align: 'center',
                title: '姓名',
                sortable: true
            },
            {
                field: 'classes.clName',
                align: 'center',
                title: '班级',
            },
            {
                field: 'department.dName',
                align: 'center',
                title: '院系',
                sortable: true
            }, {
                field: 'major.mName',
                align: 'center',
                title: '专业'
            },
        ],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {
            InitSubTable(index, row, $detail);
        }
    });



    /**
     * 表格中字段内容过长时采用缩略方式
     */
    function contentFormatter(value, row, index) {
        var content = value;
        if (value && value.length > 10) {
            content = value.substr(0, 10) + "..."
        }
        return "<span data-toggle='tooltip' data-html='true'  data-placement=\"top\" title=\"" + value + "\">" + content + "</span>";
    }
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/studentGradesManage.js"></script>
</body>
</html>
