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
<title>User Inbox</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
    .style12 {
	font-size: x-large;
	font-family: Georgia, "Times New Roman", Times, serif;
	font-weight: bold;
	color: #0000FF;
}
    .style14 {font-size: x-large}
    .style16 {font-size: 16px}
.style19 {color: #0000FF; font-weight: bold; font-size: 14; }
    .style20 {color: #00BF00}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/script.js"></script>
        <script type="text/javascript">
            function checkBoxValidate()
            {
                var checkedMsg = document.frm1.selectmsg;
                var i,count=0;
                for(i=0;i<checkedMsg.length;i++)
                {
                    if(checkedMsg[i].checked)
                    {
                        count=1;
                        break;
                    }
                }
                if(count==0)
                {
                    alert("No Message Selected To Delete.");
                    return false;
                }
                else
                    return true;
            }
        </script>

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
            /***********************************/

            
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
            <td width="233"><label></label>
            <img src="images/logo1.png" width="230" height="65" /></td>
              <td width="461"><p>
                <input name="searchName"  type="text" size="60" id="searchbox" placeholder="Search for people" onkeyup="suggest()"/>
              </p>
            </td>
              <td width="43"><a href="javascript:showRequest()">
                    <div style="height:33px;background: url('images/friendrequest.gif') no-repeat;padding-left: 26px;">
                       <b> <span style="color:#000099;font-size:18px;font-family:'Times New Roman', Times, serif;"><% if(count!=0) out.println(count); %></span></b>
                    </div>
                    <!--<img src="images/friendrequest.gif" width="38" height="32" title="View Friend Request"/>-->
            </a></td>
            <td width="47"><a href="user_inbox.jsp">
                    <div style="height:34px;background: url('images/inbox1.png') no-repeat;padding-left: 15px;">
                       
                    </div>
            </a></td>
            <td width="159"><strong><font color="#0000CC" size="2"><%= fname %>&nbsp;<%= lname %></font></strong></td>
            <td width="74"><div align="center"><b><a href="logout.jsp" class="style9" style="text-decoration:none; color:#000099">Logout</a></b></div></td>
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
		    <table width="204" border="0" align="left" cellpadding="7" cellspacing="0">
             <tr>
               <td><div align="center" class="style12 style14">Message Box </div></td>
              </tr>
           </table>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <table width="200" border="0" align="right" cellpadding="7" cellspacing="0">
              <tr>
                <td><div align="center" class="style9" id="unfriend">
                  <a href="message.jsp" style="text-decoration:none;color:#FFFBF0">
				  <div align="center" class="style16">Send New Message </div>
				  </a>
                </div></td>
              </tr>
            </table>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
              <%
                    Statement stm = con.createStatement();
                    ResultSet res = stm.executeQuery("select * from message where sendto='"+email+"'");
                    if(res.next())
                    {
              %>
                        <form name="frm1" action="delete_message.jsp" method="post" onsubmit="return checkBoxValidate()">
                        <table width="490" height="36" border="0" align="center" cellpadding="5" cellspacing="0">
                          <tr>
                            <td colspan="2"><div align="center">
                              <label>
                              <div align="left">
                                <input type="submit" name="Submit" value="Delete Checked" id="addfriendbutton"/>
                              </div>
                              </label>
                            </div></td>
                            <th>&nbsp;</th>
                          </tr>
                            <tr>
                            <td width="74"><span class="style19">
                              <label>
                              <div align="right">Select</div>
                              </label>
                            </span></td>
                            <td width="158"><div align="center" class="style19">Message From </div></td>
                            <td width="228"><div align="center" class="style19">
                              <div align="left">Message</div>
                            </div></td>
                          </tr>
               <%
                }
               %>

               
              <%
                    String sendfrom_fname="",sendfrom_lname="",sendfrom_email="",msg="";
                    String msgid="";
                    Statement st2 = con.createStatement();
                    ResultSet rst1 = st2.executeQuery("select * from message where sendto='"+email+"'");
                    while(rst1.next())
                    {
                       sendfrom_email=rst1.getString("sendfrom");
                       msgid=rst1.getString("msg_id");
                       msg=rst1.getString("msg");
                       Statement update_st = con.createStatement();
                       update_st.execute("update message set status='read' where msg_id='"+msgid+"'");
                       Statement st3 = con.createStatement();
                       ResultSet rst2 = st3.executeQuery("select * from userreg where email='"+sendfrom_email+"'");
                       while(rst2.next())
                       {
                           sendfrom_fname=rst2.getString("fname");
                           sendfrom_lname=rst2.getString("lname");
              %>
              <tr>
                <td><label>
                  <div align="right">
                      <input type="checkbox" name="selectmsg" id="selectmsg" value="<%=msgid%>" />
                  </div>
                </label></td>
                  <th><span class="style20"><%=sendfrom_fname%>&nbsp;<%=sendfrom_lname%></span></th>
                <th><div align="left"><%=msg%></div></th>
              </tr>
			   <%
                    }
                   }
                %>
            </table>
            </form>
               
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
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <div id="newsfeed"></div>
          </div>
          <div id="ucright"></div>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
      </div>
    </div>
    </div>
    </body>
</html>
