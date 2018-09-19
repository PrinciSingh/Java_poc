<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
	String msg = request.getParameter("msg");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friends Forever Login Error</title>
<link href="../style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}
#adminlogindiv
{
				border:2px solid red;
				border-radius:5px;
				box-shadow:15px 15px 10px;
				padding-top:20px;
				padding-bottom:20px;
				width:590px;
				height:auto;
				shadow:20px;
				margin:50px;
				background-color:white;
}
#errmsg
{
	border:1px solid red;
	width:100px;
	color:#FF0000;
}
.style3 {color: #0000FF; font-weight: bold; font-size: 14; }
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
</head>

<body >
<div id="container">
  <div id="header">

    <table width="981" border="0">
      <tr>
        <td width="276">&nbsp;</td>
        <td width="695"><img src="../images/logo1.png" width="375" height="62"  /></td>
      </tr>
    </table>
  </div>
  <div id="body" align="center">
    <div id="adminlogindiv" align="center">
      <table width="573" border="1" cellpadding="7" cellspacing="0">
        <tr>
          <td width="41"><div align="center" class="style3">Email</div></td>
          <td width="126"><div align="center" class="style3">Registration Date </div></td>
          <td width="121"><div align="center" class="style3">Last Login Date </div></td>
          <td width="40"><div align="center" class="style3">Status</div></td>
          <td width="163"><div align="center" class="style3">Operation</div></td>
        </tr>
        <%
            Connection con = DbConnection.getConnect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from user_status_info");
            while(rs.next())
            {
                String email = rs.getString("email");
                Statement st1 = con.createStatement();
                ResultSet rs1 = st1.executeQuery("select * from userreg where email='"+email+"'");
                String status="";
                if(rs1.next())
                {
                    status = rs1.getString("status");
                }
                %>
                  <tr>
                      <td><div align="center"><strong><%= rs.getString("email") %></strong></div></td>
                      <td><div align="center"><strong><%= rs.getString("reg_date") %></strong></div></td>
                      <td><div align="center"><strong><%= rs.getString("last_login_date") %></strong></div></td>
                     <td><div align="center"><strong><%= status %></strong></div></td>

                      <td>
                          <div align="center"><strong>
                            <%
                                  if("Blocked".equals(status))
                                  {
                                     %>
                                       <a href="active_user.jsp?email=<%= rs.getString("email") %>" style="text-decoration:none">Active</a>
                              <%
                                  }
                                  else
                                   {
                                     %>
                                    <a href="block_user.jsp?email=<%= rs.getString("email") %>" style="text-decoration:none">Block</a>
                      
                                  <% 
                                   } 
                              %>
                              </strong></div>                      </td>
                  </tr>
                <%
            }
        %>
      </table>
    </div>
  </div>
</div>
<div id="footer">Designed by Asit Kumar Mohanty</div>
</body>
</html>

