<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<section>
<%
    Integer Count = (Integer)application.getAttribute("Counter");
    if( Count ==null || Count == 0 ){
       Count = 0;
    }if(session.isNew()){
        Count+=1;
    }
    application.setAttribute("Counter", Count);
    %>
    
<div class="footerMain">
    Vistors：<%=Count%><br>
    © 2022 Ollivander ALL Rights Reserved
</div>
</section>