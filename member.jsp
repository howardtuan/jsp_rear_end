<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/member.css">
    <link rel="icon" href="assets/img/wand.png">
    <title>奧利凡德</title>
</head>
<body class="index_body">
    <section>   <!--導覽列-->
        <%@include file="header.jsp" %>
    </section>

    <section>
        <div class="member_detail">
        
        
            <form method=post action="member_update.jsp" >
                <img src="assets/img/member.png" width="80" class="detail_img">
                    


                   <div class="detail">
                       <p class="memberID">會員資料:</p>
                       <input type="text" value="<%=session.getAttribute("name") %>" name="update_name" placeholder="會員名稱"  class="input"/>
                   </div>

                    
                   <div class="detail1">
                        <input type="text" value="<%=session.getAttribute("birthday") %>" name="update_birthday" readonly="readonly" class="input"/>
                   </div>
                          
                   <div class="detail1">
                        <input type="text" value="<%=session.getAttribute("phone") %>"  name="update_phone" placeholder="09xxxxxxxx" class="input" />
                   </div>
                    
                   <div class="detail1">
                    <input type="text" value="<%=session.getAttribute("mail") %>" name="update_mail" placeholder="電子郵件帳號" class="input"/>
                   </div> 

                   <div class="detail1">
                       <input type="checkbox" name="" value="" class="check"/>我願意收到最新優惠資訊
                       <input type="submit" name="" value="修改" class="button" />
                   </div>

        


            </form>
        </div>

        <div class="password_change">
            <form method="post" action="password_update.jsp">
                <div class="password">
                    <p class="memberID">修改密碼</p>
                    <input type="password" value="<%=session.getAttribute("pwd") %>" name="old_password" placeholder="請輸入密碼" readonly="readonly" class="input"/>
                </div>

                <div class="detail1">
                    <input type="password" name="new_password1" placeholder="新密碼"  class="input"/>
                </div>

                <div class="detail1">
                    <input type="password" name="new_password2" placeholder="請再輸入一次新密碼"  class="input"/>
                </div>

                <div class="detail">
                    <input type="submit" name="" value="儲存" class="button" />
                </div>
            </form>
        </div>
        
        <div class="member_order">
                <div class="detail2">
                    <p class="shoplist">購買紀錄</p>
                </div>
                <%
                    sql = "call member_detail_ANY('"+session.getAttribute("id")+"')";
                    con.createStatement().execute(sql);
                    ResultSet rr=con.createStatement().executeQuery(sql);
                    while(rr.next()) {
                %>
                
                <div class="order_back">
                    <div class="order_img">
                        <img src="<%=rr.getString("ImgUrl")%>" width="200" class="img_detail">
                    </div>
                    <div class="order_text">
                        <span class="smallword">訂單編號：<%=rr.getString("OrderID")%></span><br>
                        <span class="smallword"><%=rr.getString("ProductName")%></span><br>
                        <span class="smallword">數量 : </span> <span class="smallword"><%=rr.getString("Quantity")%></span><br>
                        <span class="smallword">總計 : </span> <span class="smallword"><%=rr.getString("total")%></span><br>
                        
                    </div>
                    
                </div>
                <%}%>
                
        </div>
            
        
    </section>
    <%@include file="footer.jsp" %>
</body>
</html>