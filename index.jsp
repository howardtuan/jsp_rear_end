<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/index.css">
    <link rel="icon" href="assets/img/wand.png">
    <script src="assets/js/jquery-2.1.4.min.js"></script>
    <script src="assets/js/script.js"></script>
    <title>奧利凡德</title>
</head>
<body class="index_body">
    <section>   <!--導覽列-->
        <%@include file="header.jsp" %>
    </section>

    <section class="margin">
        <div id="wrapper">
            <div id="slide">
                <ul>
                    <li><img src="assets/img/dragon_wand.png" width="1000" height= "570" alt="img1"></li>
                    <li><img src="assets/img/spirit_wand.png" width="1000" height= "570" alt="img2"></li>
                    <li><img src="assets/img/dream_wand.png" width="1000" height= "570" alt="img3"></li>
                    <li><img src="assets/img/college_wand.png" width="1000" height= "570" alt="img4"></li>
                </ul>
            </div>
        </div>
        <div><hr></div>
    </section>

    <section>
        <div class="index_hot">
            <p class="hot">熱銷商品</p>
            <div class="back">
                <div class="row">
                    <img src="assets/img/red.png" width="270" class="pic">
                    <img src="assets/img/green.png" width="270" class="pic">
                    <img src="assets/img/yellow.png" width="270" class="pic">
                </div>     
                
            </div>
    
            <div class="down">
                <div class="row_one">
                    <img src="assets/img/blue.png" width="270" class="pic">
                    <img src="assets/img/purple.png" width="270" class="pic">
                    <img src="assets/img/white.png" width="270" class="pic">
                </div>
            </div>
    
            <div class="btn">
                <a href="product.jsp" class="more1" style="text-decoration:none;">
                    <div class="more">
                        <p class="more_word">MORE</p>
                    </div>
                </a>
            </div>
        </div>
        
    </section>
<%@include file="footer.jsp" %>
</body>
</html>