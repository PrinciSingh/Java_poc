<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String album_slno = request.getParameter("album_slno");

    Connection con = DbConnection.getConnect();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    st1.execute("delete from album_master where album_slno='"+album_slno+"'");
    st2.execute("delete from album_details where album_slno='"+album_slno+"'");
    response.sendRedirect("photos.jsp");
%>