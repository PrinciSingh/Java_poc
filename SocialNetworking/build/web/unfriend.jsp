<%@page import="social.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String email1 =(String)session.getAttribute("email");
    String email2=request.getParameter("email2");
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("delete from friend where sendto='"+email1+"' and sendfrom='"+email2+"' or sendto='"+email2+"' and sendfrom='"+email1+"' and status='friend'");
    response.sendRedirect("friend_list.jsp");
%>