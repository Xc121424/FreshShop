<%--
  Created by IntelliJ IDEA.
  User: xiaoc
  Date: 2020/3/7
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/js/getParameter.js"></script>
<style>
    .categorys:hover .dropdown-menu{
display:block;
    }
    .myInfo:hover .dropdown-menu{
display:block;
    }
</style>
</head>
<body>
<script>
    $(function () {
        var tids = ${tid};
        $.ajax(
            {
                url: "/frame/findname",
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if (data != "false") {
                        var s = "欢迎回来  " + data;
                        $("#span_name").html(s);
                        $("#login_out").hide();
                    } else {
                        $("#login_in").hide();
                    }
                }
            })
        $.ajax(
            {
                url: "/frame/tag",
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    var lis;
                    if (tids == -1) {
                        lis = "<li class='nav-active' style='width: 86px;text-align: center'><a href='/frame/index' >首页</a></li>";
                    } else {
                        lis = "<li ><a href='/frame/index'>首页</a></li>";

                    }
                    if (tids == 0) {
                        lis = lis + "<li class='nav-active'><a href='/flower/flowerDetailListByinfos?currIndex=1'>全部鲜花</a></li>";
                    } else {
                        lis = lis + "<li ><a href='/flower/flowerDetailListByinfos?currIndex=1'>全部鲜花</a></li>";

                    }
                    for (var i = 0; i < data.length; i++) {
                        var z;
                        if (tids == i + 1) {
                            z = "<li class='nav-active'><a href='/flower/findflowerByType?tid=" + data[i].tid + "&currIndex=1'>" + data[i].tname + "</a></li>"
                        } else {
                            z = "<li><a href='/flower/findflowerByType?tid=" + data[i].tid + "&currIndex=1'>" + data[i].tname + "</a></li>"
                        }
                        lis += z;
                    }
                    $("#nav").html(lis);
                }
            });
    });

    function submitSearch() {
        var infos = $("#search").val();
        location.href = "/flower/flowerDetailListByinfos?infos=" + infos + "&currIndex=1";
        <%--$.ajax({--%>
        <%--    url:flower/flowerDetailListByinfos,--%>
        <%--    type:"post",--%>
        <%--    dataType: "json",--%>
        <%--    data: {"infos":infos, "currIndex":1},--%>
        <%--    success: function (data) {--%>
        <%--        &lt;%&ndash;alert("${name}")&ndash;%&gt;--%>
        <%--        window.location.href='intologin';--%>
        <%--    }--%>
        <%--})--%>
    }
</script>
<header id="header">
    <div class="top_banner">
        <img src="${pageContext.request.contextPath}/images/default_banner.jpg" alt="">
        <%--        <img src="${pageContext.request.contextPath}/images/top_banner.jpg" alt="">--%>
    </div>
    <div class="shortcut">
        <!-- 未登录状态  -->
        <div class="login_out" id="login_out">
            <a href="/frame/intologin">登录</a>
            <a href="/frame/intoregister">注册</a>
        </div>
        <!-- 登录状态  -->
        <div class="login" id="login_in">
                 <div class="categorys" style=" background-color: #FAFAFA;" >
                    <h4 class="categorys-title" style="margin:-2px 10px 0 20px;  font-size: 12px; color: #a1a1a1;" data-hover="dropdown" data-delay="0"  aria-expanded="false" >
                        <span class=" glyphicon glyphicon-user"></span> <span  id="span_name"> </span>  <span  class=" glyphicon glyphicon-menu-down "></span>
                    </h4>
                    <div class="dropdown-menu dropdown-cate " style="margin-top: -1px;width: 20px;text-align: center;">
                         <h4 ><a href="/frame/personInfo" style="width: 50px ;color: black">个人信息</a></h4>
                         <h4 ><a href="/frame/changePassword" style="width: 50px ;color: black">密码修改</a></h4>
                         <h4 ><a href="/myReceiver/shipAddress" style="width: 50px ;color:black">收货地址</a></h4>
                         <h4 ><a href="/favorite/intoFavorite?currIndex=1&pageSize=20" style="width: 50px ;color:black;margin-bottom: 10px" target="_blank">收藏夹</a></h4>
                    </div>
                </div>
            <a href="/myShop/intoShop?currentPage=1" class="collection" > 购物车</a>
            <a href="/myOrder/intoOrder" class="collection" style="margin-left: 10px">我的订单</a>
            <a href="/frame/exit" style="margin-left: 10px">退出</a>
        </div>
    </div>
    <div class="header_wrap" style="margin-top: 10px">
        <div class="topbar">
            <div class="logo">
                <a href="/"><img src="${pageContext.request.contextPath}/images/logo1.jpg" alt=""></a>
            </div>
            <div class="search">
                <input id="search" type="text" placeholder="请输入你想搜索的商品关键字" class="search_input" autocomplete="off"
                       value="${infos}">
                <a href="javascript:submitSearch();" class="search-button">搜索</a>
            </div>
            <div class="hottel">
                <div class="hot_pic">
                    <img src="${pageContext.request.contextPath}/images/hot_tel.jpg" alt="">
                </div>
                <div class="hot_tel">
                    <p class="hot_time">客服热线(9:00-6:00)</p>
                    <p class="hot_num">400-429-8080</p>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- 头部 end -->
<!-- 首页导航 -->
<nav class="common">
    <div class="container ">
                <div class="categorys ">
                    <h3 class="categorys-title" data-hover="dropdown" data-delay="0"  aria-expanded="false">
                        <a style="height: 50px" href="#"><span style="margin-top: 12px" class="pull-right glyphicon glyphicon-menu-down"></span><span style="margin-left: 10px">鲜花类型导购</span></a>
                    </h3>
                    <div class="dropdown-menu dropdown-cate " style="width: 220px;margin:-1px -20px">
<%--                        <h4><a href="/flower/">鲜花</a></h4>--%>
                        <ul class="cate-list list-inline">
                            <li><a href="/flower/flowerDetailListByinfos?infos=红玫瑰&currIndex=1">红玫瑰</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=蓝色妖姬&currIndex=1">蓝色妖姬</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=戴安娜&currIndex=1" target="_blank">戴安娜</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=相思梅&currIndex=1">相思梅</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=银叶菊&currIndex=1">银叶菊</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=石竹梅&currIndex=1">石竹梅</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=栀子叶&currIndex=1">栀子叶</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=香槟玫瑰&currIndex=1">香槟玫瑰</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=向日葵&currIndex=1">向日葵</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=桔梗&currIndex=1">桔梗</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=尤加利叶&currIndex=1">尤加利叶</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=百合&currIndex=1">百合</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=小熊&currIndex=1">小熊</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=白玫瑰&currIndex=1">白玫瑰</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=满天星&currIndex=1">满天星</a></li>
                            <li><a href="/flower/flowerDetailListByinfos?infos=勿忘我&currIndex=1">勿忘我</a></li>
                        </ul>

                    </div>
                </div>
<%--    <div class="dropdown">--%>
<%--        <div class="btn btn-default dropdown-toggle"  id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">--%>
<%--            Dropdown--%>
<%--            <span class="caret"></span>--%>
<%--        </div>--%>
<%--        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">--%>
<%--            <li><a href="#">Action</a></li>--%>
<%--            <li><a href="#">Another action</a></li>--%>
<%--            <li><a href="#">Something else here</a></li>--%>
<%--            <li role="separator" class="divider"></li>--%>
<%--            <li><a href="#">Separated link</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
        <ul class="nav" id="nav">

        </ul>
    </div>
</nav>
</body>
</html>
