<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>鲜花后台管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.table2excel.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>

    <script>
        function deleteUser(id){
            //用户安全提示
            if(confirm("您确定要删除吗？")){
                //访问路径
                location.href="${pageContext.request.contextPath}/delUserServlet?id="+id;
            }
        }

        window.onload = function(){
            //给删除选中按钮添加单击事件
            document.getElementById("delSelected").onclick = function(){
                if(confirm("您确定要删除选中条目吗？")){

                    var flag = false;
                    //判断是否有选中条目
                    var cbs = document.getElementsByName("uid");
                    for (var i = 0; i < cbs.length; i++) {
                        if(cbs[i].checked){
                            //有一个条目选中了
                            flag = true;
                            break;
                        }
                    }

                    if(flag){//有条目被选中
                        //表单提交
                        document.getElementById("form").submit();
                    }

                }

            }
            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function(){
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("uid");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态 = firstCb.checked
                    cbs[i].checked = this.checked;
                }

            }


        }


    </script>
</head>
<body>
<div class="container">
<%--    <h3 style="text-align: center">上架鲜花列表</h3>--%>
    <hr>
    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/FindUserByPageServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName2" >鲜花名</label>
                <input type="text" name="name" value="${condition.name[0]}" class="form-control" id="exampleInputName2" style="width: 120px">
            </div>
            <div class="form-group">
                <label for="exampleInputAddress">编号</label>
                <input type="text" name="address" value="${condition.address[0]}" class="form-control" id="exampleInputAddress" style="width: 120px">
            </div>
            <button type="submit" class="btn btn-default" >提交</button>
        </form>
    </div>
    <div style="float: right;margin: 5px">
        <td colspan="8" align="center"><a class="btn btn-primary" href="add.jsp">添加联系人</a></td>
        <td colspan="8" align="center"><a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a></div>
    <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
        <table border="1" class="table table-bordered table-hover table2excel">
            <tr class="success">;
                <th class="noExl"><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>图片</th>
                <th>鲜花名</th>
                <th>库存量</th>
                <th>会员价</th>
                <th class="noExl">操作</th>
            </tr>

            <c:forEach items="${pageBean.list}" var="flower" varStatus="s">
                <tr  >
                    <td class="noExl"  ><input type="checkbox" style="margin-top: 30px" name="uid" value="${flower.fid}" ></td>
                    <td style="text-align: center;line-height: 72px" >${flower.fid}</td>
                    <td style="text-align: center;line-height: 72px"><img src="${pageContext.request.contextPath}/${flower.flowerImage.image}"
                             style="width: 55px; height: 55px"></td>
<%--                    <c:if test="${flower.tid==1}">--%>
<%--                        <td>爱情鲜花</td>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${flower.tid==2}">--%>
<%--                        <td>商务鲜花</td>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${flower.tid==3}">--%>
<%--                        <td>生日鲜花</td>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${flower.tid==4}">--%>
<%--                        <td>开业花篮</td>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${flower.tid==5}">--%>
<%--                        <td>问候长辈</td>--%>
<%--                    </c:if>--%>
                    <td style="text-align: center;line-height: 72px">${flower.remark}</td>
                    <td style="text-align: center;line-height: 72px">${flower.number}</td>
                    <td style="text-align: center;line-height: 72px">${flower.vipFprice}</td>
                    <td class="noExl" style="text-align: center;line-height: 72px">
                        <a class="btn btn-default btn-sm" href="/manageFlower/flowerInfos?Fid=${flower.fid}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="/manageFlower/dropFlower?Fid=${flower.fid}">下架</a></td>
                </tr>

            </c:forEach>

        </table>
    </form>

    <script>
        $(function() {
            $(".btn-output").click(function(){
                $(".table2excel").table2excel({
                    // 不被导出的表格行的CSS class类
                    exclude: ".noExl",
                    // 导出的Excel文档的名称
                    name: "Excel Document Name",
                    // Excel文件的名称
                    filename: "test",
                    //文件后缀名
                    fileext: ".xls",
                    //是否排除导出图片
                    exclude_img: false,
                    //是否排除导出超链接
                    exclude_links: false,
                    //是否排除导出输入框中的内容
                    exclude_inputs: false
                });
            });
        });
    </script>
    <div style="float: left">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${pageBean.currentPage == 1}">
                <li class="disabled">
                    </c:if>

                    <c:if test="${pageBean.currentPage != 1}">
                <li>
                    </c:if>


                    <a href="/manageFlower/flowerList?infos=&CurrentPage=${pageBean.currentPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>


                <c:forEach begin="1" end="${pageBean.totalPage}" var="i" >


                    <c:if test="${pageBean.currentPage == i}">
                        <li class="active"><a href="/manageFlower/flowerList?infos=&CurrentPage=${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${pageBean.currentPage != i}">
                        <li><a href="/manageFlower/flowerList?infos=&CurrentPage=${i} ">${i}</a></li>
                    </c:if>

                </c:forEach>
                <c:if test="${pageBean.currentPage==pageBean.totalPage}">
                <li class="disabled">
                    </c:if>
                    <c:if test="${pageBean.currentPage!=pageBean.totalPage}">
                <li >
                    </c:if>
                    <a href="/manageFlower/flowerList?infos=&CurrentPage=${pageBean.currentPage + 1} " aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 22px;margin-left:5px;text-align: center">共${pageBean.totalCount}条记录，共${pageBean.totalPage}页。</span>
            </ul>
        </nav>
    </div>
    <div class="pagination" style="float: right" aria-label="Page navigation">  <a class="btn btn-primary btn-output" style="float: right">导出数据</a></div>
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
</body>

</html>
