<%@page import="java.sql.Statement"%>
<%@page import="social.DateTime"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String email = (String)session.getAttribute("email");
    String title = request.getParameter("title");
    String accesstype = request.getParameter("accesstype");
    String desc = request.getParameter("description");
    String date = DateTime.getCurrentDateTime();
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("insert into album_master (email,album_title,description,date_created,date_updated,album_access) values ('"+email+"','"+title+"','"+desc+"','"+date+"','"+date+"','"+accesstype+"')");
    response.sendRedirect("http://localhost:8084/SocialNetworking/CreateAlbum");
%>