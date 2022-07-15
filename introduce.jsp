<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*" %>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/introduce.css?888">
    <link rel="icon" href="assets/img/wand.png">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha384-vk5WoKIaW/vJyUAd9n/wmopsmNhiy+L2Z+SBxGYnUkunIxVxAv/UtMOhba/xskxh" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <script src="assets/js/jquery-2.1.4.min.js"></script>
    <script src="assets/js/script.js"></script>
    <script src="assets/js/depic.js"></script>
    <script src="assets/js/detail.js"></script>
    
</head>
<title>奧利凡德</title>
</head>

<body>
    <section>
        <!--導覽列-->
        <%@include file="header.jsp" %>
    </section>
    <section class="intro_top">
        <!--商品介紹區-->
        <%
            String PageID = request.getParameter("id");       
            int IntPageID=Integer.valueOf(PageID);
            sql = "SELECT * FROM PRODUCT WHERE `ProductID` = '"+ IntPageID +"'";
            ResultSet Product =  con.createStatement().executeQuery(sql);
            while( Product.next()){
        %>
        <div class="back"><input type ="button" onclick="history.back()" value="回到上一頁" id="back"></input></div>
        <div id="item1" class="item item--mod"> <img src="<%=Product.getString("ImgUrl") %>">
            <b class="item-close js-popup-close">x</b>
        </div>
        
        <div class="introMain">
            <div class="togaysou">
                <div class="introImg">
                    <img src="<%=Product.getString("ImgUrl") %>" width="90%" class="btn2">
                </div>
                <div class="tittle">
                    <h1><%=Product.getString("ProductName") %></h1>
                    <%
                    sql = "CALL STOCK_ANY("+ IntPageID +")";
                    ResultSet stock =  con.createStatement().executeQuery(sql);
                    while( stock.next()){
                    %>
                    <label>庫存：<%=stock.getInt("庫存")%></label>
                    <%
                    }
                    %>
                    <label>評價： 5/5</label>
                    <%
                    sql = "SELECT * FROM STOCK_VIEW WHERE `ProductID` = '"+ IntPageID +"'";
                    ResultSet SoldOut =  con.createStatement().executeQuery(sql);
                    while( SoldOut.next()){
                    %>
                    <label>已售出：<%=SoldOut.getInt("銷貨") %></label><br>
                    <%
                    }
                    %>
                    <p class="www">
                        <%=Product.getString(6) %>&nbsp;
                        <%=Product.getString(7) %>&nbsp;
                        <%=Product.getString(8) %>&nbsp;
                        <%=Product.getString(9) %>&nbsp;
                    </p><br>
                    <p class="www">價格:<%=Product.getString("Price") %>$</p>
                    <form method="post" action="cart_add.jsp">
                        <script>
                        function addNUM(){
                            //1、獲取#num的value
                            var Stock = Number(document.getElementById("stock").value);
                            var value = Number(document.getElementById("num").value);
                            if(value >= Stock){
                                value = Stock;
                            }else{
                                value += 1;
                            }
                            document.getElementById("num").value = value;
                        }

                        function minusNUM(){
                            //1、獲取#num的值
                            var value = Number(document.getElementById("num").value);
                            //2、判斷#num的值是否小於等於1，如果小於等於1的話，則將值改為1
                            //3、否則，可以實現 - 1 操作
                            if(value <= 1){
                                value = 1;
                            }else{
                                value -= 1;
                            }
                            //4、將 value 的值賦值給 #num
                            document.getElementById("num").value = value;
                        }
                        </script>
                        <%
                        sql = "CALL STOCK_ANY("+ IntPageID +")";
                        stock =  con.createStatement().executeQuery(sql);
                        while( stock.next()){
                        %>
                        <input type="hidden" id="stock" name="stock" value="<%=stock.getString("庫存")%>">
                        <%
                        }
                        %>
                        <input type="hidden" name="ProductID" value="<%=IntPageID%>">
                        <input type="button" class="numbut" value="-" id="btnOne" onclick="minusNUM()">
                        <input type="text" id="num" name="Quantity" class="number" value="1">
                        <input type="button" class="numbut" value="+" id="btnTwo" onclick="addNUM()">
                        
                        <input type="submit" class="tocar" value="加入購物車" name="CartAdd">
                    </form>
                </div>
            </div>
            <div class="intro">
                <h3>商品介紹</h3>
                <div class="iOutline">
                    <p class="ios"> <%=Product.getString("Introduce")%></p>
                </div>
            </div>
            <div class="commentMain">
                <div class="commentInport">
                    <h2>Comment</h2>
                    <form method="post" action="board_add.jsp">
                        <input type="hidden" name="ProductID" value="<%=IntPageID%>">
                        <div class="name">
                            <div class="text">Name :</div>
                            <input type="text" value="<%=session.getAttribute("name") %>" name="board_name" class="input" readonly="readonly"/>
                        </div>
                        Rating :
                        <div class="submit_rating" id="submit_stars" onmousemove="move(event,0)"
                            onclick="move(event,1)">
                            <div class="empty_star">&#x2660;&#x2660;&#x2660;&#x2660;&#x2660;</div>
                            <div class="full_star" id="full_star">&#x2660;&#x2660;&#x2660;&#x2660;&#x2660;</div>
                        </div>
                        <input type="hidden" name="rating" value="5">
                        <div class="comment_title">Commemt :</div>
                        <textarea id="comment" name="content" placeholder></textarea>
                        <input type="submit" value="送出" class="tocar" id="comsub">
                    </form>
                </div>
                <div class="commentShow">
                    <h2>更多留言</h2>
                    <%
                    sql = "SELECT * FROM MESSAGEBOARD WHERE `ProductID` = '"+ IntPageID +"'";
                    ResultSet msg =  con.createStatement().executeQuery(sql);
                    while( msg.next()){
                    %>
                    <div class="">
                        <%
                        sql = "SELECT * FROM CLIENTS WHERE `ClientID` = '"+ msg.getString("ClientID") +"'";
                        ResultSet client =  con.createStatement().executeQuery(sql);
                        while( client.next()){
                        %>
                        <span><%= client.getString("ClientName")%></span>
                        <%
                        }
                        %>
                        <div class="empty_star">&#x2660;&#x2660;&#x2660;&#x2660;&#x2660;</div>
                        <div class="ccc">
                            <p> <%=msg.getString("MessageContent")%></p>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
        <%
            }
        %>

        <div class="h4">
            <h4>也許你還想看</h4>
        </div>
        <%
        sql="SELECT * FROM `Product`";
        ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
        rs.last();
        int totalProduct = rs.getRow();

        String[] tmp = { "0", "0", "0"};
        Random randomNumber = new Random();
        for(int i = 0; i < 3; i++){
            String tmpNumber = Integer.toString(randomNumber.nextInt(totalProduct)+1);
            Boolean error = false;
            for(int j = 0; j < i; j++){
                if(tmp[j].equals(tmpNumber)){
                    error = true;
                    break;
                }
            }
            if(error){
                i-=1;
                continue;
            }
            if(!tmp[i].equals("0")){
                i-=1;
                continue;
            }
            tmp[i] = tmpNumber;
        }
        %>
        <div class="list">
        <%
        for(int i = 0; i < 3; i++){
            sql = "SELECT * FROM PRODUCT WHERE `ProductID` = '" + Integer.parseInt(tmp[i]) + "'";
            ResultSet ProductRndList =  con.createStatement().executeQuery(sql);
            while(ProductRndList.next()){
        %>
            <div class="lattice">
                <div class="likeImg">
                    <a href="<%= "introduce.jsp?id=" + ProductRndList.getString("ProductID") %>">
                        <img src="<%=ProductRndList.getString("ImgUrl") %>" width="90%">
                    </a>
                </div>
                <div class="likeIntro">
                    <%=ProductRndList.getString("ProductName") %>
                </div>
            </div>
        <%
                }
        }
        %>
            <%-- <div class="lattice">
                <div class="likeImg">
                    <a href=""><img src="assets/img/w14.jpg" width="90%"></a>
                </div>
                <div class="likeIntro">
                    雷雨回環
                </div>
            </div>
            <div class="lattice" id="laRight">
                <div class="likeImg">
                    <a href=""><img src="assets/img/w20.jpg" width="90%"></a>
                </div>
                <div class="likeIntro">
                    第一根魔杖为伏地魔的兄弟魔杖
                </div>
            </div> --%>
        </div>
        </div>
    </section>
<%@include file="footer.jsp" %>
    <script>
        // 放大鏡
        document.querySelector('.introImg').addEventListener('mouseenter', enterHandler);
        document.querySelector('.introImg').addEventListener('mousemove', moveHandler);
        document.querySelector('.introImg').addEventListener('mouseleave', leaveHandler);

        function enterHandler(e) {
            e.target.setAttribute('zoomed', 1);
        }

        function moveHandler(e) {

        }

        function leaveHandler(e) {
            e.target.removeAtttribute('zoomed');
        }

        // 點擊圖片放大
        (function ($) {
            $(function () {
                $('.btn2').on('click', function () {
                    $('#item1').popup({
                        time: 500,
                        classAnimateShow: 'slideInUp',
                        classAnimateHide: 'fadeOut',
                        onPopupClose: function e() {
                            // console.log('0')
                        },
                        onPopupInit: function e() {
                            // console.log('1')
                        }
                    });
                });
            });
        })(jQuery);
    </script>
    <script src="assets/js/jquery.popup.min.js"></script>
</body>

<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-167622866-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') +
            '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
</script>
</body>

</html>