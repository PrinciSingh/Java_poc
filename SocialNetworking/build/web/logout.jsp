<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%@page import="social.DateTime"%>
<%
    String email = (String)session.getAttribute("email");
    String curdate = DateTime.getCurrentDateTime();
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    st.execute("update user_status_info set last_login_date='"+curdate+"' where email='"+email+"'");
    session.invalidate();
    st1.execute("update user_status_info set status='offline' where email='"+email+"'");
    response.sendRedirect("index.jsp");
%>