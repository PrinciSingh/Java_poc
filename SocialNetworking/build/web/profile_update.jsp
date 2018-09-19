<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String email = (String)session.getAttribute("email");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String mobno=request.getParameter("mobno");
    String dob=request.getParameter("dob");

    Connection con = DbConnection.getConnect();
    Statement st=con.createStatement();
    st.execute("update userreg set fname='"+fname+"',lname='"+lname+"',tel='"+mobno+"',dob='"+dob+"' where email='"+email+"'");
    response.sendRedirect("user_profile.jsp");
%>
