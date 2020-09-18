<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/3/6
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>花仙子-个人信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <!--导入jquery-->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
<!--引入头部-->
<%@include file="/WEB-INF/Modules/header.jsp" %>
<!-- 头部 end -->
<div class="rg_layout">
    <div class="rg_form clearfix">
        <div class="rg_form_center" style="margin-left: 250px;margin-top: 50px">
            <!--注册表单-->
            <form id="personInfoForm" action="user">
                <!--提交处理请求的标识符-->
                <!--						<input type="hidden" name="action" value="register">-->
                <table style="margin-top: 25px;">
                    <tr>
                        <td class="td_left">
                            <label for="account">账号</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="account" name="account" value="${user.account}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="password">密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="password" name="password" value="${user.password}" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="emails">Email</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="emails" name="emails" value="${user.email}">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="username">姓名</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="username" name="username" value="${user.username}">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="telephone">手机号</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="telephone" name="telephone" value="${user.tel}">
                            <input type="hidden" value="${user.tel}">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="sex">性别</label>
                        </td>
                        <td class="td_right gender">
                      <c:if test="${user.sex==1}">
                          <input type="radio" id="sex" name="sex" value="1" checked> 男
                          <input type="radio" name="sex" style="margin-left: 50px" value="0"> 女
                      </c:if>
                            <c:if test="${user.sex==0}">
                                <input type="radio" id="sex" name="sex" value="1"> 男
                                <input type="radio" name="sex" value="0" style="margin-left: 50px" checked> 女
                            </c:if>
                        </td>
                    </tr>
                </table>
                <div style="float: left">
                    <input type="submit" class="submit" style="margin-left: 70px;color:white;border-radius: 4px;background-color:#2fb36a;width: 100px;line-height: 32px;height: 32px;" value="修改">
                    <input type="reset" class="submit" onclick="resets()" style="margin-left: 50px;border-radius: 4px ; color:black;width: 100px;line-height: 32px;height: 32px;" value="重置">
                </div>
            </form>
            <input id="error" style="color:red;text-align: center;margin-left: 120px;margin-top: 20px" readonly="readonly"/>
        </div>

    </div>
</div>
<!--引入尾部-->
<div style="margin-top: -20px">
    <%@include file="/WEB-INF/Modules/footer.jsp" %>
</div>
<script src="${pageContext.request.contextPath}/js/personInfo.js"></script>
</body>
</html>