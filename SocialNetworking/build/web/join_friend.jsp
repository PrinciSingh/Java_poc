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
    st.execute("update friend set joindate='"+rdate+"',status='friend' where sendto='"+sendto+"' and sendfrom='"+sendfrom+"'");
    st.execute("insert into friend(sendto,sendfrom,joindate,status) values('"+sendfrom+"','"+sendto+"','"+rdate+"','friend')");
    response.sendRedirect("userhome.jsp");
%>