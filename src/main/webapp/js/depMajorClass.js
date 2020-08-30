/**
 * 添加院系
 */
function addDep() {
    //当展示modal的时候修改title
    $('#dep_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title = document.getElementById("dep_modal_do");
        title.innerText = "添加院系";
    });
    $("#dep_modal").modal("show");
    url = "department/addDep";
}

function modify_dep(index) {
    //当展示modal的时候修改title
    $('#dep_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title = document.getElementById("dep_modal_do");
        title.innerText = "修改院系";
    });
    var myrow = $("#mytab").bootstrapTable('getData')[index];
    //toastr.warning("准备修改 "+myrow.tName,"修改操作")
    loadDatasToDepModal(myrow);
    url = "department/updateDep";
}

function loadDatasToDepModal(myrow) {
    $("#dId").val(myrow.dId)
    $("#dName").val(myrow.dName);
    $("#dep_modal").modal("show")
}

function del_one_dep(index) {
    //获取当前行的数据，不通过checkbox
    var delrow = $("#mytab").bootstrapTable('getData')[index];
    let tIds = new Array();
    var delId = delrow.dId;
    tIds.push(delId);
    if (delrow.length !== 0) {
        console.log("tId=" + delrow);
        var del_url = "department/delDeps?dIds=";
        dialog_del(tIds, del_url);
    }
    console.log(delrow.tId)
}

function del_more_dep() {
    //获取所有被选中的行 通过checkbox
    var rows = $("#mytab").bootstrapTable('getSelections');
    if (rows.length === 0) {
        toastr.warning("没有选中数据！")
    } else {
        var tIds = new Array();
        rows.forEach(rows => {
            tIds.push(rows.dId)
        });
        var del_url = "department/delDeps?dIds=";
        dialog_del(tIds, del_url);
        console.log(rows)
        console.log(tIds)
    }
}

/*------major 专业的操作--------------------------------------------------------------------------------------------------------*/
/**
 * 添加专业的操作
 * @param index
 */
function addMajor(index) {
    //当展示modal的时候修改title
    $('#major_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title = document.getElementById("major_modal_do");
        title.innerText = "添加专业";
    });
    $("#major_modal").modal("show");
    var deprow = $("#mytab").bootstrapTable('getData')[index];
    console.log(deprow);
    refreshTeacher(deprow.dId);
    //$("#form_major").val(deprow.dId);
    url = "major/addMajor?mDep="+deprow.dId;
}

function refreshTeacher(dId) {
    $("#mTeacher").find("option").remove();
    $("#clTeacher").find("option").remove();
    $.ajax({
        url: "findTeacherByDep",
        type: "get",
        async:false,//同步请求，以便加载数据
        data: {dId: dId},
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#mTeacher").append("<option value='" + data[i].tId + "'>" + data[i].tId + "  " + data[i].tName + "</option>");
                $("#clTeacher").append("<option value='" + data[i].tId + "'>" + data[i].tId + "  " + data[i].tName + "</option>");

            }
            $("#mTeacher").selectpicker("refresh");
            $("#clTeacher").selectpicker("refresh")
        }
    })
}


/**
 * 修改专业
 * @param index
 */
function modify_major(index) {
    //当展示modal的时候修改title
    $('#major_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title = document.getElementById("major_modal_do");
        title.innerText = "修改专业";
    });
    var row = $("#myMajorTable").bootstrapTable('getData')[index];
    console.log(row)
    loadDatasToMajorModal(row);
    url = "major/updateMajor";
}

/**
 * 加载major表中的数据到modal中
 * @param row
 */
function loadDatasToMajorModal(row) {
    refreshTeacher(row.mDep);
    $("#mId").val(row.mId);
    $("#mName").val(row.mName);
    $("#mTeacher").val(row.mTeacher);
    $("#mTeacher").selectpicker("refresh");
    $("#mDep").val(row.mDep);
    $("#major_modal").modal("show")
}

/**
 * 删除操作 单个 此处指进行删除单个
 * @param index
 */
function del_one_major(index) {
    //获取当前行的数据，不通过checkbox
    var delrow=$("#myMajorTable").bootstrapTable('getData')[index];
    let mIds =new Array();
    var delId=delrow.mId;
    mIds.push(delId);
    if(delrow.length!==0){
        //toastr.info("获取当前行的数据"+delrow,"title")
        console.log("mId="+delrow);
        var del_url="major/delMajors?mIds=";
        dialog_del(mIds,del_url);
    }
    console.log(delrow.tId)
}
/*-----classes 班级操作--------------------------------------------------------------------------------------*/
/**
 * 添加班级操作 通过传入的index获取当前的表的数据
 * @param index
 */
function addClasses(index) {
    //当展示modal的时候修改title
    $('#class_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title = document.getElementById("class_modal_do");
        title.innerText = "添加班级";
    });
    $("#class_modal").modal("show");
    var majrow = $("#myMajorTable").bootstrapTable('getData')[index];
    console.log(majrow);
    refreshTeacher(majrow.mDep);
    //$("#form_major").val(deprow.dId);
    url = "classes/addClasses?clMajor="+majrow.mId;
}

/**
 * 修改班级操作
 * @param index
 */
function modify_classes(index) {
    //当展示modal的时候修改title
    $('#class_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title = document.getElementById("class_modal_do");
        title.innerText = "修改班级";
    });
    var row = $("#myClassTable").bootstrapTable('getData')[index];
    console.log(row);
    loadDataToClassModal(row);
    url = "classes/updateClasses";
}


function loadDataToClassModal(rowData) {
    refreshTeacherBymajor(rowData.clMajor);
    $("#clId").val(rowData.clId);
    $("#clName").val(rowData.clName);
    $("#clTeacher").val(rowData.clTeacher);
    $("#clTeacher").selectpicker("refresh");
    $("#clMajor").val(rowData.clMajor);
    $("#class_modal").modal("show")
}

/**
 * 刷新教师数据 通过班行数据得到的专业编号，来获取院系编号
 * 然后通过院系编号来获取教师数据
 * @param clMajor
 */
function refreshTeacherBymajor(clMajor) {
    $("#clMajor").find("option").remove();
    $.ajax({
        url: "major/findTeacherByMajor",
        type: "get",
        async:false,//同步请求，以便加载数据
        data: {clMajor: clMajor},
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#clTeacher").append("<option value='" + data[i].tId + "'>" + data[i].tId + "  " + data[i].tName + "</option>");
            }
            $("#clTeacher").selectpicker("refresh")
        }
    })
}

function del_one_classes(index) {
    var delrow=$("#myClassTable").bootstrapTable("getData")[index];
    var delId=delrow.clId;
    var del_url="classes/deleteClasses?clId=";
    dialog_del(delId,del_url);
}

function InitMajorTable(index, row, $detail) {
    var parentid = row.dId;
    var cur_table = $detail.html('<table id="myMajorTable" class="table table-hover bg-success"></table>').find('table');
    $(cur_table).bootstrapTable({
        url: 'major/findMajorByDep',
        method: 'get',
        queryParams: {dId: parentid},
        ajaxOptions: {dId: parentid},
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
        columns: [
            {
                field: 'mId',
                align: 'center',
                title: '专业编号'
            },
            {
                field: 'mName',
                align: 'center',
                title: '专业名称'
            }, {
                field: 'teacher.tName',
                align: 'center',
                title: '专业负责老师'
            }, {
                field: 'operator',
                align: 'center',
                title: '操作',
                formatter: operationMajorTable
            }],
        //注册加载子表的事件。注意下这里的三个参数！
        onExpandRow: function (index, row, $detail) {
            InitClassTable(index, row, $detail);
        }
    });

    /**
     *
     * @param value 传入的数据
     * @param row 当前行
     * @param index 当前列数
     * @returns {string} 返回渲染数据
     * 对每一行的major的操作
     */
    function operationMajorTable(value, row, index) {
        return "<button class=\"btn btn-sm btn-info glyphicon glyphicon-pencil\" onclick=\"modify_major('" + index + "')\">  </button>" +
            "&nbsp;&nbsp;" +
            "<button class=\"btn btn-sm btn-danger glyphicon glyphicon-trash\" onclick=\"del_one_major('" + index + "')\"> </button>" +
            "&nbsp;&nbsp;" +
            "<button class=\"btn btn-sm btn-primary glyphicon glyphicon-plus\" onclick=\"addClasses('" + index + "')\"> 添加班级 </button>";
    }


    /*-------class 班级的操作---------------------------------------------------------------------------------------------------*/
    function InitClassTable(index, row, $detail) {
        console.log(row)
        var parentid = row.mId;
        var cur_table = $detail.html('<table id="myClassTable" class="table table-hover bg-success"></table>').find('table');
        $(cur_table).bootstrapTable({
            url: 'classes/getClassesByMajor',
            method: 'get',
            queryParams: {mId: parentid},
            ajaxOptions: {mId: parentid},
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
            columns: [
                {
                    field: 'clId',
                    align: 'center',
                    title: '班级编号'
                },
                {
                    field: 'clName',
                    align: 'center',
                    title: '班级名称'
                }, {
                    field: 'teacher.tName',
                    align: 'center',
                    title: '班主任'
                }, {
                    field: 'operator',
                    align: 'center',
                    title: '操作',
                    formatter: operationClassTable
                }],
            //注册加载子表的事件。注意下这里的三个参数！
            onExpandRow: function (index, row, $detail) {
                InitClassTable(index, row, $detail);
            }
        });
    }
}


function operationClassTable(value, row, index) {
    return "<button class=\"btn btn-sm btn-info glyphicon glyphicon-pencil\" onclick=\"modify_classes('" + index + "')\">  </button>" +
        "&nbsp;&nbsp;" +
        "<button class=\"btn btn-sm btn-danger glyphicon glyphicon-trash\" onclick=\"del_one_classes('" + index + "')\"> </button>"

}