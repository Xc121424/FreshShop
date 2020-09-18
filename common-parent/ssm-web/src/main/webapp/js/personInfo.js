function checkUsername() {
    var val = $("#username").val();
    var patern = /^[\u4E00-\u9FA5]{2,4}$/;
    var flag = patern.test(val);
    if (flag) {
        $("#username").css("border", "");
    } else {
        $("#username").css("border", "solid 1px red");
    }
    return flag;
}
function checkEmail() {
    var val = $("#emails").val();
    var patern = /^\w+@\w+\.\w+$/;
    var flag = patern.test(val);
    if (flag) {
        $("#emails").css("border", "");
    } else {
        $("#emails").css("border", "solid 1px red");
    }
    return flag;

}

function checkTelephone() {
    var val = $("#telephone").val();
    var patern = /^[1][3,4,5,7,8][0-9]{9}$/;
    var flag = patern.test(val);
    if (flag) {
        $("#telephone").css("border", "");
    } else {
        $("#telephone").css("border", "solid 1px red");
    }
    return flag;
}
function findAccount() {
    $.ajax({
        type: "post",
        url: "/frame/findAccount",
        dataType: "json",
        data: JSON.stringify(user),
        contentType: "application/json",
        success: function (data) {
            window.location.href = 'intologin';
        }
    })
}

$(function () {
    $("#personInfoForm").submit(function () {
        if (checkEmail() && checkUsername() && checkTelephone()) {
            //提交表单数据
            var user = {
                account: $("#account").val(),
                username: $("#username").val(),
                password: $("#password").val(),
                email: $("#emails").val(),
                tel: $("#telephone").val(),
                sex: $("#sex").val()

            };
            console.log(user);
            $.ajax({
                type: "post",
                url: "/frame/updatePersonInfo",
                dataType: "json",
                data: JSON.stringify(user),
                contentType: "application/json",
                success: function (data) {
                    window.location.href = 'index';
                }
            })
        }
        //不提交表单，因为提交表单为同步请求，而ajax为异步
        return false;
    });
    // checkaccount;
    $("#username").change(checkUsername);
    $("#emails").change(checkEmail);
    $("#telephone").change(checkTelephone);
    $("#telephone").change(function () {
        if($("#telephone").val()!=$("#telephone").next.val()){
            $.ajax({
                type: "post",
                url: "/frame/findAccount",
                dataType: "json",
                data: {"account": $("#telephone").val()},
                success: function (data) {

                    if (data != true) {
                        $("#error").val("该号码已被注册");
                        $("#telephone").val("");
                        $("#telephone").css("border", "solid 1px red");
                    }
                }
            })
        }
        if($("#telephone").val()==$("#telephone").next.val()){     $("#error").val("");}

    });
    $("#emails").change(function () {
        if($("#emails").val()!='${user.email}'){
            $.ajax({
                type: "post",
                url: "/frame/findEmail",
                dataType: "json",
                data: {"email": $("#emails").val()},
                success: function (data) {
                    if (data != true) {
                        $("#error").val("该邮箱已被注册");
                        $("#emails").val("");
                        $("#emails").css("border", "solid 1px red");
                    }
                }
            })
        }
        if($("#emails").val()=='${user.email}'){     $("#error").val("");}
    });
});

function resets() {
    $("#emails").css("border", "");
    $("#telephone").css("border", "");
    $("#username").css("border", "");
    $("#error").val("");
}