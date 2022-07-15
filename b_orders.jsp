<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>奧利凡德 | Ollivanders 管理者介面</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/admin.css">
</head>

<body>
    <div class="container">
        <div class="header">
            <h1 id="SiteName">奧利凡德 | Ollivanders 管理者介面</h1>
            <div class="Tools">
                
                <a href="logout.jsp">登出</a>
            </div>
        </div>
        <div class="breadcrumbs">
            <a href="b_index.jsp">管理首頁</a> > 
            <a href="b_orders.jsp">瀏覽訂單資訊</a>
        </div>
        <div class="main" id="main">
            <div class="content">
            <div class="top">
                <h2>瀏覽 訂單 資訊</h2>
            </div>
                <div class="main">
                <%
                sql = "SELECT * FROM `ORDERS` ORDER BY `OrderID` DESC;" ;
                ResultSet OrderList =  con.createStatement().executeQuery(sql) ; 
                while(OrderList.next()){
                    sql = "SELECT * FROM `CLIENTS` WHERE `CLIENTID` = '"+OrderList.getString("ClientID")+"'";
                    ResultSet Client =  con.createStatement().executeQuery(sql); 
                    while(Client.next()){
                %>
                    <button type="button" class="collapsible"><%=OrderList.getString("OrderDate")%> 客戶 : <%= " "+Client.getString("ClientName")%> </button>
                    <div class="ListContent">
                            <span>訂單ID :</span><%=" " + OrderList.getString(1)%><br>
                            <span>是否付款 : </span><%=" " + OrderList.getString(4)%><br>
                            <span>是否出貨 : </span><%=" " + OrderList.getString(5)%><br>
                            <%
                            int total = 0;
                            sql = "SELECT * FROM `ORDERS_DETAILS` WHERE `OrderID` = '"+OrderList.getString("OrderID")+"'";
                            ResultSet OrdersDeatils =  con.createStatement().executeQuery(sql); 
                            while(OrdersDeatils.next()){
                            %>
                            <hr>
                            <span>明細ID :</span><%=" " + OrdersDeatils.getString(1)%><br>
                            <%
                            sql = "SELECT * FROM `PRODUCT` WHERE `ProductID` = '"+OrdersDeatils.getString("ProductID")+"'";
                            ResultSet Product =  con.createStatement().executeQuery(sql); 
                            while(Product.next()){
                            %>
                            <span>產品 :</span></span><%=" " + Product.getString(2)%><br>
                            <span>數量 :</span><%=" " + OrdersDeatils.getString(4)%><br>
                            <%
                            int cnt = Integer.parseInt(OrdersDeatils.getString(4)) * Integer.parseInt(Product.getString("Price"));
                            total = total + cnt;
                            %>
                            <span>小記 :</span><%=" " + cnt%>元<br>
                            <%
                            }
                            }
                            %>
                            <hr>
                            <span>總計 :</span><%=" " + total%>元
                    </div>
                <%
                    }
                }
                %>
                </div>
            </div>
            <div id="footer">

            </div>
        </div>
    </div>
    <script src="assets/js/admin.js"></script>

</body>

</html>