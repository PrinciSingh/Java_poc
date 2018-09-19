<%@page import="social.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String sendto = request.getParameter("sendto");
    String sendfrom = request.getParameter("sendfrom");
    String rdate = DateTime.getCurrentDateTime();

    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("insert into friend(sendto,sendfrom,joindate,status) values('"+sendto+"','"+sendfrom+"','"+rdate+"','no action')");
    response.sendRedirect("userhome.jsp"); 
%>