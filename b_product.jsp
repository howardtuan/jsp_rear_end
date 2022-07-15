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
            <a href="b_product.jsp">產品變更</a>
        </div>
        <div class="main" id="main">
            <div class="content">
                <div class="main">
                <div class="top">
                    <h2> 選擇 產品 做變更</h2>
                    <a class="AddButton" href="b_add.jsp">新增產品</a>
                </div>
                    <%
                        sql = "SELECT * FROM `PRODUCT`" ;
                        ResultSet ProductList=  con.createStatement().executeQuery(sql);
                        while(ProductList.next()){
                    %>
                    <button type="button" class="collapsible"><%=ProductList.getString("ProductName")%></button>
                    <div class="ListContent">
                        <form method="post" action="b_update.jsp">
                            <span>產品ID</span>
                            <input type="text" name="ProductID" readonly = "readonly" value="<%=ProductList.getString(1)%>"><br>
                            <span>產品名稱</span>
                            <input type="text" name="ProductName" value="<%=ProductList.getString(2)%>"><br>
                            <span>單件成本</span>
                            <input type="text" name="Cost" value="<%=ProductList.getString(3)%>"><br>
                            <span>單件售價</span>
                            <input type="text" name="Price" value="<%=ProductList.getString(4)%>"><br>
                            <span>類別ID</span>
                            <input type="text" name="ClassID" value="<%=ProductList.getString(5)%>"><br>
                            <span>木材</span>
                            <input type="text" name="Wood" value="<%=ProductList.getString(6)%>"><br>
                            <span>杖心</span>
                            <input type="text" name="Core" value="<%=ProductList.getString(7)%>"><br>
                            <span>長度</span>
                            <input type="text" name="Lengths" value="<%=ProductList.getString(8)%>"><br>
                            <span>彈性</span>
                            <input type="text" name="Flexibility" value="<%=ProductList.getString(9)%>"><br>
                            <span>介紹</span><br>
                            <textarea name="Introduce"><%=ProductList.getString(10)%>
                            </textarea><br>
                            <span>上架</span>
                            <input type="text" name="Launched" value="<%=ProductList.getString(11)%>"><br>
                            <span>圖片連結</span>
                            <input type="text" name="ImgUrl" value="<%=ProductList.getString(12)%>"><br>

                            <input type="submit" class="submit" name="delete" value="刪除">
                            <input type="submit" class="submit" name="edit" value="確定修改">
                        </form>
                    </div>
                    <%
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