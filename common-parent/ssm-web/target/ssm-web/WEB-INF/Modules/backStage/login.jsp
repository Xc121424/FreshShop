<%--
  Created by IntelliJ IDEA.
  User: 36549
  Date: 2019/5/7
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/component.css" />
    <!--[if IE]>
    <script src="js/html5.js"></script>
        <-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="j${pageContext.request.contextPath}/s/bootstrap.min.js"></script>
    <script type="text/javascript"></script>

    <script>
        function refreshCode() {
            var vcode=document.getElementById("vcode");
            vcode.src="/frame/checkCode?time="+new Date().getTime();
        }
    </script>
</head>
<body>
<div class="container demo-1" style="width: 100%;margin: 0px;padding: 0px">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">

                <form style="position: relative;top:40px " action="/manager/managerlogin" method="post">

                    <div class="form-group">
                        <label for="user">用户名：</label>
                        <input type="text" name="username" class="form-control" id="user" placeholder="请输入用户名"/>
                    </div>

                    <div class="form-group">
                        <label for="password">密码：</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码"/>
                    </div>

<%--                    <div class="form-group">--%>
<%--                        <label for="address">登陆身份：</label>--%>
<%--                        <select name="type" class="form-control" id="address">--%>
<%--                                <option value="1">管理员</option>--%>
<%--                                <option value="0">经销商</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>

                    <div class="form-inline">
                        <label for="vcode">验证码：</label>
                        <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
                        &nbsp;&nbsp;&nbsp;<a href="javascript:refreshCode()">
                            <img src="/frame/checkCode" title="看不清点击刷新" id="vcode"/>
                        </a>
                    </div>
                    <hr/>
                    <div class="form-group" style="text-align: center;">
                        <input class="btn btn btn-primary" type="submit" value="登录">&nbsp;&nbsp;&nbsp;

<%--                        <a class="btn btn-default" type="button"  href="/agent_Register.jsp">注册</a>--%>
                    </div>
                </form>
                <div class="alert alert-warning alert-dismissible" style="padding:0px;background-color: transparent ;border: 0;position: relative;top:70px;left:60px" role="alert">
                    <strong style="font-size: 20px;position: relative;top:-20px">${error}</strong>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/TweenLite.min.js"></script>
<script src="${pageContext.request.contextPath}/js/EasePack.min.js"></script>
<script src="${pageContext.request.contextPath}/js/rAF.js"></script>
<script src="${pageContext.request.contextPath}/js/demo-1.js"></script>
</body>
</html>
