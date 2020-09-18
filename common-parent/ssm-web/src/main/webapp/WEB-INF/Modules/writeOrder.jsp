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
    <title>网上花店-订单填写</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/writeOrder.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/framework/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>
<body>
<!--引入头部-->
<%@include file="/WEB-INF/Modules/header.jsp" %>
<section class="order-main" style="border-top:1px solid #E9ECF0;">
    <div class="order-container" id="form1">
        <!-- 收货人信息 -->
        <div class="order-item" style="position:relative;margin-top:24px;">
            <h3 class="order-item-hd">收货人信息</h3>
            <!-- 没有地址记录 -->
            <!-- 有地址记录 -->
            <div class="order-item-address-add" onclick="receiverAddrAddOrEditOpenWin(0)">
                    <span class="address-add" id="address_add">
                        新增收货地址
                    </span>
            </div>
            <div class="order-item-address-list">
                <div class="order-item-address-commom order-item-address-part" id="selectedAddressHtml"
                     style="display: block;">
                    <!-- order-item-address-isDefault 为默认地址 -->
                    <c:forEach items="${address}" var="i">
                        <c:if test="${i.state=='1'}">
                            <div class="order-item-address-li order-item-address-isChecked order-item-address-isDefault"
                                 data-addressid="${i.rid}">
                                <span class="order-item-address-checkbox checked" data-addressid="${i.rid}">
                                   ${i.rname}<img src="https://img02.hua.com/pc/Images/pc_order_addr_select.png" alt="">
                                </span>
                                <div class="order-item-address-info">

                                    <span class="order-item-address-name">${i.rname}</span>
                                    <span class="order-item-address-details">${i.provinces}${i.city}${i.county} ${i.addr}</span>
                                    <span class="order-item-address-tel">${i.rphone}</span>
                                    <span class="order-item-address-default">默认地址</span>
                                </div>
                                <div class="order-item-address-options">
                                    <span class="order-item-address-setdef"
                                          onclick="setDefaultAddress(${i.rid})">设为默认地址</span>
                                    <span class="order-item-address-modify"
                                          onclick="receiverAddrAddOrEditOpenWin(${i.rid})"><i
                                            class="glyphicon glyphicon-edit"></i>修改</span>
                                    <span class="order-item-address-delete" onclick="DeleteAddress(${i.rid})"> <i
                                            class="glyphicon glyphicon-trash"></i>删除</span>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                    <div class="order-item-address-expand">
                      <span class="address-expand" onclick="showAllAddrlist()">
                        显示全部地址 <i class="glyphicon glyphicon-chevron-down" style="font-size: 12px"></i>
                      </span>
                    </div>
                </div>
                <div class="order-item-address-commom order-item-address-all" id="allAddressListHtml"
                     style="display: none;">
                    <c:forEach items="${address}" var="i">
                        <c:if test="${i.state=='1'}">
                           <div class="order-item-address-li order-item-address-isChecked order-item-address-isDefault" data-addressid="${i.rid}">
                             <span class="order-item-address-checkbox checked" onclick="receiverAddrSelect(${i.rid})"
                                   data-addressid="${i.rid}">
                        </c:if>
                         <c:if test="${i.state=='0'}">
                           <div class="order-item-address-li" data-addressid="${i.rid}">
                              <span class="order-item-address-checkbox" onclick="receiverAddrSelect(${i.rid})"
                                    data-addressid="${i.rid}">
                         </c:if>
                                      ${i.rname}<img src="https://img02.hua.com/pc/Images/pc_order_addr_select.png">
                              </span>
                              <div class="order-item-address-info">
                                <span class="order-item-address-name">${i.rname}</span>
                                <span class="order-item-address-details">${i.provinces}${i.city}${i.county} ${i.addr}</span>
                                <span class="order-item-address-tel">${i.rphone}</span>
                                <span class="order-item-address-default">默认地址</span>
                            </div>

                            <div class="order-item-address-options">
                                <span class="order-item-address-setdef"
                                      onclick="setDefaultAddress(${i.rid})">设为默认地址</span>
                                <span class="order-item-address-modify"
                                      onclick="receiverAddrAddOrEditOpenWin( ${i.rid})"><i
                                        class="glyphicon glyphicon-edit"></i>修改</span>
                                <span class="order-item-address-delete" onclick="DeleteAddress( ${i.rid})"> <i
                                        class="glyphicon glyphicon-trash"></i>删除</span>

                            </div>
                        </div>
                    </c:forEach>

                    <div class="order-item-address-expand">
                        <span class="address-expand" onclick="onlyShowSelectAddr()">
                             收起地址 <i class="glyphicon glyphicon-chevron-up" style="font-size: 12px"></i>
                        </span>
                    </div>
                    </div>
                </div>
            </div>
            <!--       买家-->
            <div class="order-item">
                <h3 class="order-item-hd">订购人信息</h3>
                <div class="order-item-content " id="purchase_ipt">
                    <div class="order-item-li">
                        <label class="order-item-title">订购人姓名</label>
                        <input class="order-item-input" placeholder="请输入订购人姓名" id="realname" name="realname" type="text"
                               value="${user.username}" maxlength="15" autocomplete="off"
                               onblur="purchaserObj.onBlurName()">
                        <span class="order-item-wrong" id="verify_name" style="display: none;">
                    </span>
                    </div>
                    <div class="order-item-content-hastel" id="has_tel" style="display:block">
                        <div class="order-item-li">
                            <label class="order-item-title">订购人手机</label>
                            <input class="order-item-input" placeholder="请输入订购人手机号码" id="phone" name="phone" type="text"
                                   value="${user.tel}" maxlength="11" autocomplete="off"
                                   onblur="onBlurMobile()" onfocus="onFocusMobile()">
                            <!-- 手机号已注册提示 -->
                            <span class="order-item-wrong" id="verify_tel" style="display: none;"></span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 购物清单-->
            <div class="order-item order-item-border-bottom order-item-line">
                <h3 class="order-item-hd">核对购物清单</h3>
                <div class="order-item-product-list">
                    <c:forEach items="${shopList}" var="i">
                    <div class="order-item-product-li" style="color: #00F7DE">
                        <input type="hidden" value="${i.fid}">
                        <a href="/flower/flowerDetail?Fid=${i.fid}" target="_blank"  style="display: inline-block; width: 100%;">
                            <div class="order-item-product-pic">
                                <img src="${pageContext.request.contextPath}/${i.flowerDetail.flowerImage.image}"
                                     alt="${i.flowerDetail.remark}">
                            </div>
                            <div class="order-item-product-info">
                                <p class="order-item-product-name">${i.flowerDetail.remark}-${i.flowerDetail.materials}</p>
                                <div>
                                    <span class="order-item-product-price" data-itemcode="${i.sid}">${i.flowerDetail.vipFprice}</span>
                                    <span class="order-item-product-count">x${i.number}</span>
                                    <input type="hidden" value="${i.number}"></input>
                                </div>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
                <div class="order-item-footer">
                    <c:forEach items="${address}" var="i">
                    <c:if test="${i.state=='1'}">
                    <div class="order-item-footer-left">
                        <div class="order-item-footer-send">
                            <span class="send-title">配送至：</span>
                            <span id="receiver_addr">${i.provinces}${i.city}${i.county} ${i.addr}</span>
                        </div>
                        <div class="order-item-footer-receiver">
                            <span id="receiver_name" class="receiver-name">${i.rname}</span>
                            <span id="receiver_tel">${i.rphone}</span>
                        </div>
                    </div>
                    </c:if>
                    </c:forEach>
                    <div class="order-item-footer-right">
                        <div class="order-item-footer-price">
                            共<span id="pro_count" class="pro-count"></span>件商品，总商品金额：
                            <span id="pro_price" class="pro-price"></span>
                        </div>
                        <div class="order-item-footer-pay">
                            应付：<span class="pay-price " id="payMoney"></span>
                            <button class="pay-btn" id="pay_btn" onclick="paySubmit();">提交订单</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--    收货地址弹窗--%>
        <div class="layer" id="addr_layer" style="display: none;">
            <form id="form2">
                <div class="layer-shade" onclick="closeLayer()"></div>
                <div class="layer-content">
                    <div class="layer-content-close">
                        <%--                <span> <i class="iconfont iconfont-closed" onclick="receiverObj.closeLayer('#addr_layer')"></i></span>--%>
                        <span> <i class="glyphicon glyphicon-remove" onclick="closeLayer()"></i></span>
                    </div>
                    <div class="layer-content-title" id="addressOperTitle">新增收货地址</div>
                    <div class="order-item-li">
                        <label class="order-item-title">收货人</label>
                        <input class="order-item-input" placeholder="请输入收货人姓名" type="text" id="ToName" name="ToName"
                               maxlength="15" autocomplete="off" autofocus="">
                    </div>
                    <div class="order-item-li">
                        <label class="order-item-title">手机号码</label>
                        <input class="order-item-input" placeholder="请输入收货人手机号码" type="text" id="ToMobile"
                               name="ToMobile" maxlength="11" autocomplete="off">
                    </div>
                    <div class="order-item-li">
                        <label class="order-item-title">所在地区</label>
                        <select class="order-item-select" id="ToState" name="ToState"
                                onchange="doProvAndCityRelation()">
                            <option value="-1" id="choosePro">请选择省</option>
                        </select>
                        <select class="order-item-select" id="ToCity" name="ToCity"
                                onchange="doCityAndCountyRelation()">
                            <option value="-1" id="chooseCity">请选择城市</option>
                        </select>
                        <select class="order-item-select" id="ToArea" name="ToArea"
                                onchange="doCountyAndAddressRelation()">
                            <option value="-1" id="chooseCounty">请选择区/县</option>
                        </select>
                    </div>
                    <div class="order-item-li">
                        <label class="order-item-title">详细地址</label>
                        <div class="order-item-input-box">
                            <span class="order-item-addr-header" id="areaSelectShowId" data-areacode=""></span>
                            <input placeholder="请输入收货人详细地址" type="text" id="ToAddress" name="ToAddress" maxlength="50"
                                   autocomplete="120">
                        </div>
                    </div>
                    <div class="order-item-saveAddr">
                        <input type="hidden" name="AddressID" value="${rid}" id="AddressID">
                        <input type="hidden" name="State" value="0" id="State">
                        <button class="layer_comfire" onclick="receiverAddrAddOrEditSave()">保存并使用</button>
                        <button class="layer_cancel" onclick="closeLayer()">取消</button>
                    </div>
                </div>
            </form>
        </div>

</section>
<!--引入js-->
<script src="${pageContext.request.contextPath}/js/writeOrder.js"></script>
<script src="${pageContext.request.contextPath}/js/address.js"></script>
<!--引入尾部-->
<%@include file="/WEB-INF/Modules/footer.jsp" %>

</body>
</html>