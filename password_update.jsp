<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%  
    
    String old_password = request.getParameter("old_password");
    String new_password1 = request.getParameter("new_password1");
    String new_password2 = request.getParameter("new_password2");
    if(new_password1==""||new_password2==""){
		out.print("<script>alert('修改失敗，各項欄位不得為空！');window.location='member.jsp'</script>");
        con.close();
	} 
    else if(!new_password1.equals(new_password2)){
        out.print("<script>alert('重複密碼輸入不一致，請再試一次');window.location='member.jsp'</script>");
        con.close();
    }
    else if(new_password1.equals(old_password)){
        out.print("<script>alert('不能重覆設定原來的密碼，請再試一次');window.location='member.jsp'</script>");
        con.close();
    }
    else if(new_password1.equals(new_password2)){
        sql="UPDATE CLIENTS SET `ClientPassword` = '"+new_password1+"' where ClientAccount='"+session.getAttribute("account")+"';";
        int no=con.createStatement().executeUpdate(sql);
    
	    if (no>0){
            session.removeAttribute("account"); 
            out.print("<script>alert('密碼變更成功，請重新登入！'); window.location='login.jsp' </script>");
        }
        con.close();
    }
    
%>