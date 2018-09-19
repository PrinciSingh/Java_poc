<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%
    String email = (String)session.getAttribute("email");
    String address=request.getParameter("address");
    String school=request.getParameter("school");
    String college=request.getParameter("college");
    String work=request.getParameter("work");
    String curcity=request.getParameter("curcity");
    String hometown=request.getParameter("hometown");
    String status=request.getParameter("status");
    String interest=request.getParameter("interest");
    String country=request.getParameter("country");
    Connection con = DbConnection.getConnect();
    Statement st=con.createStatement();
    Statement st1=con.createStatement();
    Statement st2=con.createStatement();
    ResultSet rs = st2.executeQuery("select email from personal where email='"+email+"'");
    if(!rs.next())
    {
         st.execute("insert into personal (email) values('"+email+"')");
    }
    st1.execute("update personal set address='"+address+"',school='"+school+"',college='"+college+"',work='"+work+"',currentcity='"+curcity+"',hometown='"+hometown+"',status='"+status+"',interest='"+interest+"',country='"+country+"' where email='"+email+"'");
    response.sendRedirect("user_profile.jsp");
%>
