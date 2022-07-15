<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%=session.getAttribute("id") %>

<%
    int count_error = 1;
    String count_error_name ="";
    //sql = "insert `ORDERS`(ClientID) values('"+session.getAttribute("id")+"');";
    //con.createStatement().execute(sql);
    sql = "select OrderID from ORDERS ORDER BY OrderID DESC LIMIT 0 , 1;";
    PreparedStatement pstmt3 = null;
    pstmt3=con.prepareStatement(sql);
    ResultSet cart_orderid = pstmt3.executeQuery();
    if(cart_orderid.next()){
        session.setAttribute("orderid",cart_orderid.getString("OrderID"));
    }
    String new_orderid_s = cart_orderid.getString("OrderID") ;
    int new_orderid_i = Integer.valueOf(new_orderid_s).intValue() + 1;
    sql = "insert `ORDERS`(ClientID,OrderDate) values('"+session.getAttribute("id")+"',now());";
    con.createStatement().executeUpdate(sql);
    
    sql = "call OLLIVANDERS_WAND_SHOP.cart_ANY('"+session.getAttribute("id")+"');";
    con.createStatement().execute(sql);
    ResultSet cart_check=con.createStatement().executeQuery(sql);
    while(cart_check.next()) {
        sql = "CALL STOCK_ANY("+ cart_check.getString("ProductID") +")";
        ResultSet rs_stock_check =  con.createStatement().executeQuery(sql);
        while(rs_stock_check.next()){
            if(cart_check.getInt("Quantity")<=rs_stock_check.getInt("庫存")){
                count_error *=1;
                //sql = "insert `ORDERS_DETAILS`(OrderID,ProductID,Quantity) values('"+new_orderid_i+"','"+cart_check.getString("ProductID")+"','"+cart_check.getString("Quantity")+"');";
                //con.createStatement().execute(sql);
            }else{
                count_error *=0;
                count_error_name+=cart_check.getString("ProductName")+"   ";
                //out.print("<script>alert('有產品數量大於庫存，請檢查您的購買數量'); window.location='shoppingcar.jsp'</script>");
            }
        }
    }
    if(count_error != 0){
        sql = "call OLLIVANDERS_WAND_SHOP.cart_ANY('"+session.getAttribute("id")+"');";
        con.createStatement().execute(sql);
        ResultSet cart_check2=con.createStatement().executeQuery(sql);
        while(cart_check2.next()) {
            sql = "insert `ORDERS_DETAILS`(OrderID,ProductID,Quantity) values('"+new_orderid_i+"','"+cart_check2.getString("ProductID")+"','"+cart_check2.getString("Quantity")+"');";
            con.createStatement().execute(sql);
        }
        //下面為清空購物車語法
        sql = "DELETE FROM CART WHERE CART.ClientID='" + session.getAttribute("id")+ "';";
        int no=con.createStatement().executeUpdate(sql);
        if (no > 0){
            out.print("<script>window.location='shoppingcar.jsp'</script>");
        }
    }else{
        //sql = "delete from ORDERS where OrderID = "+new_orderid_i+ ";";
        //con.createStatement().executeUpdate(sql);
        out.print("<script>alert('「"+count_error_name+"」數量大於庫存，請檢查您的購買數量'); window.location='shoppingcar.jsp'</script>");
    }
    
    con.close();
    %>
    

