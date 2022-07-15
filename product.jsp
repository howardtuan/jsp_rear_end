<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品介紹</title>
    <link rel="stylesheet" href="assets/css/product.css">
    <link rel="icon" href="assets/img/wand.png">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <script src="assets/js/jquery-2.1.4.min.js"></script>
    <script src="assets/js/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha384-vk5WoKIaW/vJyUAd9n/wmopsmNhiy+L2Z+SBxGYnUkunIxVxAv/UtMOhba/xskxh" crossorigin="anonymous">
    </script>
</head>
<style>
    .item {
        max-width: 85%;
        padding: 1em;
        background: transparent;
        display: none;
        position: relative;
        /* -webkit-box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.15);
        box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.15); */
        border-radius: 3px;
    }

    .item-close {
        cursor: pointer;
        right: 5px;
        top: 5px;
        position: absolute;
        background: #222;
        color: #fff;
        border-radius: 100%;
        font-size: 18px;
        height: 26px;
        line-height: 22px;
        text-align: center;
        width: 26px;
    }

    /* .container { margin: 50px auto; max-width: 100%; text-align: center; } */
    .item img {
        max-width: 100%;
        height: auto;
    }
</style>

<body>
    <section>
        <!--導覽列-->
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
        <!--商品介紹區-->
        <div class="productMain">
            <h2>熱門商品</h2>
            <div class="list">
            <%
                sql = "SELECT * FROM PURCHASE_DETAILS_AMOUNT_VIEW ORDER BY `Quantity` DESC LIMIT 3" ;
                ResultSet ProductHotList_1=  con.createStatement().executeQuery(sql);
                while(ProductHotList_1.next()){
                sql = "SELECT * FROM PRODUCT WHERE `ProductID` = '" + ProductHotList_1.getString("ProductID") + "'";
                ResultSet ProductHotList_2 =  con.createStatement().executeQuery(sql);
                while(ProductHotList_2.next()){
            %>
                <div class="lattice">
                    <a class="btn1" href="<%= "introduce.jsp?id=" + ProductHotList_2.getString("ProductID") %>">
                        <div class="productImg">
                            <img src="<%=ProductHotList_2.getString("ImgUrl") %>" width="90%">
                        </div>
                        <div class="productIntro">
                            <%=ProductHotList_2.getString("ProductName") %>
                        </div>
                    </a>
                    <input type="hidden" name="product_dt" value='<%=ProductHotList_2.getString("ProductID")%>' >
                </div>
                <%
                }
                }
                %>
                <%-- <div class="lattice">
                    <a href="introduce.jsp">
                        <div class="productImg">
                            <img src="assets/img/w14.jpg" width="90%">
                        </div>
                        <div class="productIntro">
                            雷雨回環
                        </div>
                    </a>
                </div>
                <div class="lattice"><a href="introduce.jsp">
                        <div class="productImg">
                            <img src="assets/img/w23.jpg" width="90%">
                        </div>
                        <div class="productIntro">真言鑑定家
                        </div>
                    </a></div> --%>
            </div>
            <h2>經典商品|龍的心弦</h2>
            <div class="list">
                <%
                sql = "SELECT * FROM PRODUCT WHERE `ClassID` = 'Class001' LIMIT 3";
                ResultSet ProductList_1 =  con.createStatement().executeQuery(sql);
                while(ProductList_1.next()){
            %>
                <div class="lattice">
                    <a class="btn1" href="<%= "introduce.jsp?id=" + ProductList_1.getString("ProductID") %>">
                        <div class="productImg">
                            <img src="<%=ProductList_1.getString("ImgUrl") %>" width="90%">
                        </div>
                        <div class="productIntro">
                            <%=ProductList_1.getString("ProductName") %>
                        </div>
                    </a>
                    <input type="hidden" name="product_dt" value='<%=ProductList_1.getString("ProductID")%>' >
                </div>
                <%
                }
                %>
            </div>
            <h2>經典商品|獨角獸的尾羽</h2>
            <div class="list">
                <%
                sql = "SELECT * FROM PRODUCT WHERE `ClassID` = 'Class002' LIMIT 3";
                ResultSet ProductList_2 =  con.createStatement().executeQuery(sql);
                while(ProductList_2.next()){
            %>
                <div class="lattice">
                    <a class="btn1" href="<%= "introduce.jsp?id=" + ProductList_2.getString("ProductID") %>">
                        <div class="productImg">
                            <img src="<%=ProductList_2.getString("ImgUrl") %>" width="90%">
                        </div>
                        <div class="productIntro">
                            <%=ProductList_2.getString("ProductName") %>
                        </div>
                    </a>
                    <input type="hidden" name="product_dt" value='<%=ProductList_2.getString("ProductID")%>' >
                </div>
                <%
                }
                %>
            </div>
            <h2>經典商品|鳳凰的羽毛</h2>
            <div class="list">
                <%
                sql = "SELECT * FROM PRODUCT WHERE `ClassID` = 'Class003' LIMIT 3";
                ResultSet ProductList_3 =  con.createStatement().executeQuery(sql);
                while(ProductList_3.next()){
            %>
                <div class="lattice">
                    <a class="btn1" href="<%= "introduce.jsp?id=" + ProductList_3.getString("ProductID") %>">
                        <div class="productImg">
                            <img src="<%=ProductList_3.getString("ImgUrl") %>" width="90%">
                        </div>
                        <div class="productIntro">
                            <%=ProductList_3.getString("ProductName") %>
                        </div>
                    </a>
                    <input type="hidden" name="product_dt" value='<%=ProductList_3.getString("ProductID")%>' >
                </div>
                <%
                }
                %>
            </div>
        </div>
    </section>
    <div id="item" class="item">
        <!-- <h3>Is Life</h3>
        <p>CSS3 動畫模式彈出窗口，適用於單張相片瀏覽。</p> -->
        <img src="/assets/img/lottle.jpg">
        <b class="item-close js-popup-close">x</b>
    </div>

    <script>
        (function ($) {
            $(function () {
                $('.btn1').on('click', function () {
                    $('#item').popup({
                        time: 1000,
                        classAnimateShow: 'flipInX',
                        classAnimateHide: 'hinge',
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
    <%@include file="footer.jsp" %>
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