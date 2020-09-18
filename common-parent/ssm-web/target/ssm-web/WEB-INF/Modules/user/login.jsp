<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/2/18
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>
    <a href="find?id=41" ><button>点击</button></a>
    <a href="/order/find?user_id=41" ><button>注解解决参数名不一致</button></a>
    <form action="/order/requestBody" method="post">
        用户编号：<input type="text" name="id"/></br>
        用户生日:<input type="text" name="birthday" value="1997/12/14"/></br>
        <button>提交</button>
    </form>
    <a href="/order/save?birthday=1997/12/04"><button>StringToDate</button></a>
    <a href="/order/pathVariable/1"><button>pathVariable</button></a>
</h2>
</body>
</html>
