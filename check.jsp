<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
  String id = request.getParameter("account");
  String psw = request.getParameter("password");

  if( id.equals ("admin") &&  psw.equals ("1234")){
   session.setAttribute("account","admin");
   out.print("<script>alert('管理員登入成功！'); window.location='b_index.jsp' </script>");
  }
  else{


 //sql="SELECT * from member where `email`='"+id+"' and password='"+psw+"'" ;
 sql = "SELECT ClientID,ClientName,ClientAccount,ClientPassword,BirthDay,PhoneNumber,Mail,ClientPassword FROM CLIENTS WHERE `ClientAccount`=? AND ClientPassword=?";
 PreparedStatement pstmt = null;
 pstmt=con.prepareStatement(sql);
 pstmt.setString(1,request.getParameter("account"));
 pstmt.setString(2,request.getParameter("password"));
 //con.createStatement().execute(sql);

 //ResultSet rs=con.createStatement().executeQuery(sql);
 ResultSet paperrs = pstmt.executeQuery();

 if(paperrs.next()){
  session.setAttribute("account",paperrs.getString("ClientAccount"));
  session.setAttribute("name",paperrs.getString("ClientName"));
  session.setAttribute("birthday",paperrs.getString("BirthDay"));
  session.setAttribute("phone",paperrs.getString("PhoneNumber"));
  session.setAttribute("mail",paperrs.getString("Mail"));
  session.setAttribute("pwd",paperrs.getString("ClientPassword"));
  session.setAttribute("id",paperrs.getString("ClientID"));

  out.print("<script>alert('登入成功！');window.location='index.jsp'</script>");
  
 }
 else{
  out.print("<script>alert('登入失敗，請確認帳號密碼！');window.location='login.jsp'</script>");
 }
}
  
 /*while(rs.next()){
    
  session.setAttribute("email",id);
  out.print("<script>alert('登入成功!');window.location='index.jsp'</script>");

  
 }
 rs.last(); 

 if (rs.getRow() == 0)
 {
  out.print("<script>alert('登入失敗，請確認帳號密碼!');window.location='login.jsp'</script>");
 } */

 


%>