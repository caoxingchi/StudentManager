<%--
  Created by IntelliJ IDEA.
  User: caoxi
  Date: 2020/3/12
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生信息管理系统主界面</title>

    <jsp:include page="init.jsp"/>
    <style type="text/css">
        .treeIcon {
            background: url("${pageContext.request.contextPath}/EasyUI/themes/icons/tip.png");
        }

    </style>
    <script type="text/javascript">
        $(function () {
            //数据
            var treeData = [{
                text: "管理员管理",
                children: [
                    {
                        text: "院系专业班级管理",
                        attributes: {
                            url: "dep_major_class"
                        },
                        iconCls: 'treeIcon'
                    },
                    {
                        text: "学生信息管理",
                        attributes: {
                            url: "studentInfo"
                        },
                        iconCls: 'treeIcon'
                    },
                    {
                        text: "课程管理",
                        attributes: {
                            url: "courseInfo"
                        },
                        iconCls: 'treeIcon'
                    },
                    {
                        text: "教师管理",
                        attributes: {
                            url: "teacherInfo"
                        },
                        iconCls: 'treeIcon'
                    },
                    {
                        text: "成绩管理",
                        state: "closed",
                        children: [
                            {
                                text: "单科成绩管理",
                                state: "closed",
                                children: [
                                    {
                                        text: "录入单科成绩",
                                        attributes: {
                                            url: "inputSingleSubjectGrades"
                                        },
                                        iconCls: 'treeIcon'
                                    },
                                    {
                                        text: "查询修改单科成绩",
                                        attributes: {
                                            url: "search_modifySingleSubjectGrades"
                                        },
                                        iconCls: 'treeIcon'
                                    },
                                ],
                                iconCls: 'treeIcon'
                            },
                            {
                                text: "学生个人成绩管理",
                                state: "closed",
                                children: [
                                    {
                                        text: "录入学生成绩",
                                        attributes: {
                                            url: "inputStudentGrades"
                                        },
                                        iconCls: 'treeIcon'
                                    },
                                    {
                                        text: "查询修改学生成绩",
                                        attributes: {
                                            url: "search_modifyGrades"
                                        },
                                        iconCls: 'treeIcon'
                                    },
                                ],
                                iconCls: 'treeIcon'
                            }],
                        iconCls: 'treeIcon'
                    }]
                , iconCls: 'treeIcon'
            }];


            var treeData1 = [{
                text: "个人信息",
                children: [{
                    text: "密码修改",
                    attributes: {
                        url: "modifyPsw"
                    }, iconCls: 'treeIcon'
                }, {
                    text: "管理管理员",
                    attributes: {
                        url: "managers"
                    }, iconCls: 'treeIcon'
                }], iconCls: 'treeIcon'
            }];

            //实例化树菜单
            $("#tree1").tree({
                data: treeData1,
                lines: true,
                onClick: function (node) {
                    if (node.attributes) {
                        openTab(node.text, node.attributes.url);
                    }

                }
            });
            //实例化树菜单
            $("#tree").tree({
                data: treeData,
                lines: true,
                onClick: function (node) {
                    if (node.attributes) {
                        openTab(node.text, node.attributes.url);
                    }

                }
            });

            //新增Tab
            function openTab(text, url) {
                var content = "<iframe frameborder='0' scrolling='auto' style='width:100%; height:100%;'  src=" + url + "></iframe>"
                if ($("#tabs").tabs('exists', text)) {
                    $("#tabs").tabs('select', text);
                } else {
                    $("#tabs").tabs("add", {
                        title: text,
                        closable: true,
                        content: content
                    });
                }

            }
        });
    </script>
</head>
<body class="easyui-layout">
<%--<div align="left" style="width:7.5%; float:left"><img src="images/logo.png" width="100%" height="100%"></div>--%>
<div region="north" class="navbar navbar-default" style="margin-bottom: 2px ;background: #e0ecff" role="navigation">
    <div class="navbar-collapse collapse" style="height: 1px;">
        <ul class="nav navbar-nav navbar-left">
            <li>
                <a href="managerMain">
                    管理员管理界面
                </a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="${pageContext.request.contextPath}/index.jsp">
                    退出系统
                </a>
            </li>
        </ul>
    </div>
</div>

</div>
<div region="center">
    <div class="easyui-tabs" fit="true" id="tabs">
        <div title="首页">
            <div align="center" style="padding-top: 150px"><font color="red" size="10"> 欢迎使用</font></div>
        </div>
    </div>
</div>
<div region="west" style="width: 16%;" title="导航菜单" split="true">
    <ul id="tree" class="easyui-tree " data-options="animate:true"></ul>
    <ul id="tree1" class="easyui-tree " data-options="animate:true"></ul>
    <!-- Left Panel -->

</div>
<div region="south" height="25px" align="center">版权所有</div>

</body>
</html>
