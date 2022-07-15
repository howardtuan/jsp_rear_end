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
           <a href="b_index.jsp">管理首頁</a>
        </div>
        <div class="main" id="main">
            <div class="content">
            <div class="top">
                <h2>新增 產品 資訊</h2>
            </div>
            <%
                        sql = "SELECT * FROM `PRODUCT`" ;
                        ResultSet ProductList=  con.createStatement().executeQuery(sql);
                        int lastid = 0;
                        while(ProductList.next()){
                            if((Integer.parseInt(ProductList.getString("ProductID"))-lastid) != 1){
                             
                                break;
                            }else{
                                lastid = Integer.parseInt(ProductList.getString("ProductID"));
                            }
                        }
                        lastid+=1;
                        String strLastID = Integer.toString(lastid);
                    %>
                <div class="main">
                    <form method="post" action="b_update.jsp" class="AddForm">
                            <span>產品ID</span>
                            <input type="text" name="ProductID" readonly = "readonly" value="<%=strLastID%>"><br>
                            <span>產品名稱</span>
                            <input type="text" name="ProductName" value=""><br>
                            <span>單件成本</span>
                            <input type="text" name="Cost" value=""><br>
                            <span>單件售價</span>
                            <input type="text" name="Price" value=""><br>
                            <span>類別ID</span>
                            <input type="text" name="ClassID" value=""><br>
                            <span>木材</span>
                            <input type="text" name="Wood" value=""><br>
                            <span>杖心</span>
                            <input type="text" name="Core" value=""><br>
                            <span>長度</span>
                            <input type="text" name="Lengths" value=""><br>
                            <span>彈性</span>
                            <input type="text" name="Flexibility" value=""><br>
                            <span>介紹</span><br>
                            <textarea name="Introduce"></textarea><br>
                            <span>上架</span>
                            <input type="text" name="Launched" value=""><br>
                            <span>圖片連結</span>
                            <input type="text" name="ImgUrl" value=""><br>

                            <input type="submit" class="submit" name="add" value="確定新增">
                        </form>
                </div>
            </div>
            <div id="footer">

            </div>
        </div>
    </div>
    <script src="assets/js/admin.js"></script>

</body>

</html>