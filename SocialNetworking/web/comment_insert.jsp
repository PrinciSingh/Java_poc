
<%@page import="social.DateTime"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String email = (String)session.getAttribute("email");
    String post_slno=request.getParameter("post_slno");
    String comment = request.getParameter("comment");
    String date = DateTime.getDateTime();

    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("insert into comment values('"+post_slno+"','"+email+"','"+comment+"','"+date+"')");
    
    response.sendRedirect("userhome.jsp");
%>