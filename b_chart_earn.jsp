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
        sql = "SELECT `total_cost`,`total_earn` FROM EARN_COST_VIEW LIMIT 1" ;
        ResultSet rs_earn=  con.createStatement().executeQuery(sql);
        int cost_int = 0;
        int earn_int = 0;
        if(rs_earn.next()){
            cost_int = rs_earn.getInt("total_cost");
            earn_int = rs_earn.getInt("total_earn");
            //cost_string = rs_earn.getString("total_cost");
            //out.println(cost_string);
        }
        //int cost_int = (int)Double.parseDouble(cost_string);
        //out.println(cost_int);
    %>
      

    
     <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
        
      function drawChart() {
           
        var data = google.visualization.arrayToDataTable([
          ['Task', '銷售數量'],
          ['進貨總成本',     <%=cost_int %>],
          ['銷售總利潤',     <%=earn_int %>]
        ]);

        var options = {
          title: '盈虧圖表',
          is3D: false
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

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
            <a href="b_chart_earn.jsp">盈虧比例</a>  

        </div>

        <div id="piechart" style="width: 1200px; height: 500px;"></div>
        
        
    
    
</body>
</html>