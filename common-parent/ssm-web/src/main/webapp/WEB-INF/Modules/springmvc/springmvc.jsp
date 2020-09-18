<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/2/19
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
    $(function(){
        $("#ajax").click(function () {

            $.ajax({
                type:"post",
                url:"testAjax",
                dataType:"json",
                success:function (data) {
                    alert(data);
                }
            })
alert("11")
        });
        $("#ajax2").click(function () {

            $.ajax({
                type:"post",
                url:"testAjax2",
                dataType:"json",
                success:function (data) {
                    alert(data);
                }
            })

        }
        )
    })
</script>
<body>
<a href="returnvoid">测试void</a><br>
<a href="testModelAndView">测试返回ModelAndView</a><br>
<a href="testForward">测试springMvc请求转发</a><br>
<a href="testRedirect">测试springMvc重定向</a><br>
<input type="button" value="异步请求" id="ajax"/><br>
<input type="button" value="异步请求(@ResopnseBody)" id="ajax2"/><br>
<a href="intoCustomerException">customerException</a>
</body>
</html>
