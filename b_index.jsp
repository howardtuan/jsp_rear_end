<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
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
        <div class="main" id="main">
            <div class="content">
                <div class="main">
                    <table>
                        <caption> 相關資料 </caption>
                        <!-- <tr>
                            <th scope="row"><a href="">產品類別</a>
                            </th>
                            <td><a href="" class="addlink">新增</a></td>
                            <td><a href="" class="changelink">變更</a></td>
                        </tr> -->
                        <tr>
                            <th scope="row"><a href="b_product.jsp">產品資料</a>
                            </th>
                            <td><a href="b_add.jsp" class="addlink">新增</a></td>
                            <td><a href="b_product.jsp" class="changelink">變更</a></td>
                        </tr>
                        <!-- <tr>
                            <th scope="row"><a href="">進貨紀錄</a>
                            </th>
                            <td><a href="" class="addlink">新增</a></td>
                            <td><a href="" class="changelink">變更</a></td>
                        </tr> -->
                        <tr>
                            <th scope="row"><a href="b_orders.jsp">銷貨紀錄</a>
                            </th>
                        </tr>
                        <tr>
                            <th scope="row"><a href="b_chart.jsp">圖表分析</a>
                            </th>
                        </tr>
                    </table>
                    <!-- <table>
                        <caption> 人員資料 </caption>
                        <tr>
                            <th scope="row"><a href="">供應商資料</a>
                            </th>
                            <td><a href="" class="addlink">新增</a></td>
                            <td><a href="" class="changelink">變更</a></td>
                        </tr>
                        <tr>
                            <th scope="row"><a href="">客戶資料</a>
                            </th>
                            <td><a href="" class="addlink">新增</a></td>
                            <td><a href="" class="changelink">變更</a></td>
                        </tr>
                        <tr>
                            <th scope="row"><a href="">部門資料</a>
                            </th>
                            <td><a href="" class="addlink">新增</a></td>
                            <td><a href="" class="changelink">變更</a></td>
                        </tr>
                        <tr>
                            <th scope="row"><a href="">員工資料</a>
                            </th>
                            <td><a href="" class="addlink">新增</a></td>
                            <td><a href="" class="changelink">變更</a></td>
                        </tr> -->
                    </table>
                </div> 
            </div>
            <div id="footer">

            </div>
        </div>
    </div>
</body>

</html>