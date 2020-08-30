//初始化子表格()
function InitSubTable(index, row, $detail) {
    console.log(row)
    var parentid = row.department.dId;
    var stuId=row.sId;

    console.log(parentid);
    var startTime;
    var endTime;
    var cur_table = $detail.html('<table id="courseTable" class="table table-hover bg-success"></table>').find('table');
    $(cur_table).bootstrapTable({
        url: 'course/findCourse',
        method: 'get',
        queryParams: {startTime:startTime,endTime:endTime,cUnit: parentid},
        ajaxOptions: {startTime:startTime,endTime:endTime,cUnit: parentid},
        contextType: "application/json",
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        toggle: "table",
        silent: "true",
        pagination: true,//是否分页
        paginationHAlign: "right",//分页按钮位置
        paginationVAlign: "bottom",
        pageSize: 5,//单页记录数
        pageList: [5, 10, 20],//可选择单页记录数
        smartDisplay: true,
        sortOrder: "asc", //排序
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        //search: true,                      //是否显示表格搜索
        showRefresh: true,      //是否显示刷新按钮
        showColumns: true,    //展示所有的列
        showToggle: true,
        minimumCountColumns: 2,             //最少允许的列数
        singleSelect: true,
        clickToSelect: true,
        detailView: true,//父子表
       /* queryParams: function (params) {
            return {
                ct: params.offset / params.limit + 1,  //页码
                size: params.limit,   //页面大小
            };
        },*/
        columns: [
            {
                field: 'cTime',
                align: 'center',
                title: '开课时间'
            },
            {
                field: 'cId',
                align: 'center',
                title: '课程编号'
            }, {
                field: 'cName',
                align: 'center',
                title: '课程名称'
            }, {
                field: 'teacher.tName',
                align: 'center',
                title: '授课老师'
            },
            {
                field: 'cCredit',
                align: 'center',
                title: '学分'
            },
            {
                field: 'cPeriod',
                align: 'center',
                title: '学时'
            },
            {
                field: 'cType',
                align: 'center',
                title: '课程类型'
            },
            {
                field: 'grades.grade',
                align: 'center',
                title: '成绩'
            },
            {
                field: 'operator',
                align: 'center',
                title: '操作',
                formatter: operationTable
            }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {
            InitGradeTable(index, row, $detail);
        }
    });
}

function InitGradeTable(index, row, $detail) {
    var parentid = row.department.dId;
    var stuId=row.sId;

    console.log(parentid);
    var startTime;
    var endTime;
    var cur_table = $detail.html('<table id="courseTable" class="table table-hover bg-success"></table>').find('table');
    $(cur_table).bootstrapTable({
        url: 'course/findCourse',
        method: 'get',
        queryParams: {startTime:startTime,endTime:endTime,cUnit: parentid},
        ajaxOptions: {startTime:startTime,endTime:endTime,cUnit: parentid},
        contextType: "application/json",
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        toggle: "table",
        silent: "true",
        pagination: true,//是否分页
        paginationHAlign: "right",//分页按钮位置
        paginationVAlign: "bottom",
        pageSize: 5,//单页记录数
        pageList: [5, 10, 20],//可选择单页记录数
        smartDisplay: true,
        sortOrder: "asc", //排序
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        //search: true,                      //是否显示表格搜索
        showRefresh: true,      //是否显示刷新按钮
        showColumns: true,    //展示所有的列
        showToggle: true,
        minimumCountColumns: 2,             //最少允许的列数
        singleSelect: true,
        clickToSelect: true,
        detailView: false,//父子表
        /* queryParams: function (params) {
             return {
                 ct: params.offset / params.limit + 1,  //页码
                 size: params.limit,   //页面大小
             };
         },*/
        columns: [
            {
                field: 'cTime',
                align: 'center',
                title: '开课时间'
            },
            {
                field: 'cId',
                align: 'center',
                title: '课程编号'
            }, {
                field: 'cName',
                align: 'center',
                title: '课程名称'
            }, {
                field: 'teacher.tName',
                align: 'center',
                title: '授课老师'
            },
            {
                field: 'cCredit',
                align: 'center',
                title: '学分'
            },
            {
                field: 'cPeriod',
                align: 'center',
                title: '学时'
            },
            {
                field: 'cType',
                align: 'center',
                title: '课程类型'
            },
            {
                field: 'grades.grade',
                align: 'center',
                title: '成绩'
            },
            {
                field: 'operator',
                align: 'center',
                title: '操作',
                formatter: operationTable
            }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {
            InitGradeTable(index, row, $detail);
        }
    });
}

/**
 * 操作列
 * @param value 传入的数据
 * @param row 当前行
 * @param index 当前列数
 * @returns {string} 返回渲染数据
 */
function operationTable(value, row, index) {
    return "<button class=\"btn btn-sm btn-info glyphicon glyphicon-plus\" onclick=\"grades_add('" + row + "')\"></button>" +
        "&nbsp;&nbsp;" +
        "<button class=\"btn btn-sm btn-primary glyphicon glyphicon-pencil\" onclick=\"grades_modify('" + row + "')\"></button>" +
        "&nbsp;&nbsp;" +
        "<button class=\"btn btn-sm btn-danger glyphicon glyphicon-trash\" onclick=\"grades_modify('" + row + "')\"></button>"
        ;
}
/*
* 异步获取院系
* */

var s_Dep=1;
var s_Major=1;
var s_Class=1;

$.ajax({
    url:"department/getAllDep",
    method:"get",
    contextType: "application/json",
    type:"json",
    success:function (result) {
        //拼接下拉框
        $.each(result,function (i) {
            $("#sDep").append("<option value='" +  result[i].dId + "'>" +  result[i].dName + "</option>");
        });
        /*for (var i = 0; i < result.length; i++) {
            $("#sDep").append("<option value='" + result[i].dId + "'>" + result[i].dName + "</option>");
        }*/
        //这一步不要忘记 不然下拉框没有数据
        $("#sDep").selectpicker("refresh");
        console.log("进入department")
        s_Dep=$("#sDep").val();
        if(s_Dep!=null){
            $("#sDep option").detach(function () {
                if ($(this).val() === s_Dep){
                    $(this).attr("selected", true);
                    getMajor(s_Dep)
                }
            })
        }
    }

});

//加载专业
function getMajor(dId) {
    $("#sMajor").find("option").remove();
    console.log("进入专业加载")
    $.ajax({
        url:'major/findMajorByDep',
        method:'get',
        contextType: "application/json",
        type:"json",
        data:{dId:dId},
        success:function (result) {
            $.each(result,function (i) {
                $("#sMajor").append("<option value='" +  result[i].mId + "'>" +  result[i].mName + "</option>");
            });
            s_Major=$("#sMajor").val();
            //这一步不要忘记 不然下拉框没有数据
            $("#sMajor").selectpicker("refresh");
            console.log(s_Major);

            if(s_Major!=null){
                $("#sMajor option").detach(function () {
                    if ($(this).val() === s_Major){
                        $(this).attr("selected", true);
                        getClass(s_Major);
                    }
                })
            }
        }
    })
}

function getClass(mId) {
    console.log("进入班级加载")
    $("#sClass").find("option").remove();
    $.ajax({
        url:'classes/getClassesByMajor',
        method:"get",
        contextType:'application/json',
        type:"json",
        data:{mId:mId},
        success:function (result) {
            $.each(result,function (i) {
                $("#sClass").append("<option value='" +  result[i].clId + "'>" +  result[i].clName + "</option>");
            });
            //回显数据
            if (s_Class != null) {
                $("#sClass option").each(function () {
                    if ($(this).val() == s_Class)
                        $(this).attr("selected", true);
                })
            }
            $("#sClass").selectpicker("refresh");
        }
    })
}

//change事件监听province改变，获取该省份下面的市
$("#sDep").change(function() {
    var s_dep = $("#sDep option:selected").val();
    getMajor(s_dep);
    getClass(null);
    $("#sMajor").selectpicker("refresh");
});

//change事件监听city改变，获取该省份下面的市
$("#sMajor").change(function() {
    var s_major = $("#sMajor option:selected").val();
    getClass(s_major);
    $("#sClass").selectpicker("refresh");
});