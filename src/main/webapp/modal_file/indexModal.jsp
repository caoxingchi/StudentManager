<%--
  Created by IntelliJ IDEA.
  User: caoxi
  Date: 2020/3/15
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<div class="modal fade" id="resetPswd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header btn-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">重&nbsp;&nbsp;置&nbsp;&nbsp;密&nbsp;&nbsp;码</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline" role="form">
                    <label>用&ensp;户&ensp;名:&nbsp;&nbsp;</label><input class="form-control" required autofocus  placeholder="请输入您的用户名" />
                    <br />
                    <br />
                    <label>新&ensp;密&ensp;码:&nbsp;&nbsp;</label><input class="form-control" required placeholder="请设置您的新密码(不少于8位)" />
                    <br />
                    <br />
                    <label>确认密码:&nbsp;&nbsp;</label><input class="form-control" required placeholder="请再次确认您的新密码" />
                    <br />
                    <br />
                    <label>手&ensp;机&ensp;号:&nbsp;&nbsp;</label><input class="form-control" required placeholder="请输入您绑定的手机号" />
                    <input type="button" value="发送验证码" class="btn btn-info" />
                    <br />
                    <br />
                    <label>验&ensp;证&ensp;码:&nbsp;&nbsp;</label><input class="form-control" required placeholder="请输入短信验证码" />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="resetPwd" @click="resetPwd" class="btn btn-info glyphicon glyphicon-apple">重置密码</button>
            </div>
        </div>
    </div>
</div>
</body>
<%--可拖动modal
<script type="text/javascript" src="${pageContext.request.contextPath}/js/drag_modal.js"></script>--%>
</html>
