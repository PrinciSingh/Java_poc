<%@page import="social.SendForgotPasswordCode"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String userid = request.getParameter("email");

    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select email from userreg where email='"+userid+"'");
    if(rs.next())
    {
        String email = rs.getString("email");
        Random obj = new Random();
        int code = obj.nextInt(10000);
        Statement stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery("select * from forgotpasswordcode where email='"+email+"'");
        if(rst.next())
        {
           // String msg="Code already sent.";
            SendForgotPasswordCode send = new SendForgotPasswordCode();
            send.setEmail(email);
            String newcode = code+"";
            send.setCode(newcode);
            String status = send.sendEmail();
            if(status.equals("Success"))
            {
                Statement stmt1 = con.createStatement();
                stmt1.execute("update forgotpasswordcode set code='"+newcode+"' where email='"+email+"'");
                response.sendRedirect("forgot_password_code.jsp?email="+email);
            }
            else
            {
                out.println("<center>Failed To Send Email.&nbsp;&nbsp;<a href='forgot_password.jsp'>Try Again</a></center>");
            }
            //response.sendRedirect("forgot_password.jsp");
            
        }
        else
        {
            SendForgotPasswordCode send = new SendForgotPasswordCode();
            send.setEmail(email);
            String newcode = code+"";
            send.setCode(newcode);
            String status = send.sendEmail();
            if(status.equals("Success"))
            {
                Statement stmt1 = con.createStatement();
                stmt1.execute("insert into forgotpasswordcode value('"+email+"','"+code+"')");
                response.sendRedirect("forgot_password_code.jsp?email="+email);
            }
            else
            {
                out.println("<center>Failed To Send Email.&nbsp;&nbsp;<a href='forgot_password.jsp'>Try Again</a></center>");
            }
        }
    }
    else
    {
            String msg="Email Does Not Exists.";
            response.sendRedirect("forgot_password.jsp?msg="+msg);
    }
%>