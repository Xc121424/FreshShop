<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/3/6
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>花仙子-会员登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<body>
<!--引入头部-->
<%@include file="/WEB-INF/Modules/header.jsp" %>
<!-- 头部 end -->
<section id="login_wrap">
    <div class="fullscreen-bg" style="background: url(${pageContext.request.contextPath}/images/login3.jpg);height: 532px;width: 1300px">

    </div>
    <div class="login-box">
        <div class="title">
            <span style="margin-left: 70px">登录花仙子会员</span>
        </div>
        <div class="login_inner">

            <!--登录错误提示消息-->
            <div id="error" class="alert alert-danger" style="width: 250px;margin-left: -2px;">${error}</div>
            <form id="loginForm" action="/frame/userlogin" method="post" accept-charset="utf-8">
                <input name="account" style="border-radius:4px;width: 250px" type="text" placeholder="请输入账号或电话号码" autocomplete="off" value="${name}">
                <input name="password" style="border-radius:4px;width: 250px" type="password" placeholder="请输入密码" autocomplete="off">
                <div class="verify">
                    <input name="check" type="text" placeholder="请输入验证码" autocomplete="off">
                    <span><img src="/frame/checkCode" alt="" onclick="changeCheckCode(this)"></span>
                    <script type="text/javascript">
                        //图片点击事件
                        function changeCheckCode(img) {
                            img.src="/frame/checkCode?"+new Date().getTime();
                        }
                    </script>
                </div>
                <div class="submit_btn">
                    <button type="submit" id="submit">登录</button>
                    <div class="auto_login">
                        <input type="checkbox" name="checkBox" class="checkbox">
                        <span>自动登录</span>
                    </div>
                </div>
            </form>
            <div class="reg">没有账户？<a href="/frame/intoregister">立即注册</a></div>
        </div>
    </div>
</section>
<!--引入尾部-->
<div style="margin-top: -20px"><%@include file="/WEB-INF/Modules/footer.jsp" %></div>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>