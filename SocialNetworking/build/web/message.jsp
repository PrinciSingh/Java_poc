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
<title>User Home</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
.style11 {font-size: 14; font-weight: bold; color: #0000FF; }
.style13 {font-size: 16px}
    .style14 {font-size: 16px; font-weight: bold; color: #0000FF; }
    .style15 {
	color: #0000FF;
	font-weight: bold;
}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/script.js"></script>
        <script type="text/javascript">
            function checkBlankField()
            {
                var selectfrnd = document.form1.fr_name.value;
                var msgtxt = document.form1.msgtext.value;
                if(selectfrnd=="0")
                {
                    alert("Please Select a Friend To Send Message.");
                    return false;
                }
                else if(msgtxt==null || msgtxt == "")
                {
                    alert("Please Type Some Message.");
                    document.form1.msgtext.focus();
                    return false;
                }
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
            <td width="54"><a href="#"><img src="images/inbox.png" width="50" height="51" title="View Message" /></a></td>
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
		    <p><br/>
		    </p>
		    <form id="form1" name="form1" method="post" action="send_message.jsp" onsubmit="return checkBlankField()">
		    <table width="442" border="0" align="center" cellpadding="7" cellspacing="0">
             <tr>
               <td width="97"><div align="right" class="style11">
                 <p class="style13">To</p>
                 </div></td>
               <td colspan="2">
                 <label>
                  <select name="fr_name">
                    <b><option value="0">----------Select Friend----------</option></b>
                   <%
                        String fr_fname="",fr_lname="",fr_email="";
                        Statement st2 = con.createStatement();
                        ResultSet rst1 = st2.executeQuery("select * from friend where sendto='"+email+"' and sendfrom!='"+email+"'");
                        while(rst1.next())
                        {
                            fr_email=rst1.getString("sendfrom");
                            Statement st3 = con.createStatement();
                            ResultSet rst2 = st3.executeQuery("select * from userreg where email='"+fr_email+"'");
                            while(rst2.next())
                            {
                                fr_fname=rst2.getString("fname");
                                fr_lname=rst2.getString("lname");
                    %>
                   
                    <option value="<%=rst1.getString("sendfrom")%>"><%= fr_fname%>&nbsp;<%= fr_lname%></option>
                    <%
                            }
                        }
                    %>
                 </select>
                 </label>
            </form>               </td>
             </tr>
             <tr>
               <td><div align="right" class="style14">Message</div></td>
               <td colspan="2"><label>
                 <textarea name="msgtext" cols="35" rows="8" style="resize:none"></textarea>
               </label></td>
             </tr>
             <tr>
               <td>&nbsp;</td>
               <td width="105"><label>
                 <input type="submit" name="Submit" value="Send" id="uploadBtn" />
			   </label></td>
               <td width="208"><input type="reset" name="Submit2" value="Cancel" id="uploadBtn" onclick="window.location.reload()"/></td>
             </tr>
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
			<th height="27" colspan="3" bgcolor="#FFDF55" class="style9 style21"><span class="style15">Online Friends</span></th>
			</tr>
              <tr>
                <td width="43"><img src="profilepic/<%=uprofilepic%>" width="40" height="40"/></td>
                <td width="129"><div align="left"><span class="style14"><strong><%=ufname%>&nbsp;<%=ulname%></strong></span></div></td>
                <td width="42"><div align="center"><img src="images/online.png" width="15" height="15"/></div></td>
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
