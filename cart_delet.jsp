<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
    String ProductID_d =request.getParameter("delet_b");
    sql = "DELETE FROM CART WHERE CART.ProductID='" + ProductID_d+ "' and CART.ClientID='" + session.getAttribute("id")+ "';";
    int no=con.createStatement().executeUpdate(sql);
    if (no > 0){
        out.print("<script>window.location='shoppingcar.jsp'</script>");
    }
    con.close();
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