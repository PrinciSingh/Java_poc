
<%@page import="social.DateTime"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%
    String email = (String)session.getAttribute("email");
    String code = request.getParameter("code");
    String date = DateTime.getCurrentDateTime();
    Connection con = DbConnection.getConnect();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from codeinfo where emailid='"+email+"' and code='"+code+"'");
    if(rs.next())
    {
        Statement st1 = con.createStatement();
        st1.execute("delete from codeinfo where emailid='"+email+"'");
        
        /*****************Friend Table One Time Insert***********/
        Statement stm1 = con.createStatement();
        stm1.execute("insert into friend(sendto,sendfrom,joindate,status) values('"+email+"','"+email+"','"+date+"','friend')");
        
        Statement stm2 = con.createStatement();
        stm2.execute("insert into privacy_settings values('"+email+"','all','all','all','all')");
        /********************************************************/
        response.sendRedirect("index.jsp");
    }
    else
    {
        response.sendRedirect("verifycode.jsp");
    }
%>