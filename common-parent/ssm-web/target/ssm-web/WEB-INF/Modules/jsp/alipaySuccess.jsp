<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js" type="text/javascript"></script>

<html>

    <head>
        
    </head>
    
    <body>
        <h1 style="color: green;">购买成功</h1>
        <table>
        	<tr>
        		<td>
        			订单编号: ${out_trade_no }
        		</td>
        	</tr>
        		<td>
        			支付宝交易号: ${trade_no }
        		</td>
        	<tr>
        	</tr>
        		<td>
        			实付金额: ${total_amount }
        		</td>
        	<tr>
        	</tr>
        		<td>
        			购买产品：${productName }
        		</td>
        	</tr>
        </table>
    </body>
    
</html>


