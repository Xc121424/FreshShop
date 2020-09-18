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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shipAddress.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/writeOrder.css">
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

<div class="right-layout" style="margin-top: 50px">
    <div class="wrap">
       <div class="tabmenu">
            <ul class="tab pngFix">
                <li class="active" style="height: 37px">
                    <a href="javascript:void(0)">地址列表</a>
                </li>
            </ul>
            <a href="javascript:void(0)" class="ncm-btn ncm-btn-orange" nc_type="dialog" dialog_title="新增地址" dialog_id="my_address_edit"  dialog_width="550" title="新增地址" onclick="openLayer()">
                <i class="glyphicon glyphicon-pencil"></i>新增地址
            </a>
        </div>
      <table class="ncm-default-table">
        <thead>
        <tr>
            <th class="w80">收货人</th>
            <th class="w150">所在地区</th>
            <th class="tl">街道地址</th>
            <th class="w120">手机号码</th>
            <th class="w110">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${address}" var="i">
        <tr class="bd-line">
            <td>${i.rname}</td>
            <td>${i.provinces}&nbsp;${i.city}&nbsp;${i.county}</td>
            <td class="tl"><!--<em class="delivery"></em>-->${i.addr}</td>
            <td><p><i class="icon-phone"></i>${i.rphone}</p></td>
            <td class="ncm-table-handle">
                <span>
                    <a href="javascript:void(0)" class="btn-blue" dialog_id="my_address_edit" dialog_width="550" dialog_title="编辑地址" nc_type="dialog"  onclick="receiverAddrAddOrEditOpenWin(${i.rid},'编辑地址')"><i class="glyphicon glyphicon-edit"></i>
                      <p>编辑</p>
                    </a>
                </span>
                 <span>
                      <a href="javascript:void(0)" class="btn-red" onclick="DeleteAddress(${i.rid})"><i class="glyphicon glyphicon-trash"></i>
                       <p>删除</p>
                      </a>
                 </span>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
</div>
<div class="layer" id="addr_layer" style="display: none;">
    <div class="layer-shade" onclick="closeLayer()"></div>
    <div class="layer-content">
        <div class="layer-content-close">
            <%--                <span> <i class="iconfont iconfont-closed" onclick="receiverObj.closeLayer('#addr_layer')"></i></span>--%>
            <span> <i class="glyphicon glyphicon-remove" onclick="closeLayer()"></i></span>
        </div>
        <div class="layer-content-title" id="addressOperTitle">新增地址</div>
        <div class="order-item-li">
            <label class="order-item-title">收货人</label>
            <input class="order-item-input" placeholder="请输入收货人姓名" type="text" id="ToName" name="ToName" maxlength="15" autocomplete="off" autofocus="">
        </div>
        <div class="order-item-li">
            <label class="order-item-title">手机号码</label>
            <input class="order-item-input" placeholder="请输入收货人手机号码" type="text" id="ToMobile" name="ToMobile" maxlength="11" autocomplete="off">
        </div>
        <div class="order-item-li">
            <label class="order-item-title">所在地区</label>
            <select class="order-item-select" id="ToState" name="ToState" onchange="doProvAndCityRelation()"><option value="-1"  id="choosePro">请选择省</option>
            </select>
            <select class="order-item-select" id="ToCity" name="ToCity" onchange="doCityAndCountyRelation()"><option value="-1" id="chooseCity">请选择城市</option></select>
            <select class="order-item-select" id="ToArea" name="ToArea" onchange="doCountyAndAddressRelation()"><option value="-1" id="chooseCounty">请选择区/县</option></select>
        </div>
        <div class="order-item-li">
            <label class="order-item-title">详细地址</label>
            <div class="order-item-input-box">
                <span class="order-item-addr-header" id="areaSelectShowId" data-areacode=""></span>
                <input placeholder="请输入收货人详细地址" type="text" id="ToAddress" name="ToAddress" maxlength="50" autocomplete="120" >
            </div>
        </div>
        <div class="order-item-saveAddr">
            <input type="hidden" name="AddressID" value="${rid}" id="AddressID">
            <input type="hidden" name="State" value="0" id="State">
            <button class="layer_comfire" onclick="receiverAddrAddOrEditSave()">保存并使用</button>
            <button class="layer_cancel" onclick="closeLayer()">取消</button>
        </div>
    </div>
</div>
<!--引入尾部-->
<div style="margin-top: 50px"><%@include file="/WEB-INF/Modules/footer.jsp" %></div>

</body>
<script src="${pageContext.request.contextPath}/js/writeOrder.js"></script>
<script src="${pageContext.request.contextPath}/js/address.js"></script>
</html>