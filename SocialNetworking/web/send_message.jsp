<%@page import="social.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String sender_email = (String)session.getAttribute("email");
    String sendto_email = request.getParameter("fr_name");
    String msgtext = request.getParameter("msgtext");
    String msgstatus="";
    String send_date= DateTime.getCurrentDateTime();
    Connection con = DbConnection.getConnect();
    Statement st=con.createStatement();
    st.execute("insert into message (msg,sendto,sendfrom,date_send,status) values('"+msgtext+"','"+sendto_email+"','"+sender_email+"','"+send_date+"','unread')");
    msgstatus="Message Sent Successfully";
    response.sendRedirect("user_inbox.jsp");
%>