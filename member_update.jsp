<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%  
    
    String change_name = request.getParameter("update_name");
    String change_phone = request.getParameter("update_phone");
    String change_mail = request.getParameter("update_mail");
    sql="UPDATE CLIENTS SET `ClientName` = '"+change_name+"',`PhoneNumber` = '"+change_phone+"' ,`Mail` = '"+change_mail+"'  where ClientAccount='"+session.getAttribute("account")+"';";
    int no=con.createStatement().executeUpdate(sql);
	if (no>0){
        session.removeAttribute("account"); 
        out.print("<script>alert('會員資料已更新，請重新登入！'); window.location='login.jsp' </script>");
    }
    con.close();
%>