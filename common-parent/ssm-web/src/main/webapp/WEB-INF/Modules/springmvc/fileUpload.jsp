<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/2/23
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/springmvc/fileUpload" method="post" enctype="multipart/form-data">
    图片名：<input type="text" name="image"><br>
    文件：<input type="file" name="fileUpload"><br>
<%--  <button >提交</button>--%>
<input type="submit" value="提交">
</form>

</body>
</html>
