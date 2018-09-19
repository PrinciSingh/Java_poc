<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String email = request.getParameter("email");
    String code = request.getParameter("code");
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from forgotpasswordcode where email='"+email+"'");
    if(rs.next())
    {
        String dbcode=rs.getString("code");
        if(code.equals(dbcode))
        {
            Statement stmt = con.createStatement();
            st.execute("delete from forgotpasswordcode where email='"+email+"'");
            response.sendRedirect("change_password.jsp?email="+email);
        }
        else
        {
            String msg="Invalid Code.";
            response.sendRedirect("forgot_password_code.jsp?msg="+msg);
        }
    }
    else
    {
        response.sendRedirect("forgot_password.jsp");
    }
%>