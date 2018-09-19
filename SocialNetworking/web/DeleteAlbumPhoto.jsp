<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();

    String imgno = request.getParameter("imgno");
    st.execute("delete from album_details where image_slno='"+imgno+"'");
    response.sendRedirect("photos.jsp");
%>