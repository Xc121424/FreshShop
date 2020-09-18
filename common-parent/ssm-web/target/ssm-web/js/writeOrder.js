function closeLayer() {
    $("#addr_layer").attr("style", "display: none;");
    $('#form2')[0].reset();
}

function receiverAddrAddOrEditSave() {
    var receiver = {
        provinces: $("#ToState option:selected").text(),
        rid: $("#AddressID").val(),
        // uuid: $("#UserID").val(),
        city: $("#ToCity option:selected").text(),
        county: $("#ToArea option:selected").text(),
        rphone: $("#ToMobile").val(),
        rname: $("#ToName").val(),
        addr: $("#ToAddress").val(),
        state: $("#State").val()
    };
    $.ajax({
            type: "post",
            url: "/myReceiver/updateOrSaveRecevier",
            datatype: "json",
            data: JSON.stringify(receiver),
            contentType: "application/json",
            success: function (data) {
                window.location.reload();
            }

        }
    )
}

function showAllAddrlist() {
    $("#allAddressListHtml").attr("style", "display: block;");
    $("#selectedAddressHtml").attr("style", "display: none;")
}

function setDefaultAddress(addressid) {
    $.ajax({
        type: "post",
        url: "/myReceiver/setDefaultAddress?rid=" + addressid,
        datatype: "json",
        success: function (data) {
            window.location.reload();
        }

    })
}

function DeleteAddress(addressid) {
    $.ajax({
        type: "post",
        url: "/myReceiver/deleteAddress?rid=" + addressid,
        datatype: "json",
        success: function (data) {
            window.location.reload();
        }

    })
}

function onlyShowSelectAddr() {
    $("#allAddressListHtml").attr("style", "display: none;");
    $("#selectedAddressHtml").attr("style", "display: block;")
}

function receiverAddrSelect(addressid) {
    $("#allAddressListHtml").children().each(function () {
        var i = $(this).attr("data-addressid");
        if (i == addressid) {
            $(this).addClass("order-item-address-isChecked");
            $(this).children().first().addClass("checked");
            if ($("#selectedAddressHtml").children().first().attr("data-addressid") != addressid) {
                $("#selectedAddressHtml").children().first().remove();
                $("#selectedAddressHtml").prepend($(this).prop("outerHTML"));
                var receiver_addr=$(this).children("div[class='order-item-address-info']").children("span[class='order-item-address-details']").text();
                var receiver_name=$(this).children("div[class='order-item-address-info']").children("span[class='order-item-address-name']").text();
                var receiver_tel=$(this).children("div[class='order-item-address-info']").children("span[class='order-item-address-tel']").text();
                $("#receiver_addr").text(receiver_addr);
                $("#receiver_name").text(receiver_name);
                $("#receiver_tel").text(receiver_tel);

            }
        } else {
            $(this).removeClass("order-item-address-isChecked");
            $(this).children().first().removeClass("checked")
        }
    });

}

function paySubmit() {
    var datas = new Array();
    $("div[class='order-item-product-list']").children().each(function (i) {
        datas[i] = $(this).children("input").val();
    });
    // 总金额
    datas.push($("#payMoney").text());
    var s = $("span[class='order-item-address-checkbox checked']").attr("data-addressid");
    // 收货地址
    datas.push(s);
    $.ajax({
            type: "post",
            url: "/myOrder/createOrder",
            datatype: "json",
            data: JSON.stringify(datas),
            contentType: "application/json",
            success: function (data) {
                window.location.href="/myOrder/goAlipay?orderId="+data;
            }

        }
    )
}

$(function () {
    $("div[class^='order-item-address-li']").mouseenter(function () {
        $(this).children("div[class='order-item-address-options']").prop("style", "display:inline-block");
    });
    $("div[class^='order-item-address-li']").mouseleave(function () {
        $(this).children("div[class='order-item-address-options']").prop("style", "display:none");
    });
    $("div[class^='order-item-product-li']").mouseenter(function () {
        $(this).children().children("div[class='order-item-product-info']").prop("style", "color:#ff6a00");
    });
    $("div[class^='order-item-product-li']").mouseleave(function () {
        $(this).children().children("div[class='order-item-product-info']").prop("style", "color:black");
    });
    // var address= $("#allAddressListHtml").children("div[class^='order-item-address-li']").children("div[class='order-item-address-info']").children("div[class='order-item-address-details']").text();
    // alert(address);
    var sumMoney = 0;
    var sumNum = 0;
    $("div[class='order-item-product-list']").children().each(function () {
        var money = $(this).children("a").children("div[class='order-item-product-info']").children("div").children("span[class='order-item-product-price']").text();
        var num = $(this).children("a").children("div[class='order-item-product-info']").children("div").children("input").val();
        sumNum = sumNum + parseInt(num);
        sumMoney = sumMoney + parseInt(money) * parseInt(num);
    });
    $("#pro_price").text(sumMoney);
    $("#pro_count").text(sumNum);
    $("#payMoney").text(sumMoney);
});
function OrderOper(orderId) {
    $.ajax({
            type: "post",
            url: "/myOrder/OrderOper?orderId="+orderId,
            datatype: "json",
            success: function (data) {
                window.location.href="/myOrder/intoOrder";
            }

        }
    )
}
function DoSelectZT() {
    var status=$("#zt").val();
window.location.href="/myOrder/doSelectZT?status="+status;
}