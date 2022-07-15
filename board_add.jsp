<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
    if(session.getAttribute("account")==null){
        out.print("<script>alert('你不是會員 請你離開'); window.location='login.jsp'</script>");
    }
%>
<%
    sql = "SELECT * FROM `MESSAGEBOARD`" ;
    ResultSet ProductList=  con.createStatement().executeQuery(sql);
    int cnt = 1;
    while(ProductList.next()){
        cnt+=1;
    }
    Object ClientID = session.getAttribute("id");
    if(ClientID!= null){
        String ProductID =request.getParameter("ProductID");
        String rating = request.getParameter("rating");
        String content = request.getParameter("content");
        sql = "INSERT MESSAGEBOARD (`MessageID`, `Rating`, `ProductID`, `ClientID`, `MessageContent`) VALUES('"  + cnt+ "','" + rating+ "','"+ ProductID+ "','" + ClientID + "','" + content + "')" ;
        int no=con.createStatement().executeUpdate(sql);
        if (no > 0){
            //out.print("<script>window.location='shoppingcar.jsp'</script>");
        }
        con.close();
    }else{
        out.print("<script>alert('你不是會員 請你離開'); window.location='login.jsp'</script>");
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