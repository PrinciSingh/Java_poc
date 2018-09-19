<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String elem=request.getParameter("elem");
    if(elem==null || elem.trim().equals(""))
        out.print("no");
    else
    {
            Connection con=DbConnection.getConnect();
            Statement st = con.createStatement();
            ResultSet rs=st.executeQuery("select * from userreg where fname like"+"'"+elem+"%'");
            String profilepic="";
            while(rs.next())
            {
                String email=rs.getString("email");
                String fname=rs.getString("fname");
                String lname=rs.getString("lname");
                profilepic=rs.getString("profilepic");
                out.println("<br/><a href='view_user_profile.jsp?email="+email+"' style='text-decoration:none'>");
                out.print("<img src='profilepic/"+profilepic+"' width='52px' height='52px' style='vertical-align:middle'/> ");
                out.print(fname+" ");
                out.print(lname);
                out.println("</a><br/>");
            }
            out.println("<br/>");
    }
%>