<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    String status="";
    ResultSet rs =st.executeQuery("select * from userreg where email='"+userid+"' and pwd='"+password+"'");
    if(rs.next())
    {
        String fname=rs.getString("fname");
        String lname=rs.getString("lname");
        status = rs.getString("status");
        Statement st1 = con.createStatement();
        ResultSet rs1=st1.executeQuery("select * from codeinfo where emailid='"+userid+"'");
        if(rs1.next())
        {
            session.setAttribute("fname",fname);
            session.setAttribute("email",userid);
            response.sendRedirect("verifycode.jsp");
        }
         else
        {
            if("Active".equals(status))
            {
                Statement st2 = con.createStatement();
                st2.execute("update user_status_info set status='online' where email='"+userid+"'");
                session.setAttribute("fname",fname);
                session.setAttribute("lname",lname);
                session.setAttribute("email",userid);
                response.sendRedirect("userhome.jsp");
            }
            else
            {
                out.println("<center><h3>Your Account Has Been Blocked For Some Reason.<br/>Please Contact Admin.</h3></center>");
            }
        }
    }
    else
    {
        response.sendRedirect("loginerror.jsp");
    }
%>