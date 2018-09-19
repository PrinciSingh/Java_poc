<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String email = (String)session.getAttribute("email");
    String curpassword = request.getParameter("curpassword");
    String newpassword = request.getParameter("newpassword");

    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select pwd from userreg where email='"+email+"'");
    if(rs.next())
    {
        String regpassword = rs.getString("pwd");
        if(regpassword.equals(curpassword))
        {
            Statement stmt = con.createStatement();
            stmt.execute("update userreg set pwd='"+newpassword+"' where email='"+email+"'");
            response.sendRedirect("userhome.jsp");
        }
        else
        {
            String msg = "Invalid Current Password";
            response.sendRedirect("privacy_settings.jsp?msg="+msg);
        }
    }
%>