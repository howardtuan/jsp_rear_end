<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="icon" href="assets/img/wand.png">
    <title>登入</title>
</head>
<body>
    <section>   <!--導覽列-->
        <%@include file="header.jsp" %>
    </section>
    <!-- 登入區 -->
    <section>
        <div class="login_main">
            <form action="check.jsp" class="form" method="POST">
                <h2>會員登入<br>------------------------------------------</h2>
                <label for="user_id">帳號</label><br>
                <div class="inputext">
                    <input type="text" name="account" id="user_id" class="ipt"><br>
                </div>
                <label for="password">密碼</label></br>
                <div class="inputext">
                    <input type="password" name="password" id="password" class="ipt">
                </div>
                <div class="btnmain">
                    <input type="submit" name="登入" value="登入" class="btn">
                    <input type="button" name="取消" value="取消" class="btn" >
                </div>
                <h2>------------------------------------------</h2>
                <div class="group gosignup">
                    還沒入學？<a href="signup.jsp">點我註冊</a> 
                </div>
            </form>
        </div>
    </section>
    <%@include file="footer.jsp" %>
</body>
</html>