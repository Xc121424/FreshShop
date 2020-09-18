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
    <title>花仙子-我的收藏</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myfavorite.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/framework/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.table2excel.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.table2excel.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .tab-content .row > div {
            margin-top: 16px;
        }

        .tab-content {
            margin-bottom: 36px;
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>
<body>
<!--引入头部-->
<%@include file="/WEB-INF/Modules/header.jsp" %>

<div class="pull-left w970 l230">
    <div class="box-border member-r">

        <div class="attention-wrap">
            <div class="title">
                <h3>我的收藏</h3>
            </div>
        </div>

        <div class="attention-all">
            <div class="all-l">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="selectall" onclick="checkselect(this);"> 全选
                    </label>
                </div>
                <!--<a id="addShoppingCar" class="btn btn-default btn-sm btn-m"><span class="ico ico-cart-m"></span>加入购物车</a>-->
                <a id="cancledAttention" style="cursor:pointer">取消收藏</a>
                <input type="hidden" name="method" id="method" value="cancled">
            </div>
        </div>
        <div class="attention-list">
            <c:forEach items="${pageBean.list}" var="favorite">
                <ul class="attention-item">
                    <li class="checkbox">
                        <label>
                            <input type="checkbox" class="singleChecked" name="product_code" onclick="change()"
                                   value="${favorite.flowerDetail.fid}">
                        </label>
                    </li>
                    <li class="img-box">
                        <a href="/flower/flowerDetail?Fid=${favorite.flowerDetail.fid}">
                            <img width="150"
                                 src="${pageContext.request.contextPath}/${favorite.flowerDetail.flowerImage.image}"
                                 alt="${favorite.flowerDetail.remark}"></a>
                    </li>
                    <li class="product-title">
                        <p>
                            <a href="/flower/flowerDetail?Fid=${favorite.flowerDetail.fid}">${favorite.flowerDetail.remark}</a>
                        </p>
                        <span class="cc">${favorite.flowerDetail.materials}</span>
                    </li>
                    <li class="price" style="text-decoration:line-through;color: black">
                        <span class="price-sign">¥</span>
                        <span class="price-num">${favorite.flowerDetail.fprice}</span>
                    </li>
                    <li class="price" style="margin-left: 50px; ">
                        <span class="price-sign">¥</span>
                        <span class="price-num">${favorite.flowerDetail.vipFprice}</span>
                    </li>
                    <li class="operate">
                        <a href="#" onclick="addShop(${favorite.flowerDetail.fid})"
                           class="btn btn-default btn-sm btn-m"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</a>
                        <a href="#" onclick="cancelFavorite(${favorite.flowerDetail.fid});">取消收藏</a>
                    </li>
                </ul>
            </c:forEach>

        </div>

    </div>
    <div style="float: left">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pageBean.currentPage == 1}">
                <li><a class="btn btn-default btn-lg disabled"
                       href="/favorite/intoFavorite?currIndex=1&pageSize=${pageBean.rows}'">首页</a></li>
                <li><a href='/favorite/intoFavorite?currIndex=${pageBean.currentPage-1}&pageSize=${pageBean.rows}'
                       class="btn btn-default btn-lg disabled">
                    </c:if>
                    <c:if test="${pageBean.currentPage!= 1}">
                <li><a class="btn btn-default btn-lg" href="">首页</a></li>
                <li><a href='/favorite/intoFavorite?currIndex=${pageBean.currentPage-1}&pageSize=${pageBean.rows}'
                       class="btn btn-default btn-lg ">
                    </c:if>
                    <span aria-hidden="true">&laquo;</span>
                </a></li>

                <c:forEach var="i" begin="1" end="${pageBean.totalPage}">
                    <c:if test="${pageBean.currentPage== i}">
                        <li><a href="/favorite/intoFavorite?currIndex=${i}&pageSize=${pageBean.rows}"
                               class="btn btn-primary btn-lg disabled">${i}</a></li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!= i}">
                        <li><a href="/favorite/intoFavorite?currIndex=${i}&pageSize=${pageBean.rows}"
                               class="btn btn-default btn-lg">${i}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageBean.currentPage == pageBean.totalPage}">
                <li><a disabled="disabled"
                       href="/favorite/intoFavorite?currIndex=${pageBean.currentPage+1}&pageSize=${pageBean.rows}"
                       class="btn btn-default btn-lg disabled"><span aria-hidden="true">&raquo;</span>
                <li><a href="/favorite/intoFavorite?currIndex=${pageBean.totalPage}&pageSize=${pageBean.rows}"
                       class="btn btn-default btn-lg disabled">末页
                    </c:if>
                    <c:if test="${pageBean.currentPage!= pageBean.totalPage}">

                <li><a href="/favorite/intoFavorite?currIndex=${pageBean.currentPage+1}&pageSize=${pageBean.rows}"
                       class="btn btn-default btn-lg"><span aria-hidden="true">&raquo;</span>
                <li><a href="/favorite/intoFavorite?currIndex=${pageBean.totalPage}&pageSize=${pageBean.rows}"
                       class="btn btn-default btn-lg">末页
                    </c:if>
                </a>
                </li>


            </ul>
        </nav>
    </div>
</div>
<!--引入尾部-->
<%@include file="/WEB-INF/Modules/footer.jsp" %>
<!--导入布局js，共享header和footer-->
<script src="${pageContext.request.contextPath}/js/myfavorite.js"></script>
</body>
</html>