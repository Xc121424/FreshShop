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
    <title>网上花店-收货地址</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <%--    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/framework/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.table2excel.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.table2excel.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>
<body>
<!--引入头部-->
<div >
    <%@include file="/WEB-INF/Modules/header.jsp" %>
</div>
<div class="pull-left w970 l230" style="margin-bottom: 50px">
    <div class="box-border member-r">
        <div class="order-wrap">
            <div class="title">
                <h3>我的订单</h3>
            </div>

            <!-- 订单列表 -->
            <div class="order-panel">
                <div class="hd">
                    <ul class="order-title">
                        <li class="number">订单编号</li>
                        <li class="consignee">收货人</li>
                        <li class="order-price">订单金额</li>
                        <li class="date">配送时间</li>
                        <li class="state">
                            <select class="form-control input-sm" id="zt" onchange="DoSelectZT()">
                                <c:if test="${zt=='-1'||zt==null}">
                                    <option value="-1" selected>全部状态</option>
                                    <option value="10">待付款</option>
                                    <option value="20">已付款</option>
                                    <option value="30">待配送</option>
                                    <option value="40">配送中</option>
                                    <option value="50">已完成</option>
                                </c:if>
                                <c:if test="${zt=='10'}">
                                    <option value="-1" >全部状态</option>
                                    <option value="10" selected>待付款</option>
                                    <option value="20">已付款</option>
                                    <option value="30">待配送</option>
                                    <option value="40">配送中</option>
                                    <option value="50">已完成</option>
                                </c:if>
                                <c:if test="${zt=='20'}">
                                    <option value="-1" >全部状态</option>
                                    <option value="10" >待付款</option>
                                    <option value="20" selected>已付款</option>
                                    <option value="30">待配送</option>
                                    <option value="40">配送中</option>
                                    <option value="50">已完成</option>
                                </c:if>
                                <c:if test="${zt=='30'}">
                                    <option value="-1" >全部状态</option>
                                    <option value="10" >待付款</option>
                                    <option value="20" >已付款</option>
                                    <option value="30" selected>待配送</option>
                                    <option value="40">配送中</option>
                                    <option value="50">已完成</option>
                                </c:if>
                                <c:if test="${zt=='40'}">
                                    <option value="-1" >全部状态</option>
                                    <option value="10" >待付款</option>
                                    <option value="20" >已付款</option>
                                    <option value="30">待配送</option>
                                    <option value="40" selected>配送中</option>
                                    <option value="50">已完成</option>
                                </c:if>
                                <c:if test="${zt=='50'}">
                                    <option value="-1" >全部状态</option>
                                    <option value="10" >待付款</option>
                                    <option value="20" >已付款</option>
                                    <option value="30">待配送</option>
                                    <option value="40">配送中</option>
                                    <option value="50" selected>已完成</option>
                                </c:if>

                            </select>
                        </li>
                        <li class="operate">操作</li>
                    </ul>
                </div>
                <div class="bd">
                    <c:forEach items="${orderList}" var="i">
                    <ul class="order-list">
                        <li class="img-box">
                            <a href="/myOrder/orderDetail?orderid=${i.orid}"><img src="${pageContext.request.contextPath}/${i.orderDetailList[0].flowerDetail.flowerImage.image}" height="56" width="50"></a>
                        </li>
                        <li class="number"><a href="/myOrder/orderDetail?orderid=${i.orid}">${i.orid}</a></li>
                        <li class="consignee">${i.receiver.rname}</li>
                        <li class="order-price">
                            <span class="price-sign">¥</span>
                            <span class="price-num">${i.orprice}</span>
                        </li>
                        <li class="date"><div>${i.receiver.provinces}${i.receiver.city}${i.receiver.county}</div>
                            <div>${i.receiver.addr}</div>
                        </li>
                        <c:if test="${i.status=='10'}">
                            <li class="state">待付款</li>
                        </c:if>
                        <c:if test="${i.status=='20'}">
                            <li class="state">已付款</li>
                        </c:if>
                        <c:if test="${i.status=='30'}">
                            <li class="state">已取消</li>
                        </c:if>
                        <c:if test="${i.status=='10'}">
                        <li class="operate">
                            <a href="/myOrder/orderDetail?orderid=${i.orid}">查看</a><span>|</span><a href="javascript:OrderOper(${i.orid});"> 取消 </a>
                            <a href="/myOrder/goAlipay?orderId=${i.orid}" class="btn btn-primary btn-sm">付款</a>
                            </c:if>
                        <li class="operate" style="margin-top: 13px">
                            <c:if test="${i.status!='10'}">
                                <a href="/myOrder/orderDetail?orderid=${i.orid}">查看</a><span>|</span><a href="javascript:void(0);" onclick="OrderOper(${i.orid})"> 取消 </a>
                            </c:if>
                        </li>
                    </ul>
                    </c:forEach>
                </div>

                <div class="digg">

                </div>
            </div>
            <!-- 订单列表 End -->
        </div>
    </div>
</div>

<!--引入尾部-->
<div style="margin-top: 50px"><%@include file="/WEB-INF/Modules/footer.jsp" %></div>

</body>
<script src="${pageContext.request.contextPath}/js/writeOrder.js"></script>
<script src="${pageContext.request.contextPath}/js/address.js"></script>
</html>