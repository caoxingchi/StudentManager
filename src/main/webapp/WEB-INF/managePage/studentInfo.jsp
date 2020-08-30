<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>用户管理</title>
    <jsp:include page="init.jsp"/>
</head>
<script type="text/javascript">

</script>
<body>
<div id="toolbar" class="btn-group-sm  pull-left " style="padding-left: auto">
    <button id="btn_add" type="button" class="btn btn-warning " data-toggle="modal" data-target="#myModal_add" >
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
    </button>
    <button id="btn_del" type="button" class="btn btn-danger" onclick="del_more()">
        <span class="glyphicon glyphicon-trash " aria-hidden="true"></span>删除
    </button>

    <button id="btn_export" type="button" class="btn btn-info">
        <span class="glyphicon glyphicon-export" aria-hidden="true"></span>导出数据
    </button>

    <button id="btn_import" type="button" class="btn btn-info" data-toggle="modal" data-target="#import">
        <span class="glyphicon glyphicon-import" aria-hidden="true"></span>导入数据
    </button>
</div>
<table id="mytab" class="table bg-info"></table>

<jsp:include page="/modal_file/studentManageModal.jsp"/>
</body>

<script type="text/javascript">

    $(function () {
        //0.初始化fileinput
        var oFileInput = new FileInput();
        oFileInput.Init("txt_file", "/api/OrderApi/ImportOrder");
    });

    $('#mytab').bootstrapTable({
        url: "${pageContext.request.contextPath}/student/findAllStu",
        method: "post",
        striped: true,                      //是否显示行间隔色
        contextType: "application/json",
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        //sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        toggle: "table",
        pagination: true,//是否分页
        pageSize: 5,//单页记录数
        pageList: [5, 10, 20],//可选择单页记录数
        smartDisplay: true,
        search: true,                      //是否显示表格搜索
        showRefresh: true,      //是否显示刷新按钮
        showColumns:true,
        showToggle:true,
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        toolbar: "#toolbar",
        queryParams: function (params) {
            return {
                ct: params.offset / params.limit + 1,  //页码
                size: params.limit,   //页面大小
            };
        },
        columns: [{
            field: '',
            align: 'center',
            checkbox:true,
            title: '选择',
        },{
            field: 'sId',
            align: 'center',
            title: '学号',
        },{
            field: 'sName',
            align: 'center',
            title: '姓名'
        },{
            field: 'sGender',
            align: 'center',
            title: '性别'
        },{
            field: 'department.dName',
            align: 'center',
            title: '院系'
        },{
            field: 'major.mName',
            align: 'center',
            title: '专业'
        },{
            field: 'classes.clName',
            align: 'center',
            title: '班级',
        },{
            field: 'sBirthday',
            align: 'center',
            title: '出生日期',
        },{
            field: 'operate',
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
        return "<button data-toggle=\"modal\"  class=\"btn btn-warning\"  onclick=\"updateInit('" + index+ "')\">修改 </button>" +
            "&nbsp;&nbsp;" +
            "<button class=\"btn btn-danger\" onclick=\"del_one('" + index + "')\"> 删除 </button>";
    }



    /**
     * 表格中字段内容过长时采用缩略方式
     */
    function contentFormatter(value, row, index) {
        var content = value;
        if(value && value.length >10){
            content = value.substr(0,10)+"..."
        }
        return  "<span data-toggle='tooltip' data-html='true'  data-placement=\"top\" title=\""+value+"\">"+content+"</span>" ;
    }

</script>
</html>