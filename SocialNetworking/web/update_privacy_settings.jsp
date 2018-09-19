<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String email = (String)session.getAttribute("email");
    String remail = request.getParameter("remail");
    String rmobno = request.getParameter("rmno");
    String rphoto = request.getParameter("rphoto");
    String rfriend = request.getParameter("rfriend");

    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("update privacy_settings set rest_on_email='"+remail+"',rest_on_mobile='"+rmobno+"',rest_on_photos='"+rphoto+"',rest_on_friends='"+rfriend+"' where email='"+email+"'");
    
    response.sendRedirect("privacy_settings.jsp");
%>