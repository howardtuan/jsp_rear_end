<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>奧利凡德 | Ollivanders 管理者介面</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="5; url=b_product.jsp">  
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
                <div class="main">
                    <%
                        String ProductID=request.getParameter("ProductID");
                        sql = "UPDATE PRODUCT SET `ProductName` = '" + ProductName + "',`Cost` = '" + Cost + "',`Price` = '" + Price + "',`ClassID` = '" + ClassID + "',`Wood` = '" + Wood + "',`Core` = '" + Core + "',`Lengths` = '" + Lengths + "',`Flexibility` = '" + Flexibility + "',`Introduce` = '" + Introduce + "',`Launched` = '" + Launched + "',`ImgUrl` = '" + ImgUrl + "' WHERE `ProductID` = '" + ProductID+ "';";
                        int no=con.createStatement().executeUpdate(sql);
					    if (no > 0){
                            out.println("<h1> 更改成功!五秒後跳回產品管理介面</h1>");
                        }else{
                            sql = "INSERT `PRODUCT`(`ProductID`,`ProductName`, `Cost`, `Price`, `ClassID`, `Wood`, `Core`, `Lengths`, `Flexibility`, `Introduce`, `Launched`, `ImgUrl`) VALUES('" + ProductID+ "','" + ProductName + "','" + Cost + "','" + Price + "','" + ClassID + "','" + Wood + "','" + Core + "','" + Lengths + "','" + Flexibility + "','" + Introduce + "','" + Launched + "','" + ImgUrl + "')";
                            no=con.createStatement().executeUpdate(sql);
                            if (no > 0){
                            out.println("<h1> 新增成功!五秒後跳回產品管理介面</h1>");
                        }
                        }
                        con.close(); 
                    
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