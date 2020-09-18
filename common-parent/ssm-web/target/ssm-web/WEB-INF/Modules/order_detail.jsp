<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/3/10
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>网上花店-购物车</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myshop.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/framework/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>
<body>
<!--引入头部-->
<%@include file="/WEB-INF/Modules/header.jsp" %>
<div class="containers">
    <div class="cart-panel">
        <ul class="hd">
            <li class="product" style="width: 532px">商品名称</li>
            <li class="order-price ">订购单价</li>
            <li class="num " style="margin-left: 20px">购买数量</li>
            <li class="order-price" style="margin-left: 20px" >总价</li>
        </ul>
    </div>
    <div class="bd">
        <c:forEach items="${orderDetailList}" var="i">
            <ul class="order-list" style="height: 119px;">
                <li class="img-box"><a href="/flower/flowerDetail?Fid=${i.fid}" target="_blank"><img
                        style="width: 88px; height: 88px"
                        src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}"></a></li>
                <li class="product" style="width: 432px">
                    <a href="/flower/flowerDetail?Fid=${i.fid}" target="_blank">
                        <span class="product-title" style="line-height:40px;">${i.flowerDetail.flowerLanguage}</span>
                        <span class="feature"></span>
                    </a>
                </li>
                <li class="order-price" >
                    <span class="price-sign">¥</span>
                    <span class="price-num">
                            ${i.flowerDetail.vipFprice}
                    </span>
                </li>
                <li class="order-price" style="margin-left: 20px">
                    <span class="price-sign">x</span>
                    <span class="price-num">
                            ${i.famount}
                    </span>
                </li>
                <li class="order-price" style="margin-left: 20px">
                    <span class="price-sign">¥</span>
                    <span class="price-num">
                            ${i.flowerDetail.vipFprice*i.famount}
                    </span>
                </li>
            </ul>
        </c:forEach>
    </div>
    <hr>

</div>
<!--引入js-->
<script src="${pageContext.request.contextPath}/js/myshop.js"></script>
<!--引入尾部-->
<%@include file="/WEB-INF/Modules/footer.jsp" %>

</body>
</html>