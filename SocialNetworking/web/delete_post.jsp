<%-- 
    Document   : delete_post
    Created on : Jan 12, 2014, 12:37:12 AM
    Author     : A1
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String post_slno = request.getParameter("post_slno");
    Connection con =DbConnection.getConnect();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    Statement st4 = con.createStatement();
    st1.execute("delete from post where post_slno='"+post_slno+"'" );
    st2.execute("delete from like_count where post_slno='"+post_slno+"'" );
    st3.execute("delete from like_counter where post_slno='"+post_slno+"'" );
    st4.execute("delete from comment where post_slno='"+post_slno+"'");
    response.sendRedirect("userhome.jsp");
%>