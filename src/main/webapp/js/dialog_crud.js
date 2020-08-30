var types = [BootstrapDialog.TYPE_DEFAULT,
    BootstrapDialog.TYPE_INFO,
    BootstrapDialog.TYPE_PRIMARY,
    BootstrapDialog.TYPE_SUCCESS,
    BootstrapDialog.TYPE_WARNING,
    BootstrapDialog.TYPE_DANGER];

var dialogSizes = [
    BootstrapDialog.SIZE_NORMAL,
    BootstrapDialog.SIZE_SMALL,
    BootstrapDialog.SIZE_WIDE,
    BootstrapDialog.SIZE_LARGE
];

var url;
function dialog_add() {
    var $html = $('<div><ul><li><span>添加</span></li></ul></div>')
    var dialog = new BootstrapDialog({
        size: dialogSizes[0],//弹框大小
        title: '添加操作',
        draggable: true,
        type: types[4],//给弹框添加class名
        message: $html,//弹框中间的内容
        buttons: [{
            icon: 'glyphicon glyphicon-remove-sign',
            label: '取消',
            cssClass: 'btn btn-sm btn-info ',
            action: function (newCatalogue) {
                newCatalogue.close();
            }
        }, {
            icon: 'glyphicon glyphicon-ok-sign',
            label: '保存',
            autospin: true,
            cssClass: 'btn btn-sm btn-primary',//给按钮加样式，btn、btn-primary为定义好的class
            action: function (dialogRef) {
                setTimeout(function () {
                    dialogRef.close();
                }, 3000);
            }
        }],
        onshow: function () {
            //shown();//弹框显示前触发函数
        },
        onshown: function () {
            //shown();//弹框显示后触发函数
            // alert($html.find('span').text());

        }
    });
    dialog.open();
}


/**
 * 弹框确认是否进行删除操作
 * 附带ajax操作开始进行删除操作
 * 现在功能实现删除教师信息的操作
 * @param delrow
 */

/**
 * 保存操作
 */
function saveInfo(myform) {
    console.log("开始准备保存数据")
    //通过this来获取当前所在的表单form
    var $myform = $(myform).parents("form");
    toastr.warning("正在处理！！！")
    setTimeout(function () {
        $.ajax({
            url: url,
            type: "post",
            data: $myform.serialize(),
            dataType: "json",
            beforeSend: function () {
                toastr.clear();
                //数据校验
                var validate = $myform.data("bootstrapValidator");
                if (validate == null) {
                    return true;
                }
                validate.validate();
                if (validate.isValid()) {
                    return true;
                } else {
                    toastr.error("表单验证失败！");
                    return false;
                }
            },
            success: function (result) {
                if (result.status === 1) {
                    $(".modal").modal('hide')
                    toastr.success(result.message)
                } else {
                    $(".modal").modal('hide')
                    toastr.error(result.message)
                }
            },
            error: function (result) {
                toastr.error("请求路径错误！")
            },
            complete: function () {
                $(".modal").modal('hide')
                //刷新数据
                $("#mytab").bootstrapTable("refresh")
                console.log("错误1111")
                clearForm($myform)
            }
        })
    }, 1000);
}

/**
 * 删除操作
 * @param tIds传入的IDs
 * @param delrow传入的行
 * @param del_url传入的请求url
 */
function dialog_del(ids, del_url) {

    //delrow_name为选中的教师姓名
    //当传过来的delrow为一行数据的时候可以直接获取姓名
    //当传过来的delrow为一个list的时候就需要通过foreach操作进行获取数据
    /*if(ids.length>0){
        var delrow_name=new Array();
        delrow.forEach(delrow=>{
            delrow_name.push(delrow.tName);
        });
    }else{
        var delrow_name=delrow.tName
    }*/

    var $html = $('<div><h4>是否删除 <span style="color: blue">' + ids + '</span>?<h4/></div>')
    var dialog = new BootstrapDialog({
        size: dialogSizes[1],//弹框大小
        title: '删除',
        draggable: true,
        type: types[5],//给弹框添加class名
        message: $html,//弹框中间的内容
        buttons: [{
            icon: 'glyphicon glyphicon-remove-sign',
            label: '取消',
            cssClass: 'btn btn-sm btn-info ',
            action: function (newCatalogue) {
                newCatalogue.close();
            }
        }, {
            icon: 'glyphicon glyphicon-ok-sign',
            label: '确定',
            autospin: true,
            cssClass: 'btn btn-sm btn-primary',//给按钮加样式，btn、btn-primary为定义好的class
            action: function (dialogRef) {
                toastr.warning("正在处理中. . . ")
                //延时发送请求达到用户效果
                setTimeout(function () {
                    $.ajax({
                        type: 'get',
                        url: del_url + ids,
                        dataType: 'json',
                        beforeSend: function () {
                            toastr.clear()
                        },
                        success: function (result) {
                            console.log(result.status)
                            if (result.status === 1) {
                                toastr.success(result.message)
                                $("#mytab").bootstrapTable("refresh")
                            } else {
                                toastr.error(result.message)
                            }
                        }, error: function (result) {
                            console.log("error" + result.message)
                            toastr.error(result.message)
                        }, complete: function () {
                            // toastr.warning("删除成功")
                        }
                    });
                    dialogRef.close();
                }, 1000);
            }
        }],
        onshow: function () {
            //shown();//弹框显示前触发函数
        },
        onshown: function () {
            //shown();//弹框显示后触发函数
            // alert($html.find('span').text());
        }
    });
    dialog.open();
}

/**
 * 清除form中的数据
 * */
function clearForm(form) {
    $(':input', form).each(function () {
        var type = this.type;
        var tag = this.tagName.toLowerCase();
        if (type == 'password' || type == 'text' || tag == 'textarea' || type == 'date') {
            this.value = ""
        } else if (tag === 'select') {
            this.selectedIndex = -1
        }
    });
    //还原数值
    $(".selectpicker").selectedIndex = 0;
    $(".selectpicker").selectpicker("refresh");
}


function importFile() {
    var $html = $(' <label class="control-label"> 选择文件 </label>\n' +
        ' <input type="file" class="file" id="excelFile" data-show-preview="true">')
    var dialog = new BootstrapDialog({
        size: dialogSizes[0],//弹框大小
        title: '导入数据',
        draggable: true,
        cssClass: 'dialogBig',//给弹框添加class名
        type: types[1],
        message: $html,//弹框中间的内容
        buttons: [{
            icon: 'glyphicon glyphicon-remove-sign',
            label: '取消',
            cssClass: 'btn btn-sm btn-info ',
            action: function (newCatalogue) {
                newCatalogue.close();
            }
        }, {
            icon: 'glyphicon glyphicon-ok-sign',
            label: '确定',
            autospin: true,
            cssClass: 'btn btn-sm btn-primary',//给按钮加样式，btn、btn-primary为定义好的class
            action: function (dialogRef) {
                setTimeout(function () {
                    dialogRef.close();
                }, 1000);
            }
        }],
        onshow: function () {
            //shown();//弹框显示前触发函数
        },
        onshown: function () {
            //shown();//弹框显示后触发函数
            // alert($html.find('span').text());

        }
    })
    dialog.open();

    InitExcelFile();
}

//初始化Excel导入的文件
function InitExcelFile() {
    //记录GUID
    $("#AttachGUID").val();

    $("#excelFile").fileinput({
        uploadUrl: "/FileUpload/Upload",//上传的地址
        uploadAsync: true,              //异步上传
        language: "zh",                 //设置语言
        showCaption: true,              //是否显示标题
        showUpload: true,               //是否显示上传按钮
        showRemove: true,               //是否显示移除按钮
        showPreview: true,             //是否显示预览按钮
        browseClass: "btn btn-primary", //按钮样式
        dropZoneEnabled: false,         //是否显示拖拽区域
        allowedFileExtensions: ["xls", "xlsx"], //接收的文件后缀
        maxFileCount: 1,                        //最大上传文件数限制
        previewFileIcon: '<i class="glyphicon glyphicon-file"></i>',
        allowedPreviewTypes: null,
        previewFileIconSettings: {
            'docx': '<i class="glyphicon glyphicon-file"></i>',
            'xlsx': '<i class="glyphicon glyphicon-file"></i>',
            'pptx': '<i class="glyphicon glyphicon-file"></i>',
            'jpg': '<i class="glyphicon glyphicon-picture"></i>',
            'pdf': '<i class="glyphicon glyphicon-file"></i>',
            'zip': '<i class="glyphicon glyphicon-file"></i>',
        },
        uploadExtraData: {  //上传的时候，增加的附加参数
            folder: '数据导入文件', guid: $("#AttachGUID").val()
        }
    })  //文件上传完成后的事件
        .on('fileuploaded', function (event, data, previewId, index) {
            var form = data.form, files = data.files, extra = data.extra,
                response = data.response, reader = data.reader;

            var res = data.response; //返回结果
            if (res.Success) {
                showTips('上传成功');
                var guid = $("#AttachGUID").val();

                //提示用户Excel格式是否正常，如果正常加载数据
                $.ajax({
                    url: '/TestUser/CheckExcelColumns?guid=' + guid,
                    type: 'get',
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            InitImport(guid); //重新刷新表格数据
                            showToast("文件已上传，数据加载完毕！");

                            //重新刷新GUID，以及清空文件，方便下一次处理
                            RefreshExcel();
                        } else {
                            showToast("上传的Excel文件检查不通过。请根据页面右上角的Excel模板格式进行数据录入。", "error");
                        }
                    }
                });
            } else {
                showTips('上传失败');
            }
        });
}

//初始化fileinput
var FileInput = function () {
    var oFile = new Object();

    //初始化fileinput控件（第一次初始化）
    oFile.Init = function (ctrlName, uploadUrl) {
        var control = $('#' + ctrlName);

        //初始化上传控件的样式
        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png', 'xls', 'xlsx'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            //dropZoneEnabled: false,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount: true,
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
        });

        //导入文件上传完成之后的事件
        $("#txt_file").on("fileuploaded", function (event, data, previewId, index) {
            $("#myModal").modal("hide");
            var data = data.response.lstOrderImport;
            if (data == undefined) {
                toastr.error('文件格式类型不正确');
                return;
            }
            //1.初始化表格
            var oTable = new TableInit();
            oTable.Init(data);
            $("#div_startimport").show();
        });
    }
    return oFile;
};

toastr.options = {
    "closeButton": false, //是否显示关闭按钮
    "debug": false, //是否使用debug模式
    //"positionClass": "toast-top",//弹出窗的位置
    "showDuration": "300",//显示的动画时间
    "hideDuration": "1000",//消失的动画时间
    "timeOut": "3000", //展现时间
    "extendedTimeOut": "1000",//加长展示时间
    "showEasing": "swing",//显示时的动画缓冲方式
    "hideEasing": "linear",//消失时的动画缓冲方式
    "showMethod": "show",//显示时的动画方式fadeIn slideDown show
    "hideMethod": "hide" //消失时的动画方式 fadeOut hide
};
