<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>註冊</title>
    <link rel="stylesheet" href="assets/css/signup.css">
    <link rel="icon" href="assets/img/wand.png">
</head>
<body>
    <section>   <!--導覽列-->
        <%@include file="header.jsp" %>
    </section>
    <!-- 註冊區 -->
    <section class="">

        <div class="signup_main">

            <form action="signin.jsp" class="form">
                <h2>入學通知書<br>------------------------------------------</h2>
                <label for="user_name">姓名</label>
                <div class="inputext">
                    <input type="text" name="name" id="user_name" class="ipt">
                </div>
                <label for="user_id">帳號</label>
                <div class="inputext">
                    <input type="text" name="account" id="user_id" class="ipt">
                </div>
                <label for="password">密碼</label>
                <div class="inputext">
                    <input type="password" name="password" id="password" class="ipt">
                </div>
                <label for="password">再次輸入密碼</label>
                <div class="inputext">
                    <input type="password" name="password_2" id="password" class="ipt">
                </div>
                <label for="user_bth">生日</label>
                <div class="inputext">
                    <input type="text" name="birthday" id="user_bth" class="ipt">
                </div>
                <label for="user_phone">電話</label>
                <div class="inputext">
                    <input type="text" name="phone" id="user_phone" class="ipt">
                </div>
                <div class="btnmain">
                    <input type="submit" name="" value="註冊" class="btn">
                    <input type="button" name="" value="取消" class="btn">
                </div>
                <h2>------------------------------------------</h2>
                <div class="gologin">
                    已經註冊學號了？<a href="login.jsp">點我登入</a>
                </div>
            </form>
        </div>
    </section>
    <%@include file="footer.jsp" %>
</body>
</html>