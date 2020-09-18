<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/3/11
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>花仙子-鲜花详情</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/route-detail.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>

<body>
<!--引入头部-->
<%@include file="/WEB-INF/Modules/header.jsp" %>

<!-- 详情 start -->
<input id="Fid" class="hidden" value="${flowerDetail.fid}"></input>
<div class="wrap">
<%--    <div class="bread_box">--%>
<%--        <a href="/flower/findflowerByType?tid=${tid}&currIndex=1">${tname}</a><span> &gt;</span>--%>
<%--        <a href="/flower/flowerDetail?Fid=${flowerDetail.fid}">${flowerDetail.remark}</a>--%>
<%--    </div>--%>
    <div class="prosum_box">
        <dt class="prosum_left">

            <img alt="" class="big_img" src="${pageContext.request.contextPath}/${flowerDetail.flowerImage.image}">

        </dt>
        <div class="prosum_right">
            <p class="pros_title">${flowerDetail.remark}</p>
            <%--            <p class="hot">花语：${flowerDetail.flowerLanguage}</p>--%>
            <div class="pros_other">

                <p> 材料 :${flowerDetail.materials}</p>
                <p> 包装 :${flowerDetail.packaging}</p>
                <p> 花语 :${flowerDetail.flowerLanguage}</p>
                <%--                <p>地址 ： 传智播客黑马程序员</p>--%>
            </div>
            <div class="pros_price">
                <p class="price" style="margin-bottom: 17px">
                    <span style="text-decoration: line-through;font-size: 16px; font-style: normal;">原价：¥${flowerDetail.fprice}</span>
                    <span style="color: red;margin-left: 20px;font-size: 16px">现价：¥${flowerDetail.vipFprice}</span></p>
                <p class="collect" style="margin-top: 20px">
                    <a class="btn btn-default " style="border-color: #ff6a00 ;color: #ff6a00;width: 120px" id="shop"><i
                            class="glyphicon glyphicon-shopping-cart"></i>加入购物车</a>
                    <a class="btn btn-info " style="margin-left: 10px;width: 120px" id="buy" href="/myOrder/intoWriteOrder?Fid=${flowerDetail.fid}"><i
                            class="glyphicon glyphicon-yen" style="margin-top: 2px"></i>立即购买</a>
                    <a class="btn btn-danger" style="margin-left: 10px;width: 120px" id="favorite"><i
                            style="margin-top: 2px" class="glyphicon glyphicon-heart-empty"></i>点击收藏</a>

                    <a class="btn already " style="margin-left: 10px;width: 120px" id="favorited"><i
                            style="margin-top: 2px" class="glyphicon glyphicon-heart"></i>已收藏</a>
                    <span id="favoriteNumber">已收藏${flowerDetail.favoriteNumber}次</span>
                </p>
            </div>
        </div>
    </div>
</div>
<!-- 详情 end -->

<!--引入头部-->
<%@include file="/WEB-INF/Modules/footer.jsp" %>
</body>
<script>
    $(function () {
        $.ajax({
            url: "/favorite/isFavorited",
            type: "post",
            data: {"Fid": $("#Fid").val()},
            dataType: "json",
            success: function (data) {
                if (data) {

                    $("#favorite").hide();
                } else {

                    $("#favorited").hide();
                }

            }
        });
        $("#favorited").click(function () {
            $.ajax({
                url: "/favorite/cancelFavorite",
                type: "post",
                data: {Fid: $("#Fid").val()},
                dataType: "json",
                success: function (data) {
                    $("#favorited").hide();
                    $("#favorite").show();
                    $("#favoriteNumber").html("已收藏" + data + "次");
                }
            })
        });
        $("#favorite").click(function () {
            $.ajax({
                    url: "/favorite/favorite",
                    type: "post",
                    data: {Fid: $("#Fid").val()},
                    dataType: "json",
                    success: function (data) {

                        $("#favoriteNumber").html("已收藏" + data + "次");
                        $("#favorite").hide();
                        $("#favorited").show();
                    }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                        //查看错误信息
                        alert(1)
                        alert(errorThrown);
                    }
                }
            )
        })
        $("#shop").click(function () {
            $.ajax({
                    url: "/myShop/addShop",
                    type: "post",
                    data: {"Fid": $("#Fid").val()},
                    dataType: "json",
                    success: function (data) {

                        if (data ==1) {
                            var r=confirm("加入购物车成功！是否查看购物车？")
                            if (r == true) {
                                window.location.href = '/myShop/intoShop?currentPage=1'
                            }

                        }
                    }
                }
            )
        })
    });
</script>
</html>