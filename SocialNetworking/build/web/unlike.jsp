
<%@page import="social.DbConnection"%>
<%@page import="java.sql.*"%>
<%
    String userid = (String)session.getAttribute("email");
    String scslno = request.getParameter("post_slno");
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    st.execute("delete from like_count where email='"+userid+"' and post_slno='"+scslno+"'" );

    /******Update like count ******/
    Statement st1 = con.createStatement();
    ResultSet rs1= st1.executeQuery("select * from like_counter where post_slno='"+scslno+"'");
    if(rs1.next())
    {
        int count1 = Integer.parseInt(rs1.getString("count"));
        count1--;
        String cnt = count1+"";
        Statement st2=con.createStatement();
        st2.execute("update like_counter set count='"+cnt+"' where post_slno='"+scslno+"'");

    }
    response.sendRedirect("userhome.jsp");
%>