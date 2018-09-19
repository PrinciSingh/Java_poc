<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%
    String email = request.getParameter("email");
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("update userreg set status='Active' where email='"+email+"'");
    response.sendRedirect("admin_area.jsp");
%>