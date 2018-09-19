<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%
   String emailid = (String)session.getAttribute("email");
   if(emailid==null)
   {
      response.sendRedirect("index.jsp");
   }
%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friends</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
    .style11 {
	color: #0000FF;
	font-family: Arial, Helvetica, sans-serif;
}
    .style12 {
	font-size: x-large;
	font-family: Georgia, "Times New Roman", Times, serif;
	font-weight: bold;
	color: #0000FF;
}
    .style13 {
	color: #0000FF;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 13px;
}
    .style14 {font-size: x-large}
    .style15 {font-family: Arial, Helvetica, sans-serif}
    .style17 {
	font-size: 12px;
	color: #0000FF;
	font-weight: bold;
}
    .style18 {
	color: #0000FF;
	font-weight: bold;
	font-size: 14px;
}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/script.js"></script>


</head>

    <body>
      <%
            String email = (String)session.getAttribute("email");
            Connection con = DbConnection.getConnect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from userreg where email='"+email+"'");
            String fname="",lname="",profilepic="";
            if(rs.next())
            {
                fname = rs.getString("fname");
                lname = rs.getString("lname");
                profilepic = rs.getString("profilepic");
            }

            /***********Friend Request **********/
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from friend where sendto='"+email+"' and status='no action'");
            int count=0;
            while(rs1.next())
            {
                count++;
            }
            /*************************************/
            /*********** New Message Count *********/
                Statement stmnt = con.createStatement();
                ResultSet result = stmnt.executeQuery("select * from message where sendto='"+email+"' and status='unread'");
                int counter=0;
                while(result.next())
                {
                    counter++;
                }
            /***************************************/
      %>
	  <div id="suggestion">
	    <p>&nbsp;</p>
    </div>
          <div id="showrequest">
	    <p>&nbsp;</p>
    </div>
    <div id="container">
      <div class="userhome_header">
        <table width="1101" border="0" cellpadding="7" cellspacing="0">
          <tr>
            <td width="230"><label></label>
            <img src="images/logo1.png" width="230" height="65" /></td>
              <td width="467"><p>
                <input name="searchName"  type="text" size="60" id="searchbox" placeholder="Search for people" onkeyup="suggest()"/>
              </p>
            </td>
              <td width="42"><a href="javascript:showRequest()">
                    <div style="height:33px;background: url('images/friendrequest.gif') no-repeat;padding-left: 26px;">
                       <b> <span style="color:#000099;font-size:18px;font-family:'Times New Roman', Times, serif;"><% if(count!=0) out.println(count); %></span></b>
                    </div>
                    <!--<img src="images/friendrequest.gif" width="38" height="32" title="View Friend Request"/>-->
                </a></td>
            <td width="58">
			<a href="user_inbox.jsp" style="text-decoration:none">
			<div class="style14" style="height:34px;background: url('images/inbox1.png') no-repeat;padding-left: 32px;">
                <span class="style22"> <span style="font-size:20px;font-family:'Times New Roman', Times, serif;">
               <% if(counter!=0) out.println(counter); %>
                </span></span>
			</div>
			</a></td>
            <td width="156"><strong><font color="#0000CC" size="2"><%= fname %>&nbsp;<%= lname %></font></strong></td>
            <td width="68"><div align="center"><b><a href="logout.jsp" class="style9" style="text-decoration:none; color:#000099">Logout</a></b></div></td>
          </tr>
        </table>
      </div>
      <div id="userhomeleftbody">
        <table width="152" border="0" cellpadding="5" cellspacing="0">
          <tr>
              <td align="center"><img src="profilepic/<%= profilepic %>" height="139" width="139" oncopy="return false" onselect="return false"/>
                
			<a href="upload_pic.jsp" style="text-decoration:none">Change Picture</a>
            </td>
          </tr>
          <tr>
            <td><div align="center" class="style7"><font color="#0000CC" size="2"><%= fname %>&nbsp;<%= lname %></font></div></td>
          </tr>
          <tr>
            <td>
			<div class="sidebar_section">
				<ul class="category_list">
                    <li><a href="userhome.jsp">Home</a></li>
  					<li><a href="user_profile.jsp">Profile</a></li>
  					<li><a href="user_inbox.jsp">Messages</a></li>
                    <li><a href="friend_list.jsp">Friends</a></li>
					<li><a href="photos.jsp">My Photos</a></li>
					<li><a href="">Groups</a></li>
					<li><a href="learnzone.jsp">Learning Zone</a></li>
 					<li><a href="">Forums</a></li>
                    <li><a href="privacy_settings.jsp">Privacy Setting</a></li>
				</ul>
			</div>
			</td>
          </tr>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
	  </div>
        <div id="userhomerbody">
          <div id="ucleft">
		   <br/>
		    <table width="531" border="0" align="center">
             <tr>
               <td><div align="center" class="style12 style15"><%=fname%>&nbsp;<%=lname%>'s Friends.</div></td>
              </tr>
           </table>
		    <p>&nbsp;</p>
		    <table width="465" border="0" align="center" cellpadding="0" cellspacing="0">

            <%
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("select * from friend where sendfrom='"+email+"'and sendto!='"+email+"' and status='friend'");
                while(rs2.next())
                {
                    String fid = rs2.getString("sendto");
                    String joindate = rs2.getString("joindate");
                    Statement st3 = con.createStatement();
                    ResultSet rs3=st3.executeQuery("select * from userreg where email='"+fid+"'");
                    if(rs3.next())
                    {
						String frnd_email = rs3.getString("email");
                        String frnd_fname = rs3.getString("fname");
                        String frnd_lname = rs3.getString("lname");
                        String frnd_profilepic = rs3.getString("profilepic");
                        %>
                            <tr>
                                <td width="86"><img src="profilepic/<%=frnd_profilepic %>" width="70" height="70"/></td>
                                <td width="213">&nbsp;
                                  <p class="style13">
								  <a href='view_user_profile.jsp?email=<%=frnd_email%>' style="text-decoration:none">
								  	<%= frnd_fname %>&nbsp;<%= frnd_lname %>
									</a>
								  </p>
                              <p class="style11">Friends On  : <%= joindate %> </p></td>
                              <td width="158"><div align="center"><a href='unfriend.jsp?email2=<%=fid%>' style="text-decoration:none;" id='unfriend' ">Unfriend</a></div></td>
                            </tr>
                        <%
                    }
                }
            %>
             
           </table>
		   
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <div id="newsfeed"></div>
          </div>
          <div id="ucright">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <table width="226" height="81" border="0" align="center" cellpadding="2" cellspacing="0">
			
            <%
                Statement stm1 = con.createStatement();
                ResultSet rest1 = stm1.executeQuery("select * from friend where sendto='"+email+"' and sendfrom!='"+email+"'");
                String femail="",uprofilepic="",ufname="",ulname="";
                while(rest1.next())
                {
					femail = rest1.getString("sendfrom");
                    Statement stm2 = con.createStatement();
                    ResultSet rest2 = stm2.executeQuery("select * from user_status_info where email='"+femail+"' and status='online'");
                    while(rest2.next())
                    {
                       Statement stm3 = con.createStatement();
                       ResultSet rest3 = stm3.executeQuery("select * from userreg where email='"+femail+"'");
                       while(rest3.next())
                       {
                           uprofilepic = rest3.getString("profilepic");
                           ufname= rest3.getString("fname");
                           ulname= rest3.getString("lname");
            %>
			<tr>
			<th height="27" colspan="3" bgcolor="#FFDF55" class="style21"><span class="style18">Online Friends</span></th>
			</tr>
              <tr>
                <td width="43"><img src="profilepic/<%=uprofilepic%>" width="40" height="40"/></td>
                <td width="122"><div align="left"><span class="style17"><%=ufname%>&nbsp;<%=ulname%></span></div></td>
                <td width="49"><div align="center"><img src="images/online.png" width="15" height="15"/></div></td>
              </tr>
             <%
                        }
                    }
                 }
             %>
            </table>
            <p>&nbsp;</p>
          </div>
    </div>
    </div>
    </body>
</html>
