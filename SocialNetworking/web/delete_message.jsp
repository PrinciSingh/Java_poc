<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String email = (String)session.getAttribute("email");
    String msgid[] = request.getParameterValues("selectmsg");

    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    for(int i=0;i<msgid.length;i++)
    {
        st.execute("delete from message where msg_id='"+msgid[i]+"' and sendto='"+email+"'");
    }
    response.sendRedirect("user_inbox.jsp");
%>