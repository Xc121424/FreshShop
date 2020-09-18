
$(function () {
    init();
});
function init() {
    $("input[name='cpsl']").each(function () {
        var num=$(this).val();
        var Fid = $(this).siblings("input[name='Fids']").val();
        if(num!=1){
            $(this).prev().removeClass("disabled");
        }
        $.ajax(
            {
                url: "/flower/findflowerNum?Fid=" + Fid+"&flowerNum="+num,
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    if (data == num) {
                        $(this).next().addClass("disabled");
                    }
                    var number=parseInt(data);
                    if(number<num){
                        window.location.reload();
                    }

                }
            });
    });
}

function numChange(obj) {
    var Fid = $(obj).siblings("input[name='Fids']").val();
    var val = $(obj).val();
    if (val == 1) {
        $(obj).prev().addClass("disabled")
        $(obj).next().removeClass("disabled")
    }
    $.ajax(
        {
            url: "/flower/findflowerNum?Fid=" + Fid+"&flowerNum="+val,
            type: 'post',
            dataType: 'json',
            success: function (data) {
                if (data == val) {
                    $(obj).next().addClass("disabled");
                    $(obj).prev().removeClass("disabled");
                }
                if (val > data) {
                    alert("该鲜花库存量为:" + data+"！ 请重新填写！");
                    $(obj).val(data);
                    $(obj).next().addClass("disabled");
                    $(obj).prev().removeClass("disabled");
                }

            }
        });
    flowerSelect();

}

function numMinus(obj) {
    var val1 = $(obj).siblings("input[name='Fids']").val();
    var val = $(obj).next().val();
    val--;
    $(obj).next().val(val);
    $.ajax({
        url: "/flower/findflowerNum?Fid=" + val1+"&flowerNum="+val,
        type: 'post',
        dataType: 'json',
        success: function (data) {
            if (val == 1) $(obj).addClass("disabled");
            $(obj).nextAll("a[name='cpsl']").removeClass("disabled");
        }
    });
    flowerSelect();
}

function numAdd(obj) {
    var val1 = $(obj).prev().val();
    var val = $(obj).siblings("input[name='Fids']").val();
    val1++;
    $.ajax(
        {
            url: "/flower/findflowerNum?Fid=" + val+"&flowerNum="+val1,
            type: 'post',
            dataType: 'json',
            success: function (data) {
                $(obj).prev().val(val1);
                if (val1 == data) $(obj).addClass("disabled");
                $(obj).prevAll("a[name='1']").removeClass("disabled");
            }
        });
    flowerSelect();
}

function flowerSelect() {
    var sumMoney=0.00;

    $("input[name='productCode']:checked").each(function () {
        var num=$(this).parent().siblings("li[class='num']").children().children().siblings("input[name='cpsl']").val();
         sumMoney=(parseFloat(sumMoney)+parseFloat($(this).next().val())*num).toFixed(2);

    });
    $("#totalMoney").html(sumMoney);
    var length = $("input[name='productCode']").length;
    var checkedLength = $("input[name='productCode']:checked").length;
    if (length == checkedLength) {
        $("#topCheckbox").prop("checked", true)
    } else {
        $("#topCheckbox").prop("checked", false)
    }
}
$("#topCheckbox").click(function () {
    var i = $(this).prop("checked");
    if (i) {
        $("input[name='productCode']").each(function () {
            $(this).prop("checked", true);
        });
    } else {
        $("input[name='productCode']").each(function () {
            $(this).prop("checked", false);
        });
    }
    flowerSelect();
});
$("#jiesuan").click(function () {
    var data = new Array();
    $("input[name='productCode']:checked").each(function (i) {
        data[i] = $(this).parent().siblings("li[class='num']").children().children("input[name='Fids']").val();
    });
    // data.push($("#totalMoney").text())
    $.ajax({
        type: "POST",
        dataType: "json",
        contentType: 'application/json;charset=utf-8',//这个必须是这个格式
        url: "/myShop/writeOrder",
        data: JSON.stringify(data),
        success: function (date) {
            window.location.href = "/myShop/intoWriteOrder";
        },
        error: function () {
        }
    })
});
