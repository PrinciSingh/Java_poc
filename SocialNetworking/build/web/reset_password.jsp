<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");

    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("update userreg set pwd='"+password+"' where email='"+email+"'");
    response.sendRedirect("index.jsp");
%>