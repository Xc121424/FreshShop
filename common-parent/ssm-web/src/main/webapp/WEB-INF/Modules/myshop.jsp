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
            <li class="selecter"><input type="checkbox" id="topCheckbox"></li>
            <li class="product">商品名称</li>
            <li class="market-price ">市场价</li>
            <li class="order-price">订购价</li>
            <li class="num ">数量</li>
            <li class="operate">操作</li>
        </ul>
    </div>
    <div class="bd">
        <c:forEach items="${pageBean.list}" var="i">
            <ul class="order-list" style="height: 119px">
                <li class="selecter">
                        <%--                    <i class="icon-select "></i>--%>
                    <input type="checkbox" name="productCode" value="${i.fid}" style="margin-top: 40px"
                           onclick="flowerSelect()">
                    <input type="hidden" value="${i.flowerDetail.vipFprice}">

                </li>
                <li class="img-box"><a href="/flower/flowerDetail?Fid=${i.fid}" target="_blank"><img
                        style="width: 88px; height: 88px"
                        src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}"></a></li>
                <li class="product">
                    <a href="/flower/flowerDetail?Fid=${i.fid}" target="_blank">
                        <span class="product-title" style="line-height:40px;">${i.flowerDetail.flowerLanguage}</span>
                        <span class="feature"></span>
                    </a>
                </li>

                <li class="market-price">
                    <span class="price-sign">¥</span>
                    <span class="price-num">
                            ${i.flowerDetail.fprice}
                    </span>
                </li>
                <li class="order-price">
                    <span class="price-sign">¥</span>
                    <span class="price-num">
                            ${i.flowerDetail.vipFprice}
                    </span>
                    <input type="hidden" name="jrPrice" value="${i.flowerDetail.vipFprice}">
                </li>
                <li class="num">
                    <div class="input-num">
                        <input type="hidden" name="Fids" value="${i.fid}"/>
                        <a onclick="numMinus(this);" class="btn btn-default disabled" name="1"><i
                                class="ico ico-minus"></i></a>
                        <input type="text" onchange="numChange(this)" class="form-control input-sm" name="cpsl"
                               style="text-align: center;width: 45px" value="${i.number}" maxlength="3"/>

                        <a onclick="numAdd(this)" class="btn btn-default" name="123"><i class="ico ico-add"></i></a>
                    </div>
                </li>
                <li class="operate" style="margin-top: 10px"><a href="/myShop/delShop?Fid=${i.fid}"
                                                                style="padding-left: 5px">删除</a><br>
                        <%--                                            <a onclick="favorite(${i.fid})" style="margin-top: 20px;padding-left: 5px">收藏</a>--%>
                </li>
            </ul>
        </c:forEach>
    </div>
    <hr>

</div>
<div class="set-bar">
    <div class="set-info">
        <div class="set-stat">
            应付金额:
            <div class="price">
                <span class="price-sign">¥</span>
                <span class="price-num" id="totalMoney">0.00</span>
            </div>
        </div>
    </div>
    <button class="mybtn mybtn-primary mybtn-lg" type="button" id="jiesuan">去结算</button>
</div>
<!--引入js-->
<script src="${pageContext.request.contextPath}/js/myshop.js"></script>
<!--引入尾部-->
<%@include file="/WEB-INF/Modules/footer.jsp" %>

</body>
</html>