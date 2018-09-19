<%@page import="social.DbConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String scslno = request.getParameter("post_slno");
    String userid = (String)session.getAttribute("email");
    Connection con  = DbConnection.getConnect();

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from like_counter where post_slno='"+scslno+"'");
    String lcount="";
    int count=0;
    while(rs.next())
    {
        lcount = rs.getString("count");
    }
    if(! "".equals(lcount))
    {
      count = Integer.parseInt(lcount);
    }
    count = count+1;
    
    String sql = "insert into like_count(post_slno,email) values(?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, scslno);
    ps.setString(2, userid);
    ps.executeUpdate();

    Statement st1 = con.createStatement();
    ResultSet rs1= st1.executeQuery("select * from like_counter where post_slno='"+scslno+"'");
    if(rs1.next())
    {
        int count1 = Integer.parseInt(rs1.getString("count"));
        count1++;
        String cnt = count1+"";
        Statement st2=con.createStatement();
        st2.execute("update like_counter set count='"+cnt+"' where post_slno='"+scslno+"'");

    }
    else
    {
        String sql1 = "insert into like_counter(post_slno,count) values(?,?)";
        PreparedStatement ps1 = con.prepareStatement(sql1);
        ps1.setString(1, scslno);
        ps1.setString(2, count+"");
        ps1.executeUpdate();
    }
    response.sendRedirect("userhome.jsp");
%>