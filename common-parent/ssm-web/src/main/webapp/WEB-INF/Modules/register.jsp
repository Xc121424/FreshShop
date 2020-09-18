<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/3/6
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>花仙子-会员注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <!--导入jquery-->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script language="JavaScript">

        function checkUsername() {
            var val = $("#username").val();
            var patern = /^[\u4E00-\u9FA5]{2,4}$/;
            var flag = patern.test(val);
            if (flag) {
                $("#username").css("border", "");
            } else {
                $("#username").css("border", "solid 1px red");
            }
            return flag;
        }

        function checkaccount() {
            var val = $("#account").val();
            var patern = /^\w{6,12}$/;
            var flag = patern.test(val);
            if (flag) {
                $("#account").css("border", "");
            } else {
                $("#account").css("border", "solid 1px red");
            }
            return flag;
        }

        function checkPassword() {
            var val = $("#password").val();
            var patern = /^\w{6,12}$/;
            var flag = patern.test(val);
            if (flag) {
                $("#password").css("border", "");
            } else {
                $("#password").css("border", "solid 1px red");
            }
            return flag;

        }

        function checkEmail() {
            var val = $("#email").val();
            var patern = /^\w+@\w+\.\w+$/;
            var flag = patern.test(val);
            if (flag) {
                $("#email").css("border", "");
            } else {
                $("#email").css("border", "solid 1px red");
            }
            return flag;

        }

        function checkTelephone() {
            var val = $("#telephone").val();
            var patern = /^[1][3,4,5,7,8][0-9]{9}$/;
            var flag = patern.test(val);
            if (flag) {
                $("#telephone").css("border", "");
            } else {
                $("#telephone").css("border", "solid 1px red");
            }
            return flag;
        }

        function findAccount() {
            $.ajax({
                type: "post",
                url: "/frame/findAccount",
                dataType: "json",
                data: JSON.stringify(user),
                contentType: "application/json",
                success: function (data) {
                    <%--alert("${name}")--%>
                    window.location.href = 'intologin';
                }
            })
        }

        function findCheck() {
            var s = "<%=session.getAttribute("RANDOMVALIDATECODEKEY")%>";
            var val = $("#check").val();
            if (s != val) {
                $("#error").val("验证码错误")
                return false;
            }
            return true;
        }

        $(function () {
            $("#registerForm").submit(function () {


                if (findCheck() && checkaccount() && checkPassword() && checkEmail() && checkUsername() && checkTelephone()) {
                    //提交表单数据
                    var user = {
                        account: $("#account").val(),
                        username: $("#username").val(),
                        password: $("#password").val(),
                        email: $("#email").val(),
                        tel: $("#telephone").val(),
                        sex: $("#sex").val()
                    };
                    console.log(user);
                    $.ajax({
                        type: "post",
                        url: "/frame/register",
                        dataType: "json",
                        data: JSON.stringify(user),
                        contentType: "application/json",
                        success: function (data) {
                            window.location.href = 'intologin';
                        }
                    })
                }
                //不提交表单，因为提交表单为同步请求，而ajax为异步
                return false;
            });
            // checkaccount;
            $("#account").blur(checkaccount);
            $("#account").blur(function () {
                $.ajax({
                    type: "post",
                    url: "/frame/findAccount",
                    dataType: "json",
                    data: {"account": $("#account").val()},
                    success: function (data) {
                        if (data != true) {
                            $("#error").html("该账号已被注册");
                            $("#account").val("");
                            $("#account").css("border", "solid 1px red");
                        }
                    }
                })
            });
            $("#username").blur(checkUsername);
            $("#password").blur(checkPassword);
            $("#email").blur(checkEmail);
            $("#telephone").blur(checkTelephone);
            $("#telephone").blur(function () {
                $.ajax({
                    type: "post",
                    url: "/frame/findAccount",
                    dataType: "json",
                    data: {"account": $("#telephone").val()},
                    success: function (data) {
                        if (data != true) {
                            $("#error").val("该号码已被注册");
                            $("#telephone").val("");
                            $("#telephone").css("border", "solid 1px red");
                        }
                    }
                })
            });
        });
    </script>
</head>
<body>
<!--引入头部-->
<%@include file="/WEB-INF/Modules/header.jsp" %>
<!-- 头部 end -->
<div class="rg_layout">
    <div class="rg_form clearfix">
        <div class="rg_form_left">
            <p>会员注册</p>
            <p>VIP REGISTER</p>
        </div>
        <div class="rg_form_center">

            <!--注册表单-->
            <form id="registerForm" action="user">
                <!--提交处理请求的标识符-->
                <!--						<input type="hidden" name="action" value="register">-->
                <table style="margin-top: 25px;">
                    <tr>
                        <td class="td_left">
                            <label for="account">账号</label>
                        </td>
                        <td class="td_right">
                            <input type="text" nullable="no" id="account" name="account" placeholder="请输入6~12位的账号">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="password">密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" nullable="no" id="password" name="password" placeholder="请输入6~12位的密码">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="email">Email</label>
                        </td>
                        <td class="td_right">
                            <input type="text" id="email" name="email" placeholder="请输入Email">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="username">姓名</label>
                        </td>
                        <td class="td_right">
                            <input type="text" nullable="no" id="username" name="username" placeholder="请输入真实姓名">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="telephone">手机号</label>
                        </td>
                        <td class="td_right">
                            <input type="text" nullable="no" id="telephone" name="telephone" placeholder="请输入您的手机号">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="sex">性别</label>
                        </td>
                        <td class="td_right gender">
                            <input type="radio" id="sex" name="sex" value="1" checked> 男
                            <input type="radio" name="sex" value="0"> 女
                        </td>
                    </tr>
                    <%--                    <tr>--%>
                    <%--                        <td class="td_left">--%>
                    <%--                            <label for="birthday">出生日期</label>--%>
                    <%--                        </td>--%>
                    <%--                        <td class="td_right">--%>
                    <%--                            <input type="date" id="birthday" name="birthday" placeholder="年/月/日">--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <tr>
                        <td class="td_left">
                            <label for="check">验证码</label>
                        </td>
                        <td class="td_right check">
                            <input type="text" id="check" name="check" class="check">
                            <img src="checkCode" height="32px" alt="" onclick="changeCheckCode(this)">
                            <script type="text/javascript">
                                //图片点击事件
                                function changeCheckCode(img) {
                                    img.src = "checkCode?" + new Date().getTime();
                                }
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                        </td>
                        <td class="td_right check">
                            <input type="submit" class="submit" style="margin-left: 50px" value="注册">
                        </td>
                    </tr>
                </table>
            </form>
            <input id="error" style="color:red;text-align: center;margin-left: 120px" readonly="readonly"/>
        </div>
        <div class="rg_form_right">
            <p>
                已有账号？
                <a href="/frame/intologin">立即登录</a>
            </p>
        </div>
    </div>
</div>
<!--引入尾部-->
<div style="margin-top: -20px">
    <%@include file="/WEB-INF/Modules/footer.jsp" %>
</div>


</body>
</html>