<%--
  Created by IntelliJ IDEA.
  User: itcolors
  Date: 2020/8/27
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>学院专业班级管理</title>
    <jsp:include page="init.jsp"/>
</head>
<body>
<div id="toolbar" class="btn-group-sm  pull-left " style="padding-left: auto">
    <button id="btn_add" type="button" class="btn btn-warning " data-toggle="modal" onclick="addDep()">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
    </button>
    <button id="btn_del" type="button" class="btn btn-danger" onclick="del_more_dep()">
        <span class="glyphicon glyphicon-trash " aria-hidden="true"></span>删除
    </button>
    <button id="btn_export" type="button" onclick="exportFile()" class="btn btn-info">
        <span class="glyphicon glyphicon-export" aria-hidden="true"></span>导出数据
    </button>
</div>
<table id="mytab" class="table bg-info"></table>

<jsp:include page="/modal_file/depMajorClassModal.jsp"/>
</body>


<script type="text/javascript">
    /**
     * table的初始化操作
     * */
    $('#mytab').bootstrapTable({
        url: "${pageContext.request.contextPath}/department/getAllDep",
        method: "get",
        striped: true,                      //是否显示行间隔色
        contextType: "application/json",
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        toggle: "table",
        silent: "true",
        pagination: true,//是否分页
        paginationHAlign: "right",//分页按钮位置
        paginationVAlign:"bottom",
        paginationPreText: "<<",//前一页
        paginationNextText: ">>",//后一页
        pageSize: 5,//单页记录数
        pageList: [5, 10, 20],//可选择单页记录数
        smartDisplay: true,
        sortable: true, //
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
        toolbar: "#toolbar",
        queryParams: function (params) {
            return {
                ct: params.offset / params.limit + 1,  //页码
                size: params.limit,   //页面大小
            };
        }, columns: [
            {
                checkbox: true,
            },
            {
                field: 'dId',
                align: 'center',
                title: '院系编号',
                sortable:true
            }, {
                field: 'dName',
                align: 'center',
                title: '院系名称'
            },{
                field: 'operator',
                align: 'center',
                title: '操作',
                formatter: operationTable
            }
        ],//注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {
            InitMajorTable(index, row, $detail);
        }
    });

    /**
     * 操作列
     * @param value 传入的数据
     * @param row 当前行
     * @param index 当前列数
     * @returns {string} 返回渲染数据
     */
    function operationTable(value, row, index) {
        return "<button class=\"btn btn-sm btn-info glyphicon glyphicon-pencil\" onclick=\"modify_dep('" + index + "')\">  </button>" +
            "&nbsp;&nbsp;" +
            "<button class=\"btn btn-sm btn-danger glyphicon glyphicon-trash\" onclick=\"del_one_dep('" + index + "')\"> </button>"+
        "&nbsp;&nbsp;" +
        "<button class=\"btn btn-sm btn-primary glyphicon glyphicon-plus\" onclick=\"addMajor('" + index + "')\"> 添加专业</button>";
    }

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
</html>