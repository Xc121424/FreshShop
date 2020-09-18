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
    <title>花仙子-密码修改</title>
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
            <input type="hidden" value="${user.password}" id="user_password">
            <!--注册表单-->
            <form id="personInfoForm" action="user">
                <!--提交处理请求的标识符-->
                <!--						<input type="hidden" name="action" value="register">-->
                <table style="margin-top: 25px;">
                    <tr>
                        <td class="td_left">
                            <label for="password">原密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="password" name="password" >
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="password1">新密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="password1" name="password1" >
                        </td>
                    </tr>
                    <tr>
                        <td class="td_left">
                            <label for="password2">确认密码</label>
                        </td>
                        <td class="td_right">
                            <input type="password" id="password2" name="password2" >
                        </td>
                    </tr>

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
<script language="JavaScript">
    function checkPassword() {
        var val = $("#password").val();
        var patern = /^\w{6,12}$/;
        var flag = patern.test(val);
        if (flag) {
            $("#password1").css("border", "");
        } else {
            $("#password1").css("border", "solid 1px red");
        }
        return flag;

    }
    function checkNewPassword() {
        var val = $("#password1").val();
        var patern = /^\w{6,12}$/;
        var flag = patern.test(val);
        if (flag) {
            $("#password1").css("border", "");
        } else {
            $("#password1").css("border", "solid 1px red");
        }
        return flag;

    }
    function checkAgainNewPassword() {
        var val = $("#password2").val();
        var patern = /^\w{6,12}$/;
        var flag = patern.test(val);
        if (flag) {
            $("#password2").css("border", "");
        } else {
            $("#password2").css("border", "solid 1px red");
        }
        return flag;

    }
    $(function () {
        $("#password").blur(checkPassword)
        $("#password").blur(function () {
                var password = $("#password").val();
                var user_password = $("#user_password").val();
                    if (password==user_password) {
                        $("#password").css("border", "");
                        $("#error").val("")
                    } else {
                        $("#password").css("border", "solid 1px red");
                        $("#error").val("原密码输入错误！")
                    }
            }
        )
        $("#password1").blur(checkNewPassword)
        $("#password1").blur(function () {
                var password = $("#password1").val();
                var user_password = $("#user_password").val();
                if (password==user_password) {
                    $("#password1").css("border", "solid 1px red")
                    $("#error").val("新密码与原始密码一致！请重新输入")
                } else {
                    $("#password1").css("border", "");
                    $("#error").val("")
                }
            }
        )
        $("#password2").blur(checkAgainNewPassword)
        $("#password2").blur(function () {
                var password1 = $("#password1").val();
                var password2= $("#password2").val();
                if (password1!=password2) {
                    $("#password2").css("border", "solid 1px red")
                    $("#error").val("新密码与确认密码不一致！请重新输入")
                } else {
                    $("#password2").css("border", "");
                    $("#error").val("")
                }
            }
        );
        function findCheck() {
            var s = "<%=session.getAttribute("RANDOMVALIDATECODEKEY")%>";
            var val = $("#check").val();
            if (s != val) {
                $("#error").val("验证码错误")
                return false;
            }
            return true;
        }
        $("#personInfoForm").submit(function () {
            if (findCheck()&&checkPassword() && checkNewPassword() && checkAgainNewPassword()) {
                //提交表单数据
                $.ajax({
                    type: "post",
                    url: "/frame/updatePassword",
                    dataType: "json",
                    data: {password:$("#password1").val()},
                    contentType: "application/json",
                    success: function (data) {
                        window.location.href = '/frame/intologin';
                    }
                })
            }
            //不提交表单，因为提交表单为同步请求，而ajax为异步
            return false;
        });
    });
</script>
</body>
</html>