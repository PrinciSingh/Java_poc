<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
    String email = (String)session.getAttribute("email");
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select * from friend where sendto='"+email+"' and status='no action'");
    String profilepic="";
    int count=0;
    while(rs.next())
    {
        count=1;
        String sendfrom=rs.getString("sendfrom");
        Statement st1 = con.createStatement();
        ResultSet rs1=st1.executeQuery("select * from userreg where email='"+sendfrom+"'");
        if(rs1.next())
        {
            String fname=rs1.getString("fname");
            String lname=rs1.getString("lname");
            profilepic=rs1.getString("profilepic");
            out.println("<br/><a href='view_ser_profile.jsp?email="+sendfrom+"' style='text-decoration:none'>");
            out.print("<img src='profilepic/"+profilepic+"' width='40px' height='40px' style='vertical-align:middle'/> ");
            out.print(fname+" ");
            out.print(lname+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            out.println("<a href='join_friend.jsp?sendto="+email+"&sendfrom="+sendfrom+"'>Accept</a>"+"&nbsp;&nbsp;");
            out.println("<a href='reject_friend.jsp?sendto="+email+"&sendfrom="+sendfrom+"'>Reject</a>");
            out.println("</a><br/>");
        }
    }

    if(count==0)
    {
        out.println("no");
    }
    else
    {
        out.println("<br>");
    }
%>