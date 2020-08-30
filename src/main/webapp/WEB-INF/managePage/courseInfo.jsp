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
    <button id="btn_add" type="button" onclick="addCourse()" class="btn btn-warning " data-toggle="modal"  >
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
    </button>
    <button id="btn_del" type="button" class="btn btn-danger" onclick="delMore_course()">
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

<jsp:include page="/modal_file/courseManageModal.jsp"/>
</body>


<script type="text/javascript">

    $(function () {
        //0.初始化fileinput
        var oFileInput = new FileInput();
        oFileInput.Init("txt_file", "/api/OrderApi/ImportOrder");
    });

    $('#mytab').bootstrapTable({
        url: "${pageContext.request.contextPath}/course/findAllCourse",
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
            checkbox:true,
        },{
            field: 'cId',
            align: 'center',
            title: '课程编号',
        },{
            field: 'cName',
            align: 'center',
            title: '课程名称'
        },{
            field: 'teacher.tName',
            align: 'center',
            title: '教师'
        },{
            field: 'cType',
            align: 'center',
            title: '类型'
        },{
            field: 'cCredit',
            align: 'center',
            title: '学分'
        },{
            field: 'cPeriod',
            align: 'center',
            title: '学时',
        },{
            field: 'cTime',
            align: 'center',
            title: '开课时间',
        },{
            field: 'department.dName',
            align: 'center',
            title: '开课单位',
        },{
            field: '',
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
        return "<button class=\"btn btn-warning\" onclick=\"modifyCourse('" + index + "')\"> 修改 </button>" +
            "&nbsp;&nbsp;" +
            "<button class=\"btn btn-danger\" onclick=\"delOne_course('" + index + "')\"> 删除 </button>";
    }


    /**
     * 初始化修改信息modal，将需要修改的课程信息初始化在修改界面上
     * @index 要修改的学生所在表格位置的索引
     */
    /*function updateInit(index) {
        var rowData=$("#mytab").bootstrapTable("getData")[index];
        $("#cId").val(rowData.cId);
        $("#cName").val(rowData.cName);
        $("#cCredit").val(rowData.cCredit);
        $("#cCredit").selectpicker("refresh");
        $("#cPeriod").val(rowData.cPeriod);
        $("#cPeriod").selectpicker("refresh");
        $("#cTime").val(rowData.cTime);
        $("#cUnit").val(rowData.department.dId);
        $("#cUnit").selectpicker("refresh");
        if (rowData.cType=="必修"){
            $("#must").attr("checked",true);
        } else {
            $("#nomust").attr("checked",true);
        }
        //根据课程所在院系查找院系下的老师，并将该课程的老师初始化在界面上
        $.ajax({
            url:"${pageContext.request.contextPath}/findTeacherByDep?dId="+rowData.department.dId,
            type:'post',
            dataType:'json',
            success:function (data) {
                for (var i=0;i<data.length;i++){
                    $("#tId").append("<option value='"+data[i].tId+"'>"+data[i].tId+"  "+data[i].tName+"</option>");
                }
                $("#tId").val(rowData.tId);
                $("#tId").selectpicker("refresh");
            }
        })
        $("#course_modal").modal("show");
    }*/

/*    /!**
     * 获取一个要删除的课程的id并放入集合中传给dialog_del方法
     * @index 要删除的学生所在表格位置的索引
     *!/
    function delCourse_one(index) {
        var delId=$("#mytab").bootstrapTable("getData")[index];
        var cIds=new Array();
        cIds.push(delId);
        course_dialog_del(cIds);
    }*/

    /**
     * 获取表格中选中的要删除的课程的id并放入集合中传给dialog_del方法
     * @index 要删除的学生所在表格位置的索引
     */
/*    function delCourse_more() {
        var delRows=$("#mytab").bootstrapTable('getSelections');
        if (delRows.length==0){
            alert("没有选中数据!");
        } else {
            var cids=new Array();
            delRows.forEach(function (delRow) {
                cids.push(delRow.cId);
            });
            course_dialog_del(cids);
        }
    }*/

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