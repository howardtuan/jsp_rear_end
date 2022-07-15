<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
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
            <a href="b_chart.jsp">圖表分析</a>
        </div>

        <div class="main" id="main">
            <div class="content">
                <div class="main">
                    <table>
                        <caption> 各式圖表分析 </caption>
                        
                        <tr>
                            <th scope="row"><a href="b_chart_sell.jsp">產品銷量</a>
                            </th>
                        </tr>
                        <tr>
                            <th scope="row"><a href="b_chart_earn.jsp">盈虧比例</a>
                            </th>
                        </tr>
                        <tr>
                            <th scope="row"><a href="b_chart_costumer.jsp">顧客排行</a>
                            </th>
                        </tr>
                        <tr>
                            <th scope="row"><a href="b_chart_month.jsp">月訂單量</a>
                            </th>
                        </tr>
                    </table>
                    
                    </table>
                </div> 
            </div>

    
    
</body>
</html>