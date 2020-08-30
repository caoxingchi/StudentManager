

var url;

function addCourse() {
    //当展示modal的时候修改title
    $('#course_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title=document.getElementById("myModalLabel");
        title.innerText="添加课程";
    });
    // $("#teacher_modal").title="添加教师";
    $("#course_modal").modal("show");
    url="course/addCourse";
}

function modifyCourse(index) {
    //当展示modal的时候修改title
    $('#course_modal').on('show.bs.modal', function () {
        // 执行一些动作...
        var title=document.getElementById("myModalLabel");
        title.innerText="修改课程";
    });
    var rowData = $("#mytab").bootstrapTable('getData')[index];
    //toastr.warning("准备修改 "+myrow.tName,"修改操作")
    console.log(rowData)
    loadTableDataToCourseModal(rowData);
    url="course/updateCourse";
}

function loadTableDataToCourseModal(rowData) {
    //var rowData=$("#mytab").bootstrapTable("getData")[index];
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
        url:"findTeacherByDep?dId="+rowData.department.dId,
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
    $("#course_modal").modal("show")
}


/**
 * 获取一个要删除的课程的id并放入集合中传给dialog_del方法
 * @index 要删除的课程所在表格位置的索引
 */
function delOne_course(index) {
    var rowData = $("#mytab").bootstrapTable('getData')[index];
    var cIds=new Array();
    cIds.push(rowData.cId);
    var del_url="course/delCourse?cIds=";
    dialog_del(cIds,del_url);
}

function delMore_course(){
    var delRows=$("#mytab").bootstrapTable('getSelections');
    if (delRows.length==0){
        toastr.warning("没有选中数据!");
    } else {
        var cids=new Array();
        delRows.forEach(function (delRow) {
            cids.push(delRow.cId);
        });
        var del_url="course/delCourse?cIds=";
        dialog_del(cids,del_url);
    }
}

/**
 * 根据所选的院系获取该院系下的老师并将老师信息加载到下拉框
 */
function getTeacher() {
    document.getElementById("tId").length=1;
    //document.getElementById("update_tId").length=1;
    var dId= $("#cUnit").val();
    $.ajax({
        url:"findTeacherByDep?dId="+dId,
        dataType:'json',
        type:'post',
        success:function (data) {
            for (var i=0;i<data.length;i++){
                $("#tId").append("<option value='"+data[i].tId+"'>"+data[i].tId+"  "+data[i].tName+"</option>");
            }
            $("#tId").selectpicker("refresh");
        }
    })
}