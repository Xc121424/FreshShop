<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
    <meta name="renderer" content="webkit">
    <!--国产浏览器高速模式-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="穷在闹市" />
    <!-- 作者 -->
    <meta name="revised" content="穷在闹市.v3, 2019/05/01" />
    <!-- 定义页面的最新版本 -->
    <meta name="description" content="网站简介" />
    <!-- 网站简介 -->
    <meta name="keywords" content="搜索关键字，以半角英文逗号隔开" />
    <title>穷在闹市出品</title>

    <!-- 公共样式 开始 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/framework/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <!-- 滚动条插件 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery.mCustomScrollbar.css">
    <script src="${pageContext.request.contextPath}/framework/jquery-ui-1.10.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/framework/jquery.mousewheel.min.js"></script>
    <script src="${pageContext.request.contextPath}/framework/jquery.mCustomScrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/framework/cframe.js"></script><!-- 仅供所有子页面使用 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- 公共样式 结束 -->

    <style>
        .layui-form-label{
            width: 100px;
        }
        .layui-input-block{
            margin-left: 130px;
        }
        .layui-form{
            margin-right: 30%;
        }
    </style>

</head>

<body>
<div class="container" style="width:800px;margin-left: 200px">

    <form class="layui-form" style="position: relative;top:50px" action="${pageContext.request.contextPath}/updateGoodsServlet" method="post">
        <!--  隐藏域 提交id-->


        <div class="form-group">
            <label for="store ">商品名称</label>
            <input type="text" class="form-control"  required lay-verify="required|ZHCheck" id="store " name="store"   value="${flowerDetailTypeList[0].flowerDetail.remark}" readonly="readonly"   placeholder="请输入商品名称" />
        </div>

        <div class="form-group">
            <label for="price">商品价原价</label>
            <input type="text" class="form-control" <%--required lay-verify="required|PriceCheck"--%> id="price" name="price"   value="${flowerDetailTypeList[0].flowerDetail.fprice}" placeholder="请输入商品价格" />

        </div>
        <div class="form-group">
            <label for="vipprice">商品会员价</label>
            <input type="text" class="form-control" <%--required lay-verify="required|PriceCheck"--%> id="vipprice" name="vipprice"   value="${flowerDetailTypeList[0].flowerDetail.vipFprice}" placeholder="请输入商品价格" />

        </div>

        <div class="form-group">
            <label >商品图片</label>
            <img src="${pageContext.request.contextPath}/${flowerDetailTypeList[0].flowerDetail.flowerImage.image}"
                 style="width: 55px; height: 55px;margin-left: 100px" >
<%--            <input type="text" class="form-control" &lt;%&ndash;required lay-verify="required|ZHCheck"&ndash;%&gt; id="unit" name="unit"  value="${pageContext.request.contextPath}/${flowerDetailTypeList[0].flowerDetail.flowerImage.image}"   placeholder="请输入商品单位" />--%>
        </div>

        <div class="form-group">
            <label for="provider">商品类型：</label>
<%--            <select name="provider" class="form-control" id="provider">--%>
<%--                <c:forEach items="${list}" var="a" varStatus="s">--%>
<%--                        <option value="${a.provider}">${a.provider}</option>--%>
<%--            </c:forEach>--%>
<%--            </select>--%>
            <div id="provider">
<%--                <c:forEach items="${flowerDetailTypeList}" var="i">--%>
                    <c:if test="${flowerDetailTypeList[0].tid==1}">
                        <input type="checkbox" name="provider" value="1" style="size: 10px" checked/>爱情鲜花
                    </c:if>
                    <c:if test="${{flowerDetailTypeList[0].tid.tid!=1}">
                        <input type="checkbox" name="provider" value="1" />爱情鲜花
                    </c:if>
                    <c:if test="${{flowerDetailTypeList[0].tid.tid==2}">
                        <input type="checkbox" name="provider" value="2" checked/>商务用花
                    </c:if>
                    <c:if test="${{flowerDetailTypeList[0].tid.tid!=2}">
                        <input type="checkbox" name="provider" value="2" />商务用花
                    </c:if>
                    <c:if test="${{flowerDetailTypeList[0].tid.tid==3}">
                        <input type="checkbox" name="provider" value="3" checked/>生日鲜花
                    </c:if>
                    <c:if test="${i.tid!=3}">
                        <input type="checkbox" name="provider" value="3" />生日鲜花
                    </c:if>
                    <c:if test="${i.tid==4}">
                        <input type="checkbox" name="provider" value="4" checked/>开业花篮
                    </c:if>
                    <c:if test="${i.tid!=4}">
                        <input type="checkbox" name="provider" value="4" />开业花篮
                    </c:if>
                    <c:if test="${i.tid==5}">
                        <input type="checkbox" name="provider" value="5" checked/>问候长辈
                    </c:if>
                    <c:if test="${i.tid!=5}">
                        <input type="checkbox" name="provider" value="5" />问候长辈
                    </c:if>
<%--                </c:forEach>--%>
            </div>
        </div>

        <div class="form-group">
            <label for="type">商品种类：</label>
            <select name="type" class="form-control" id="type">
                <option value="汽水">汽水</option>
                <option value="奶制品">奶制品</option>
                <option value="果汁">果汁</option>
                <option value="凉茶">凉茶</option>
                <option value="零食">零食</option>
                <option value="矿泉水">矿泉水</option>
            </select>
        </div>

        <div class="form-group">
            <input type="hidden"     id="storeId " name="storeId"   value="${goods.storeId}" />
        </div>


        <div class="form-group" style="text-align: center">
            <input id="submit" class="btn btn-primary" type="submit" lay-submit lay-filter="submitBut" value="添加" />
            <input class="btn btn-default" href="${pageContext.request.contextPath}/findGoodsServlet?storeId=${goods.storeId}" type="reset" value="重置" />
            <a class="btn btn-default "   href="${pageContext.request.contextPath}/FindGoodsByPageServlet">返回</a>
        </div>
    </form>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
</body>
</html>