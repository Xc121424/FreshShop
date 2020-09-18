function change() {
    var length = $("input[name='product_code']").length;
    var checkedLength = $("input[name='product_code']:checked").length;
    if (length == checkedLength) {
        $("#selectall").prop("checked", true)
    } else {
        $("#selectall").prop("checked", false)
    }
}

function cancelFavorite(fid) {
    $.ajax({
        url: "/favorite/cancelFavorite",
        type: "post",
        data: {Fid: fid},
        dataType: "json",
        success: function (data) {
            // window.location.reload();
            alert("移除收藏夹成功！")
            window.location.href = "/favorite/intoFavorite?currIndex=1&pageSize=20";
        }
    })
}

function addShop(fid) {
    $.ajax({
            url: "/myShop/addShop",
            type: "post",
            data: {"Fid": fid},
            dataType: "json",
            success: function (data) {

                if (data == 1) {
                    var r = confirm("加入购物车成功！是否查看购物车？")
                    if (r == true) {
                        window.location.href = '/myShop/intoShop?currentPage=1'
                    } else {
                        window.location.href = "/favorite/intoFavorite?currIndex=1&pageSize=20";
                    }

                }
            }
        }
    )
}

function checkselect(obj) {
    var i = document.getElementById("selectall").checked;
    if (i) {
        $("input[name='product_code']").each(function () {
            $(this).prop("checked", true);
        });
    } else {
        $("input[name='product_code']").each(function () {
            $(this).prop("checked", false);
        });
    }
}

$("#cancledAttention").click(function () {
    var data = new Array();
    $("input[name='product_code']:checked").each(function (i) {
        data[i] = $(this).val();
    });
    console.log(data);
    if (confirm("您确定要删除吗？")) {
        $.ajax({
            type: "POST",
            dataType: "json",
            contentType: 'application/json;charset=utf-8',//这个必须是这个格式
            url: "/favorite/cancleFavoriteList",
            data: JSON.stringify(data),
            success: function (date) {
                alert("删除成功！");
                window.location.href = "/favorite/intoFavorite?currIndex=1&pageSize=20";
            },
            error: function () {
            }
        });
    }

});