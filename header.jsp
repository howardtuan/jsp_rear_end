<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<nav id="nav">
    <script>
window.onpageshow = function(event) {
    if (event.persisted || (window.performance && 
        window.performance.navigation.type == 2)) {
        console.log("返回上一頁");
        window.location.reload()
    }
};
</script>
            <div class="logo nav"><a href="index.jsp" >奧利凡德</a></div>
            <div class="product nav"><a href="product.jsp" >商品介紹</a></div>  
            <div class="aboutus nav"><a href="aboutus.jsp" >關於我們</a></div>
            <!-- 
                <div class="login nav"><a href="login.jsp" >登入/註冊</a></div>
            -->
            



            <!--登入後顯示名字-->
            <%if(session.getAttribute("account")!= null ){
            
                    Object objname = session.getAttribute("account");
                    request.setCharacterEncoding("utf-8");
                    Class.forName("com.mysql.jdbc.Driver");
                    String url2="jdbc:mysql://localhost/?serverTimezone=UTC";
                    Connection con2=DriverManager.getConnection(url2,"root","1234");
                    String sql2="USE OLLIVANDERS_WAND_SHOP";
                    con2.createStatement().execute(sql2);
                    sql2 = "SELECT * FROM `CLIENTS` WHERE `ClientAccount` = '"+objname+"'";
                    con2.createStatement().execute(sql2);
                    ResultSet rs2=con2.createStatement().executeQuery(sql2);
                   if(session.getAttribute("account") != null ){
                        while(rs2.next()) 
                            {
                        String user_id = rs2.getString("ClientName");
                        %>
					<div class="login nav"><a href="member.jsp">歡迎你;&nbsp<%= user_id %>&nbsp</a></div>
                    <div class="login nav"><a href="logout.jsp">登出</a></div>
                    <div class="search nav">
                        <form action="product_search.jsp" method="POST">
                            <input type="text" placeholder="Search" name="search" class="search1">
                        </form>
                    </div>

                    <div class="car nav"><a href="member.jsp"><img src="assets/img/member.png" width="23" class="member_img"></a></div>
                    <div class="car nav" id="">
                        <a href="shoppingcar.jsp"><img src="assets/img/car (1).png" width="32" class="car_img"></a>
                    </div>
						<%}}%>
						<%}else{%>
					<div class="login nav"><a href="login.jsp" >登入/註冊</a></div>
                    <div class="search nav">
                        <form action="product_search.jsp" method="POST">
                            <input type="text" placeholder="Search" name="search" class="search1">
                        </form>
                    </div>

                    <div class="car nav"><a href="login.jsp"><img src="assets/img/member.png" width="23" class="member_img"></a></div>
                    <div class="car nav" id="">
                        <a href="shoppingcar.jsp"><img src="assets/img/car (1).png" width="32" class="car_img"></a>
                    </div>
                        <%}%>
		
            <!--登入後顯示名字-->
        </nav>