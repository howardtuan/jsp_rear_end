<meta http-equiv=“Content-Type” content=“text/html; charset=utf-8”>
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*,java.util.*"%>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	
		try {   
			
                
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");
                String sql="use OLLIVANDERS_WAND_SHOP";
                con.createStatement().execute(sql);
				
				String name=request.getParameter("name");
				
				String id=request.getParameter("account");
				String pwd=request.getParameter("password");
				String pwd2=request.getParameter("password_2");
				String birth=request.getParameter("birthday");
                String phone=request.getParameter("phone");
				sql = "SELECT count(*) as count FROM CLIENTS WHERE ClientAccount = '"+id+"';";
				ResultSet rs=con.createStatement().executeQuery(sql);
				int count = 0;
				if(rs.next()){
					count = rs.getInt("count");
				}
				
				if(count == 0) {
    				if(name==""||id==""||pwd==""||birth==""||phone==""){
						out.print("<script>alert('註冊失敗，所有欄位不得為空，返回註冊');window.location='signup.jsp'</script>");
					}
					else if(!pwd.equals(pwd2)){
						out.print("<script>alert('註冊失敗，請確認密碼是否皆輸入正確，返回註冊');window.location='signup.jsp'</script>");
					}
					else{	
						try{
				 			sql = "insert `CLIENTS`(ClientName , ClientAccount, ClientPassword,BirthDay,PhoneNumber,Mail) values('"+name+"','"+id+"','"+pwd+"','"+birth+"','"+phone+"','')";
							con.createStatement().execute(sql);
							out.print("<script>alert('註冊成功，返回登入');window.location='login.jsp'</script>");
				
						}
						catch(SQLException sExec){
							out.print("<script>alert('註冊失敗，該帳號存在或有其他問題，返回註冊');window.location='signup.jsp'</script>");
						}
					}
				}else{
					out.print("<script>alert('註冊失敗，此帳號已被註冊，返回註冊');window.location='signup.jsp'</script>");
				}	
		}
		
		
		
		catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
%>