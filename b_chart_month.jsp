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
        
        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='January';" ;
        ResultSet rs_month1= con.createStatement().executeQuery(sql);
        int January_count = 0;
        if(rs_month1.next()){
            January_count += rs_month1.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='February';" ;
        ResultSet rs_month2= con.createStatement().executeQuery(sql);
        int February_count = 0;
        if(rs_month2.next()){
            February_count += rs_month2.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='March';" ;
        ResultSet rs_month3= con.createStatement().executeQuery(sql);
        int March_count = 0;
        if(rs_month3.next()){
            March_count += rs_month3.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='April';" ;
        ResultSet rs_month4= con.createStatement().executeQuery(sql);
        int April_count = 0;
        if(rs_month4.next()){
            April_count += rs_month4.getInt("count(*)");
        }
        
        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='May';" ;
        ResultSet rs_month5= con.createStatement().executeQuery(sql);
        int May_count = 0;
        if(rs_month5.next()){
            May_count += rs_month5.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='June';" ;
        ResultSet rs_month6= con.createStatement().executeQuery(sql);
        int June_count = 0;
        if(rs_month6.next()){
            June_count += rs_month6.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='July';" ;
        ResultSet rs_month7= con.createStatement().executeQuery(sql);
        int July_count = 0;
        if(rs_month7.next()){
            July_count += rs_month7.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='August';" ;
        ResultSet rs_month8= con.createStatement().executeQuery(sql);
        int August_count = 0;
        if(rs_month8.next()){
            August_count += rs_month8.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='September';" ;
        ResultSet rs_month9= con.createStatement().executeQuery(sql);
        int September_count = 0;
        if(rs_month9.next()){
            September_count += rs_month9.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='October';" ;
        ResultSet rs_month10= con.createStatement().executeQuery(sql);
        int October_count = 0;
        if(rs_month10.next()){
            October_count += rs_month10.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='November';" ;
        ResultSet rs_month11= con.createStatement().executeQuery(sql);
        int November_count = 0;
        if(rs_month11.next()){
            November_count += rs_month11.getInt("count(*)");
        }
        

        sql = "select count(*) from ORDERS where MONTHNAME(OrderDate)='December';" ;
        ResultSet rs_month12= con.createStatement().executeQuery(sql);
        int December_count = 0;
        if(rs_month12.next()){
            December_count += rs_month12.getInt("count(*)");
        }
        

        //int cost_int = (int)Double.parseDouble(cost_string);
        //out.println(cost_int);
        
    %>
      

    
     <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
        
      function drawChart() {
           
        var data = google.visualization.arrayToDataTable([
          ['Task', '訂單數量'],
        <%
            if(January_count>0){
        %>['一月',     <%=January_count %>],
        <% }
        %>
         <%
            if(February_count>0){
        %>['二月',     <%=February_count %>],
        <% }
        %>
         <%
            if(March_count>0){
        %>['三月',     <%=March_count %>],
        <% }
        %>
         <%
            if(April_count>0){
        %>['四月',     <%=April_count %>],
        <% }
        %>
         <%
            if(May_count>0){
        %>['五月',     <%=May_count %>],
        <% }
        %>
         <%
            if(June_count>0){
        %>['六月',     <%=June_count %>],
        <% }
        %>
         <%
            if(July_count>0){
        %>['七月',     <%=July_count %>],
        <% }
        %>
         <%
            if(August_count>0){
        %>['八月',     <%=August_count %>],
        <% }
        %>
         <%
            if(September_count>0){
        %>['九月',     <%=September_count %>],
        <% }
        %>
         <%
            if(October_count>0){
        %>['十月',     <%=October_count %>],
        <% }
        %>
         <%
            if(November_count>0){
        %>['十一月',     <%=November_count %>],
        <% }
        %>
        <%
            if(December_count>0){
        %>['十二月',     <%=December_count %>],
        <% }
        %>
        ]);

        var options = {
          title: '月訂單量',
          is3D: false
        };

        var chart = new google.visualization.LineChart(document.getElementById('linechart'));

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
            <a href="b_chart_month.jsp">月訂單量</a>  

        </div>

        <div id="linechart" style="width: 1200px; height: 500px;"></div>
        
        
    
    
</body>
</html>