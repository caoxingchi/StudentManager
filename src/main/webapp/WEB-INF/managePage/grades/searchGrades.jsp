<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>查询修改成绩</title>
    <jsp:include page="../init.jsp"/>
</head>
<body>
<div id="toolbar" class="btn-group-sm  pull-left " style="padding-left: auto">
    <button id="btn_add" type="button" class="btn btn-warning " data-toggle="modal" onclick="addTeacher()">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
    </button>
    <button id="btn_del" type="button" class="btn btn-danger" onclick="delMore()">
        <span class="glyphicon glyphicon-trash " aria-hidden="true"></span>删除
    </button>
    <button id="btn_export" type="button" onclick="exportFile()" class="btn btn-info">
        <span class="glyphicon glyphicon-export" aria-hidden="true"></span>导出数据
    </button>
</div>
<table id="mytab" class="table bg-info"></table>

<jsp:include page="/modal_file/teacherManageModal.jsp"/>
</body>


<script type="text/javascript">

    /**
     * 文件弹框上传初始化
     * */
    $(function () {
        //0.初始化fileinput
        var oFileInput = new FileInput();
        oFileInput.Init("txt_file", "/api/OrderApi/ImportOrder");
    });

    /**
     * table的初始化操作
     * */
    $('#mytab').bootstrapTable({
        url: "${pageContext.request.contextPath}/findAllTeacher",
        method: "post",
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
        showExport: true,//工具栏上显示导出按钮
        //exportDataType: $(this).val(),//显示导出范围
        exportTypes: ['json', 'xml', 'png', 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx'],//导出格式
        exportOptions: {//导出设置
            fileName: 'teacherInfo',//下载文件名称
            exportDataType: "selected",
            icons:"glyphicon-export",
            onCellHtmlData: function (cell, row, col, data){//处理导出内容,自定义某一行、某一列、某个单元格的内容
                console.info(data);
                return data;
            }
        },
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
                field: 'tId',
                align: 'center',
                title: '工号',
            }, {
                field: 'tName',
                align: 'center',
                title: '姓名'
            }, {
                field: 'tGender',
                align: 'center',
                title: '性别'
            }, {
                field: 'department.dName',
                align: 'center',
                title: '院系'
            }, {
                field: 'tBirthday',
                align: 'center',
                title: '生日'
            }, {
                field: 'tTel',
                align: 'center',
                title: '电话号码'
            }, {
                field: 'operator',
                align: 'center',
                title: '操作',
                formatter: operationTable
            }
        ]
    });

    /**
     * 操作列
     * @param value 传入的数据
     * @param row 当前行
     * @param index 当前列数
     * @returns {string} 返回渲染数据
     */
    function operationTable(value, row, index) {
        return "<button class=\"btn btn-sm btn-info\" onclick=\"modal_edit('" + index + "')\"> 修改 </button>" +
            "&nbsp;&nbsp;" +
            "<button class=\"btn btn-sm btn-danger\" onclick=\"modal_del('" + index + "')\"> 删除 </button>";
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


     /**
     * 导出数据
     */
    /*function exportFile(row) {
        row=$("#mytab").bootstrapTable('getSelections');
        console.log(row)
        if(row.length===0){
            toastr.warning("请选择要导出的数据！")
            return;
        }else{
            $('#mytab').tableExport({
                type: 'excel',
                exportDataType: "selected",
                ignoreColumn: [0],//忽略某一列的索引
                fileName: 'teacherInfo',//下载文件名称
                onCellHtmlData: function (cell, row, col, data){//处理导出内容,自定义某一行、某一列、某个单元格的内容
                  //  console.info(data);
                    return data;
                },
            });
        }

    }*/
</script>
</html>