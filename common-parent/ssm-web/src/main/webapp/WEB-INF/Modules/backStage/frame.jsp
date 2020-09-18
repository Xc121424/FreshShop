﻿<%--
  Created by IntelliJ IDEA.
  User: 36549
  Date: 2019-06-17
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
    <title>Manage System</title>

    <!-- 公共样式 开始 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="bookmark" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/framework/jquery-1.11.3.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/framework/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/framework/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.mCustomScrollbar.css">
   <!-- 仅供所有子页面使用 -->
    <!-- 公共样式 结束 -->

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/frameStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/framework/frame.js" ></script>

</head>

<body>
<!-- 左侧菜单 - 开始 -->
<div class="frameMenu" style="height: 800px">
    <div class="logo">
      <a onclick="menuCAClick('/manageFlower/flowerList?infos=&CurrentPage=1',this)"> <img src="${pageContext.request.contextPath}/images/logo.jpg" /></a>
        <div class="logoText">
            <h1>花店后台管理系统</h1>
            <p>Manage System</p>
        </div>
    </div>
    <div class="menu">
        <ul>
<%--            <li>--%>
<%--                <a class="menuFA" href="javascript:void(0)" onclick="menuCAClick('main_topServlet',this)"><i class=" iconfont icon-shouye left"></i>首页</a>--%>
<%--            </li>--%>
            <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-liuliangyunpingtaitubiao03 left"></i>鲜花管理<i class="iconfont icon-dajiantouyou right"></i></a>
                <dl>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('/manageFlower/flowerList?infos=&CurrentPage=1',this)">上架鲜花列表</a></dt>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/GoodsListServlet',this)">添加鲜花</a></dt>
                    <dt><a href="javascript:void(0)" onclick="menuCAClick('/manageFlower/dropflowerList?infos=&CurrentPage=1',this)">下架鲜花列表</a></dt>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/FindAgent_GoodByPageServlet',this)">代理商品列表</a></dt>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/agentOrderServlet',this)">订单列表</a></dt>--%>

                </dl>
            </li>
            <li>
    <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>会员管理<i class="iconfont icon-dajiantouyou right"></i></a>
    <dl>
        <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/FindGoodsByPageServlet',this)">会员列表</a></dt>
        <%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/FindGoodssoldoutByPageServlet',this)">下架商品库</a></dt>--%>
        <%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/addsGoodsServlet',this)">添加商品</a></dt>--%>
    </dl>
</li>
            <li>
        <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-yunying left"></i>订单管理<i class="iconfont icon-dajiantouyou right"></i></a>
        <dl>
            <dt><a href="javascript:void(0)" onclick="menuCAClick('FindStoreByPageServlet',this)">订单列表</a></dt>
            <%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/reportForm/report.jsp',this)">出入库盈利</a></dt>--%>
            <%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('FindOrderByPageServlet',this)">商品订单表</a></dt>--%>
        </dl>
    </li>
<%--            <li>--%>
<%--                <a class="menuFA" href="javascript:void(0)"><i class="icon iconfont icon-yonghu left"></i>员工表<i class="iconfont icon-dajiantouyou right"></i></a>--%>
<%--                <dl>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/FindEmpByPageServlet',this)">员工列表</a></dt>--%>
<%--                </dl>--%>
<%--            </li>--%>

<%--            <li>--%>
<%--                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-shangpin left"></i>供应商管理<i class="iconfont icon-dajiantouyou right"></i></a>--%>
<%--                <dl>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/FindSupplierByPageServlet',this)">供应商信息</a></dt>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('${pageContext.request.contextPath}/supplier_add.jsp',this)">添加供应商</a></dt>--%>
<%--                </dl>--%>
<%--            </li>--%>

<%--            <li>--%>
<%--                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-icon left"></i>打印模板<i class="iconfont icon-dajiantouyou right"></i></a>--%>
<%--                <dl>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/print/outPrintData.jsp',this)">入库单打印模版</a></dt>--%>
<%--                    <dt><a href="javascript:void(0)" onclick="menuCAClick('tgls/print/inPrintData.jsp',this)">出库单打印模版</a></dt>--%>
<%--                </dl>--%>
<%--            </li>--%>
           <%-- <li>
                <a class="menuFA" href="javascript:void(0)"><i class="iconfont icon-caiwu left"></i>财务管理</a>
            </li>--%>

        </ul>
    </div>
</div>
<!-- 左侧菜单 - 结束 -->

<div class="main">
    <!-- 头部栏 - 开始 -->
    <div class="frameTop">
        <img class="jt" src="${pageContext.request.contextPath}/images/top_jt.png"/>
        <div class="topMenu">
            <ul>
<%--                <li><a href="javascript:void(0)" onclick="menuCAClick('modify_password.jsp',this)"><i class="iconfont icon-xiugaimima"></i>修改密码</a></li>--%>
                <li><a href="/manager/exit"><i class="iconfont icon-084tuichu"></i>注销</a></li>
            </ul>
        </div>
    </div>
    <!-- 头部栏 - 结束 -->

    <!-- 核心区域 - 开始 -->
    <div class="frameMain">
        <div class="title" id="frameMainTitle">
            <span><i class="iconfont icon-xianshiqi"></i>上架鲜花列表</span>
        </div>
        <div class="con">
            <iframe id="mainIframe" src="/manageFlower/flowerList?infos=&CurrentPage=1" scrolling="auto"></iframe>
        </div>
    </div>
    <!-- 核心区域 - 结束 -->
</div>
</body>
<script src="${pageContext.request.contextPath}/framework/jquery-ui-1.10.4.min.js"></script>
<script src="${pageContext.request.contextPath}/framework/jquery.mousewheel.min.js"></script>
<script src="${pageContext.request.contextPath}/framework/jquery.mCustomScrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/framework/cframe.js"></script>
</html>
