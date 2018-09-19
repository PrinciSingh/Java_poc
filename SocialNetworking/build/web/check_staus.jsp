<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String eid = request.getParameter("eid");
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from userreg where email='"+eid+"'");
    if(rs.next())
    {
        out.println("yes");
    }
    else
    {
        out.println("no");
    }
%>