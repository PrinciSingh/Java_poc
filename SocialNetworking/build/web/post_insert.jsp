<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="social.DbConnection"%>
<%@page import="social.DateTime"%>
<%@page import="javax.mail.search.DateTerm"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
     String email = (String) session.getAttribute("email");
     String post_msg = request.getParameter("postmsg");
     String date_post=DateTime.getDateTime();
     Connection con = DbConnection.getConnect();
     Statement st = con.createStatement();
     st.execute("insert into post (email,post_msg,post_date) values('"+email+"','"+post_msg+"','"+date_post+"')");
     response.sendRedirect("userhome.jsp");
%>