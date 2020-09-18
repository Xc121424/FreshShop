<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/3/5
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>花仙子-首页</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--引入头部-->
<script src="${pageContext.request.contextPath}/js/getParameter.js"></script>
<script>
    $(function () {
    })

</script>
<!-- 头部 start -->
<%@include file="/WEB-INF/Modules/header.jsp" %>
<!-- 头部 end -->

<!-- banner start-->
<section id="banner" style="margin-top: -10px">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <a href="/flower/flowerDetail?Fid=37"><img
                        src="${pageContext.request.contextPath}/images/top_image1.png" alt=""></a>
            </div>
            <div class="item">
                <a href="/flower/flowerDetail?Fid=38"> <img
                        src="${pageContext.request.contextPath}/images/top_image2.png" alt=""></a>
            </div>
            <div class="item">
                <a href="/flower/flowerDetail?Fid=39"> <img
                        src="${pageContext.request.contextPath}/images/top_image3.png" alt=""></a>
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>
<!-- banner end-->
<section id="content">

    <section class="hemai_jx">
        <div class="jx_top">
            <div class="jx_tit">
                <img src="${pageContext.request.contextPath}/images/icon_5.jpg" alt="">
                <span>精选商品</span>
            </div>
            <!-- Nav tabs -->
            <ul class="jx_tabs" role="tablist">
                <li role="presentation" class="active">
                    <span><a href="#popularity" aria-controls="popularity" role="tab" data-toggle="tab">收藏榜</a></span>
                </li>
                <li role="presentation">
                    <span><a href="#newest" aria-controls="newest" role="tab" data-toggle="tab">购物车榜</a></span>
                </li>
                <li role="presentation">
                    <span><a href="#theme" aria-controls="theme" role="tab" data-toggle="tab">购买榜</a></span>
                </li>
            </ul>
        </div>
        <div class="jx_content">
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="popularity">
                    <div class="row">
                        <c:forEach items="${favoriteTop}" var="i">
                            <div class="col-md-3">
                            <a href="/flower/flowerDetail?Fid=${i.fid}">
                                <img src="${pageContext.request.contextPath}/${i.flowerImage.image}" alt="">
                                <div class="has_border">
                                    <h3>${i.remark}</h3>
                                    <h4 style="font-size: 12px; display: block; max-width: 250px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${i.materials}</h4>
                                    <div class="price" >
                                        <div style="text-decoration: line-through;float: left;width: 120px;">
                                           <span > 原价：￥${i.fprice}</span>
                                        </div>
                                        <div style="color: red;margin-left: 20px;float: left;width: 120px;">
                                           <span style=" font-family: arial,Verdana,Arial;">现价：￥${i.vipFprice}</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div></c:forEach>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="newest">
                    <div class="row">
                        <c:forEach items="${shopTop}" var="i">
                            <div class="col-md-3">
                                <a href="/flower/flowerDetail?Fid=${i.fid}">
                                    <img src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}" alt="">
                                    <div class="has_border">
                                        <h3>${i.flowerDetail.remark}</h3>
                                        <h4 style="font-size: 12px; display: block; max-width: 250px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${i.flowerDetail.materials}</h4>
                                        <div class="price" >
                                            <div style="text-decoration: line-through;float: left;width: 120px;">
                                                <span > 原价：￥${i.flowerDetail.fprice}</span>
                                            </div>
                                            <div style="color: red;margin-left: 20px;float: left;width: 120px;">
                                                <span style=" font-family: arial,Verdana,Arial;">现价：￥${i.flowerDetail.vipFprice}</span>
                                            </div>
                                        </div>
                                        </div>

                                </a>
                            </div></c:forEach>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="theme">
                    <div class="row">
                        <c:forEach items="${buyTop}" var="i">
                            <div class="col-md-3">
                                <a href="/flower/flowerDetail?Fid=${i.fid}">
                                    <img src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}" alt="">
                                    <div class="has_border">
                                        <h3>${i.flowerDetail.remark}</h3>
                                        <h4 style="font-size: 12px; display: block; max-width: 250px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${i.flowerDetail.materials}</h4>
                                        <div class="price" >
                                            <div style="text-decoration: line-through;float: left;width: 120px;">
                                                <span > 原价：￥${i.flowerDetail.fprice}</span>
                                            </div>
                                            <div style="color: red;margin-left: 20px;float: left;width: 120px;">
                                                <span style=" font-family: arial,Verdana,Arial;">现价：￥${i.flowerDetail.vipFprice}</span>
                                            </div>
                                        </div>
                                    </div>

                                </a>
                            </div></c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="hemai_jx">
        <div class="jx_top">
            <h3><a href="/flower/findflowerByType?tid=5&currIndex=1" target="_blank">长辈鲜花</a><span>赠 · 父母/恩师/长辈</span></h3>
        </div>
        <div class="heima_gn">
            <div class="guonei_l">
              <a href="/flower/findflowerByType?tid=5&currIndex=1">  <img src="${pageContext.request.contextPath}/images/elder/top.png"  height="656" alt=""></a>
            </div>
            <div class="guone_r">
<%--            <div class="fl-products">--%>
                <div class="row">

                    <c:forEach items="${flowerType.flowerDetailTypeList}" var="i">
                        <div class="col-md-4">
                            <a href="/flower/flowerDetail?Fid=${i.flowerDetail.fid}">
                                <img src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}" alt="${i.flowerDetail.materials}">
                                <div class="product-content">
                                    <p class="product-title">送长辈 · ${i.flowerDetail.remark}</p>
                                    <p class="product-price">
                                        <span class="price-sign">¥</span>
                                        <span class="price-num" data-pp="9010736">${i.flowerDetail.vipFprice}</span>
                                    </p>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
<%--                    <c:forEach items="${flowerType.flowerDetailTypeList}" var="i">--%>
<%--                        <div class="col-md-4">--%>
<%--                            <div class="fl-products-item">--%>
<%--                                <a href="/flower/flowerDetail?Fid=${i.fid}" target="_blank">--%>
<%--                                    <div class="img-box" href="/product/9010966.html">--%>
<%--                                        <img data-original="https://img01.hua.com/uploadpic/newpic/9010736.jpg_220x240.jpg" height="240" width="220" src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}" style="display: inline;">--%>
<%--                                    </div>--%>
<%--                                <div class="product-content">--%>
<%--                                    <p class="product-title">送长辈 · ${i.flowerDetail.remark}</p>--%>
<%--                                    <p class="product-price">--%>
<%--                                        <span class="price-sign">¥</span>--%>
<%--                                        <span class="price-num" data-pp="9010736">${i.flowerDetail.vipFprice}</span>--%>
<%--                                    </p>--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
            </div>
        </div>
        </div>
    </section>

    <section class="hemai_jx">
        <div class="jx_top">
            <h3><a href="/flower/findflowerByType?tid=1&currIndex=1" target="_blank">爱情鲜花</a><span>送 · 让你怦然心动的人</span></h3>
        </div>
        <div class="heima_gn">
            <div class="guonei_l">
                <a href="/flower/findflowerByType?tid=1&currIndex=1">  <img src="${pageContext.request.contextPath}/images/love/home_floor_lover.png"  height="656" alt=""></a>
            </div>
            <div class="guone_r">
                <%--            <div class="fl-products">--%>
                <div class="row">

                    <c:forEach items="${loveFlower.flowerDetailTypeList}" var="i">
                        <div class="col-md-4">
                            <a href="/flower/flowerDetail?Fid=${i.flowerDetail.fid}">
                                <img src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}" alt="${i.flowerDetail.materials}">
                                <div class="product-content">
                                    <p class="product-title">爱情 · ${i.flowerDetail.remark}</p>
                                    <p class="product-price">
                                        <span class="price-sign">¥</span>
                                        <span class="price-num" data-pp="9010736">${i.flowerDetail.vipFprice}</span>
                                    </p>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                    <%--                    <c:forEach items="${flowerType.flowerDetailTypeList}" var="i">--%>
                    <%--                        <div class="col-md-4">--%>
                    <%--                            <div class="fl-products-item">--%>
                    <%--                                <a href="/flower/flowerDetail?Fid=${i.fid}" target="_blank">--%>
                    <%--                                    <div class="img-box" href="/product/9010966.html">--%>
                    <%--                                        <img data-original="https://img01.hua.com/uploadpic/newpic/9010736.jpg_220x240.jpg" height="240" width="220" src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}" style="display: inline;">--%>
                    <%--                                    </div>--%>
                    <%--                                <div class="product-content">--%>
                    <%--                                    <p class="product-title">送长辈 · ${i.flowerDetail.remark}</p>--%>
                    <%--                                    <p class="product-price">--%>
                    <%--                                        <span class="price-sign">¥</span>--%>
                    <%--                                        <span class="price-num" data-pp="9010736">${i.flowerDetail.vipFprice}</span>--%>
                    <%--                                    </p>--%>
                    <%--                                </div>--%>
                    <%--                            </a>--%>
                    <%--                        </div>--%>
                    <%--                    </c:forEach>--%>
                    <%--                </div>--%>
                </div>
            </div>
        </div>
    </section>
    <!-- 境外游 end-->
</section>
<!-- 旅游 end-->
<!--导入底部-->
<%@include file="/WEB-INF/Modules/footer.jsp" %>

</body>
</html>
