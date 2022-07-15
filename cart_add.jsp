<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
    if(session.getAttribute("account")==null){
        out.print("<script>alert('你不是會員 請你離開'); window.location='login.jsp'</script>");
    }
    else{
    Object ClientID = session.getAttribute("id");
    String ProductID =request.getParameter("ProductID");
    String stock =request.getParameter("stock");
    String Quantity = request.getParameter("Quantity");
    if( Integer.parseInt(Quantity)<=0){
        out.println("<script>alert('請輸入正確數量！');</script>");
    }else if(Float.parseFloat(stock) < Float.parseFloat(Quantity+".0")){
        out.println("<script>alert('請購買數量不要大於庫存！');</script>");
    }else{
        sql = "INSERT CART (`ClientID`,`ProductID`, `Quantity`) VALUES('" + ClientID+ "','" + ProductID + "','" + Quantity + "')" ;
        int no=con.createStatement().executeUpdate(sql);
        if (no > 0){
            //out.print("<script>window.location='shoppingcar.jsp'</script>");
        }
        con.close();
    }
    }
    
%>
<script type="text/javascript">
//一秒後模擬點擊
	setTimeout(function() {
		// IE
		if(document.all) {
			document.getElementById("back").click();
		}
		// 其它瀏覽器
		else {
			var e = document.createEvent("MouseEvents");
			e.initEvent("click", true, true);
			document.getElementById("back").dispatchEvent(e);
		}
	}, 0);
</script>
<input type ="button" onclick="history.back();" value="返回上一頁" id="back">