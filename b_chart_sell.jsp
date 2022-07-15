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
<%
        sql = "SELECT `ProductName`,`銷貨` FROM STOCK_VIEW" ;
        ResultSet ProductList2=  con.createStatement().executeQuery(sql);
        
    %>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
        
      function drawChart() {
           
        var data = google.visualization.arrayToDataTable([
          ['Task', '銷售數量'],

        <% while(ProductList2.next()){%>
        ['<%=ProductList2.getString("ProductName") %>',     <%=ProductList2.getString("銷貨") %>],
        <% } %>
          
        ]);

        var options = {
          title: '產品銷量圖表',
          is3D: false
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('Columnchart'));

        chart.draw(data, options);
      }
    </script>

    <div class="container">

        <div class="header">
            <h1 id="SiteName">奧利凡德 | Ollivanders 管理者介面</h1>
            <div class="Tools">
                <a href="logout.jsp">登出</a>
            </div>
        </div>
        <div class="breadcrumbs">
            <a href="b_index.jsp">管理首頁</a> > 
            <a href="b_chart.jsp">圖表分析</a> >
            <a href="b_chart_sell.jsp">產品銷量</a>  

        </div>

        <div id="Columnchart" style="width: 1200px; height: 500px;"></div>
        

    
    
</body>
</html>