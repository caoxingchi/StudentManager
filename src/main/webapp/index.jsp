<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>学生管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-js/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-js/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-js/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-js/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-js/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap-js/css/signin.css"/>
  </head>
  <style>
    #main{
      background-image: url('${pageContext.request.contextPath}/images/background.jpg');
      width:100%;
      height:100%;
    }
  </style>

  <body id="main">
  <div class="container">
    <form class="form-signin" action="${pageContext.request.contextPath}/managerLogin.do" method="post" >
      <h2 class="text-center">学&nbsp;生&nbsp;管&nbsp;理&nbsp;系&nbsp;统</h2>
      <br>
      <br>
      <label for="username" class="sr-only">用户名</label>
      用户名：<input type="text" id="username" value="${username}" name="username" class="form-control" placeholder="用户名" required autofocus>
      <br>
      <label for="password" class="sr-only">密码</label>
      密码：<input type="password" id="password" value="${password}" name="password" class="form-control" placeholder="密码" required>
      <br>
      <label for="validCode" class="sr-only">验证码</label>
      验证码：<input type="text" id="validCode" class="form-control" name="validCode" placeholder="验证码" required>
      <a  style="text-decoration: none"  href="javascript:getValidCode();">
      <img id="myCode" src="${pageContext.request.contextPath}/validCode.do">

        <span style="color: #5f9ea0;size:3px" >换一张 看不清楚</span></a>
      <br>
      <button class="btn btn-lg btn-primary btn-block" type="submit">登&nbsp;录</button>
      <br>
      <button class="btn-link" data-toggle="modal" data-target="#resetPswd"  style="float:right;margin-top: -1%">忘记密码</button>
      <br>
      <span style="color: red">${error}</span>
    </form>

  </div>

  </body>
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript"src="${pageContext.request.contextPath}/bootstrap-js/js/bootstrap.min.js" ></script>
  <script type="text/javascript">
      function getValidCode(){
          $("#myCode").attr("src","${pageContext.request.contextPath}/validCode.do?date="+Math.random());
      }
  </script>
<jsp:include page="/modal_file/indexModal.jsp"/>
</html>