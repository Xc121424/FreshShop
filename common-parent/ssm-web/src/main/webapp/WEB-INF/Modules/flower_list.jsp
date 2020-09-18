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
    <title>花仙子-${flowerType.tname}</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/framework/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.table2excel.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
<!-- 排行榜 start-->
<section id="content">
    <section class="hemai_jx">
        <div class="jx_top">
            <div class="jx_tit">
                <img src="${pageContext.request.contextPath}/images/icon_5.jpg" alt="">
                <span>${flowerType.tname}</span>
            </div>
        </div>
        <div class="jx_content">
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <div class="row">
                        <c:forEach items="${flowerType.flowerDetailTypeList}" var="flowerDetailType">
                            <div class="col-md-4">
                                <a href="/flower/flowerDetail?Fid=${flowerDetailType.flowerDetail.fid}">
                                    <img src="${pageContext.request.contextPath}/${flowerDetailType.flowerDetail.flowerImage.image}"
                                         alt="${flowerDetailType.flowerDetail.remark}">
                                    <div class="has_border">
                                        <h3>${flowerDetailType.flowerDetail.remark}</h3>
                                        <h4 style="font-size: 12px; display: block; max-width: 350px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${flowerDetailType.flowerDetail.materials}</h4>
                                        <div class="price">
                                           <span style="text-decoration: line-through;float: left;width: 120px;">市场价:￥${flowerDetailType.flowerDetail.fprice}</span>
                                           <span style="color: red;margin-left: 20px;float: left;width: 120px;">会员价:<em>￥</em><strong>${flowerDetailType.flowerDetail.vipFprice}</strong></span>

                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </div>
        <div style="float: left">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${currIndex == 1}">
                        <li><a class="btn btn-default btn-lg disabled"  href="/flower/findflowerByType?currIndex=1&tid=${flowerType.tid}'">首页</a></li>
                        <li><a href='/flower/findflowerByType?currIndex=${currIndex-1}&tid=${flowerType.tid}' class="btn btn-default btn-lg disabled" >
                    </c:if>
                    <c:if test="${currIndex!= 1}">
                        <li><a class="btn btn-default btn-lg" href="">首页</a></li>
                        <li><a href='/flower/findflowerByType?currIndex=${currIndex-1}&tid=${flowerType.tid}' class="btn btn-default btn-lg ">
                    </c:if>
                    <span aria-hidden="true">&laquo;</span>
                    </a></li>

                    <c:forEach var="i" begin="1" end="${pageNumber}">
                        <c:if test="${currIndex== i}">
                        <li> <a href="/flower/findflowerByType?currIndex=${i}&tid=${flowerType.tid}" class="btn btn-primary btn-lg disabled" >${i}</a></li>
                        </c:if>
                        <c:if test="${currIndex!= i}">
                            <li> <a href="/flower/findflowerByType?currIndex=${i}&tid=${flowerType.tid}" class="btn btn-default btn-lg">${i}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currIndex == pageNumber}">
                    <li> <a disabled="disabled" href="/flower/findflowerByType?currIndex=${currIndex+1}&tid=${flowerType.tid}" class="btn btn-default btn-lg disabled"><span aria-hidden="true">&raquo;</span>
                        <li><a href="/flower/findflowerByType?currIndex=${pageNumber}&tid=${flowerType.tid}"  class="btn btn-default btn-lg disabled">末页
                        </c:if>
                        <c:if test="${currIndex!= pageNumber}">

                    <li><a href="/flower/findflowerByType?currIndex=${currIndex+1}&tid=${flowerType.tid}" class="btn btn-default btn-lg"><span aria-hidden="true">&raquo;</span>
                            <li><a href="/flower/findflowerByType?currIndex=${pageNumber}&tid=${flowerType.tid}"  class="btn btn-default btn-lg">末页
                        </c:if>
                        </a>
                    </li>


                </ul>
            </nav>
        </div>
    </section>
</section>
<!-- 排行榜 end-->

<!--引入尾部-->
<%@include file="/WEB-INF/Modules/footer.jsp" %>
<!--导入布局js，共享header和footer-->

</body>
</html>