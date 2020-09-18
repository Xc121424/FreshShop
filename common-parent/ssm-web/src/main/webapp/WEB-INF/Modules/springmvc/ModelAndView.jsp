<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/2/19
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored = "false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${list}<br>
${requestScope.list}<br>
<c:forEach items="${list}" var="str">
    ${str }
</c:forEach>
</body>
</html>
