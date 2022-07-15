<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/shoppingcar.css?20220610">
    <link rel="icon" href="assets/img/wand.png">
    <title>奧利凡德</title>
    
</head>
<body class="index_body">

    <section>   <!--導覽列-->
        <%@include file="header.jsp" %>
    </section>
    <%if(session.getAttribute("account")==null){
			out.print("<script>alert('你不是會員 請你離開'); window.location='login.jsp'</script>");
	}%>
    <div class="back"><input type ="button" onclick="history.back()" value="回到上一頁" ></input></div>
    <section class="none">
        <div class="block_left">
            <div class="block">
                <p class="title">購物車</p>
                <p class="small">Your shopping bag</p>
                <%
                    sql = "call OLLIVANDERS_WAND_SHOP.cart_ANY('"+session.getAttribute("id")+"');";
                    con.createStatement().execute(sql);
                    ResultSet cart=con.createStatement().executeQuery(sql);
                    int total_money= 0;
                    int total_count= 0;
                    while(cart.next()) {
                    String total_spent_s = cart.getString("total");
                    String total_count_s = cart.getString("Quantity");
                %>
                    
                <div class="order_back">
                    <div class="order_img">
                        <img src="<%=cart.getString("ImgUrl")%>" width="170" class="img_detail">
                    </div>
                    <div class="order_text">
                        
                        <span class="smallword"><%=cart.getString("ProductName")%></span><br>
                        <span class="smallword">數量 : </span> <span class="smallword"><%=total_count_s%></span><br>
                        <span class="smallword">總計 : </span> <span class="smallword">$<%=total_spent_s%></span><br>
                        
                    </div>
                    <form method="post" action="cart_delet.jsp">
                        <button class="delet" name="delet_b" value="<%=cart.getString("ProductID") %>">x</button>
                    </form>
                </div>
                    <%  
                        int total_spent_int = Integer.valueOf(total_spent_s).intValue();
                        total_money += total_spent_int;

                        int total_count_int = Integer.valueOf(total_count_s).intValue();
                        total_count += total_count_int;
                    %>
        
                <%}
                %>
                
            </div>
        </div>

        <div class="block_right">
            <div class="block">
                <p class="title">付款方式</p>
                <p class="small">Payment method</p>
                  <form method="post" action="checkout.jsp">
                      <div class="select_block">
                            <select size="1" name="place" class="select" id="place">
                                <option value="">台灣及離島</option>
                                <option value="">英國及歐洲地區</option>
                                <option value="">美國地區</option>
                                <option value="">霍格華茲</option>
                            </select>
                            <label class="active">配送區域</label>
                   
                      </div>

                      <div class="radio_block">
                          <div class="payment">
                              <span>付款方式</span>
                          </div>
                                <div class="payword">
                                   <input type="radio" name="pay" value="" id="pay" checked />貨到付款(超商)
                                   <br>
                                </div>    
                                <div class="payword">
                                    <input type="radio" name="pay" value="" id="pay"/>貨到付款(宅配)
                                    <br>
                                </div>
                                <div class="payword">
                                    <input type="radio" name="pay" value="" id="pay"/>信用卡線上刷卡
                                    <br>
                                </div>
                                <div class="payword">
                                    <input type="radio" name="pay" value="" id="pay"/>加隆
                                </div>
                      </div>
                        

                      <div class="select_block">
                        <select size="1" name="get" class="select" id="get">
                            <option value="">全家超商取貨</option>
                            <option value="">711超商取貨</option>
                            <option value="">宅配到府</option>
                        </select>
                        <label class="active">運送方式</label>
                      </div>

                      <div class="select_block">
                        <input type="text" name="adress" placeholder="請輸入地址"  class="write" id="adress" required="required"/>
                        <label class="active">填寫地址</label>
                      </div>
                      <!--
                      <div class="select_block">
                        <input type="text" name="discount" placeholder="請輸入優惠碼"  value="88" class="write">
                        <label class="active">優惠碼</label>
                      </div>
                      <%=request.getParameter("discount")%>
                        -->
                    
                      <div class="total">
                          <span class="ordertitle">商品總數</span> <span class="ordervalue"><%=total_count %> </span><br>
                          <span class="ordertitle">商品總金額</span> <span class="ordervalue"><%=total_money %> </span><br>
                          <span class="ordertitle">運費</span> <span class="ordervalue">80</span><br>
                          <span class="orderall">總金額</span> <span class="orderallvalue">NT.<%=total_money+80 %></span><br> 
                      </div>
                        <%
                            if((total_money+80) > 80){
                        %>
                            <input type="submit" name="" value="COTINUE →" class="button" />
                        <%
                            }else{
                        %>
                            <input type="submit" name="" value="COTINUE →" class="button2" disabled="disabled"/>
                        <%
                            }
                        %>  
                      
                  </form>
                  

            </div>
        </div>
    </section>
    <%@include file="footer.jsp" %>
    

</body>
</html>