<%@page import="social.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String sendto = request.getParameter("sendto");
    String sendfrom = request.getParameter("sendfrom");
 
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("delete from friend where sendto='"+sendto+"' and sendfrom='"+sendfrom+"'");
    response.sendRedirect("userhome.jsp");
%>