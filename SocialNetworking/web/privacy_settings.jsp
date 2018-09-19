<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="social.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%
   String emailid = (String)session.getAttribute("email");
   if(emailid==null)
   {
      response.sendRedirect("index.jsp");
   }
%>
<%
            String email = (String)session.getAttribute("email");
            Connection con = DbConnection.getConnect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from userreg where email='"+email+"'");
            String fname="",lname="",profilepic="";
            String mobno="",gender="",dob="",datereg="";
            if(rs.next())
            {
                fname = rs.getString("fname");
                lname = rs.getString("lname");
                profilepic = rs.getString("profilepic");
                dob = rs.getString("dob");
                mobno = rs.getString("tel");
                gender = rs.getString("gender");
                datereg = rs.getString("cdate");
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
      %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User Privacy Settings</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
    .style10 {
	font-size: x-large;
	font-weight: bold;
	color: #0000FF;
}
    .style11 {
	color: #0000FF;
	font-weight: bold;
	font-size: 14px;
}
    .style12 {color: #0000FF}
    </style>
        <script type="text/javascript" src="JavaScript/script.js"></script>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript">
            function changePasswordValidate()
            {
                var curpassword = document.frm1.curpassword.value;
                //alert(curpassword);
                var newpassword = document.frm1.newpassword.value;
                var confpassword = document.frm1.confpassword.value;
                if(curpassword=="")
                {

                    document.getElementById("errormsgCurpass").innerHTML="<br/>* Enter Current Password";
                    return false;
                }
                else
                {
                    document.getElementById("errormsgCurpass").innerHTML="";
                }
                if(newpassword=="")
                {

                    document.getElementById("errormsgNewpass").innerHTML="<br/>* Enter New Password";
                    return false;
                }
                else
                {
                    document.getElementById("errormsgNewpass").innerHTML="";
                }
                if(confpassword=="")
                {

                    document.getElementById("errormsgConfpass").innerHTML="<br/>* Enter Confirm Password";
                    return false;
                }
                else
                {
                    document.getElementById("errormsgConfpass").innerHTML="";
                }
                if(confpassword!=newpassword)
                {
                    document.getElementById("errormsgConfpass").innerHTML="<br/>* Password does not match.";
                    document.frm1.confpassword.value="";
                    document.frm1.confpassword.focus();
                    return false;
                }
                else
                {
                    document.getElementById("errormsgConfpass").innerHTML="";
                }

            }
	</script>

</head>

    <body>
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
            <td width="232"><label></label>
            <img src="images/logo1.png" width="234" height="65" /></td>
            <td width="465"><input name="textfield" type="text" size="60" id="searchbox" placeholder="Search for people" onkeyup="suggest()"/></td>
            <td width="42"><a href="javascript:" onclick="showRequest()">
                    <div style="height:33px;background: url('images/friendrequest.gif') no-repeat;padding-left: 26px;">
                       <b> <span style="color:#000099;font-size:18px;font-family:'Times New Roman', Times, serif;"><% if(count!=0) out.println(count); %></span></b>
                    </div>

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
          <div id="ucleft"> <br/>
              <form action="passwod_update.jsp" name="frm1" method="post" onsubmit="return changePasswordValidate()">
                <p>&nbsp;</p>
                <table width="323" border="0" align="center" cellpadding="7">
                  <tr>
                    <td><div align="center"><span class="style10">Privacy Settings </span></div></td>
                  </tr>
                </table>
                <p>&nbsp;</p>
                <table width="355" border="0" align="center" cellpadding="7" cellspacing="0">
                  
                  <tr>
                    <td width="154"><div align="right" class="style11">Change Password </div></td>
                    <td width="185">&nbsp;	</td>
                  </tr>
                  <tr>
                    <td>	<div align="right" class="currentpassword style12">Current Password </div></td>
                    <td><input type="password" name="curpassword"/><span id="errormsgCurpass" style="color:#FF0000;"></span></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style12">New Password </div></td>
                    <td><label>
                      <input type="password" name="newpassword" />
                    </label><span id="errormsgNewpass" style="color:#FF0000;"></span></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style12">Confirm Password </div></td>
                    <td><label>
                      <input type="password" name="confpassword" />
                    </label><span id="errormsgConfpass" style="color:#FF0000;"></span></td>
                  </tr>
                  <tr>
                    <td colspan="2"><div align="center">
                      <label>
                      <input name="Submit" type="submit" class="lbuttonr" value="Confirm" style="color:#FFFBF0;font-weight:bold"/>
                      </label>
                    </div></td>
                  </tr>
                  <tr>
                    <th colspan="2"><div align="center" style="color:#FF0000;font-weight:bold">
					<%
						String msg = request.getParameter("msg");
						if(msg!=null)
						{
							out.println(msg);
						}
					%>
					</div></th>
                  </tr>
                </table>
              </form>
               <%
                     Statement stmt = con.createStatement();
                    ResultSet rst = stmt.executeQuery("select * from privacy_settings where email='"+email+"'");
                    String rphoto="",remail="",rmobno="",rfriend="";
                    if(rst.next())
                    {
                        remail = rst.getString("rest_on_email");
                        rmobno = rst.getString("rest_on_mobile");
                        rphoto = rst.getString("rest_on_photos");
                        rfriend = rst.getString("rest_on_friends");
                    }
                   String emaila="",emailf="",emailp="";
                   if(remail.equals("all"))
                   {
                       emaila="checked";
                   }
                   else if(remail.equals("friend"))
                   {
                        emailf="checked";
                   }
                   else if(remail.equals("private"))
                   {
                         emailp="checked";
                   }
                   /****Mobileno Restriction Checked***/
                   String moball="",mobfrnd="",mobprivate="";
                   if(rmobno.equals("all"))
                   {
                       moball="checked";
                   }
                   else if(rmobno.equals("friend"))
                   {
                        mobfrnd="checked";
                   }
                   else if(rmobno.equals("private"))
                   {
                         mobprivate="checked";
                   }
                   /******END*****/

                   /****Friend Restriction Checked***/
                   String frndall="",frndf="",frndprivate="";
                   if(rfriend.equals("all"))
                   {
                       frndall="checked";
                   }
                   else if(rfriend.equals("friend"))
                   {
                        frndf="checked";
                   }
                   else if(rfriend.equals("private"))
                   {
                         frndprivate="checked";
                   }
                   /******END*****/

                   /****Photos Restriction Checked***/
                   String photoall="",photofrnd="",photoprivate="";
                   if(rphoto.equals("all"))
                   {
                       photoall="checked";
                   }
                   else if(rphoto.equals("friend"))
                   {
                        photofrnd="checked";
                   }
                   else if(rphoto.equals("private"))
                   {
                         photoprivate="checked";
                   }
                   /******END*****/
                   

               %>
			 <form id="form1" name="form1" method="post" action="update_privacy_settings.jsp">
			    <table width="452" border="0" align="center" cellpadding="7" cellspacing="0">
                  
                  <tr>
                    <td width="199"><div align="right" class="style11">Who can view your Email</div></td>
                    <td width="225">
                        <span class="style12">
                    <input name="remail" type="radio" value="all" <%= emaila %> />
                    All<br />
                    <input name="remail" type="radio" value="friend" <%= emailf %>/>
                    Friend<br />
                    <input name="remail" type="radio" value="private" <%= emailp %>/>
                    Private</span></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style11">Who can view your <br />
                    Mobile Number </div></td>
                    <td>
                        <span class="style12">
                    <input name="rmno" type="radio" value="all" <%= moball%>/>
                    All<br />
                    <input name="rmno" type="radio" value="friend" <%=mobfrnd %>/>
                    Friend<br />
                    <input name="rmno" type="radio" value="private" <%=mobprivate %> />
                    Private                    </span></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style11">Who can view your Photos</div></td>
                    <td>
                        <span class="style12">
                    <input name="rphoto" type="radio" value="all" <%=photoall %> />
                    All<br />
                    <input name="rphoto" type="radio" value="friend" <%= photofrnd%>/>
                    Friend<br />
                    <input name="rphoto" type="radio" value="private" <%=photoprivate%> />
                    Private                    </span></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style11">Who can view your Friends</div></td>
                    <td>
                        <span class="style12">
                    <input name="rfriend" type="radio" value="all" <%=frndall%>/>
                    All<br />
                    <input name="rfriend" type="radio" value="friend" <%=frndf%> />
                    Friend<br />
                    <input name="rfriend" type="radio" value="private" <%=frndprivate%> />
                    Private                    </span></td>
                  </tr>
                  <tr>
                    <td><div align="right"></div></td>
                    <td><label>
                      <input name="Submit2" type="submit" id="uploadBtn" value="Save" />
                    </label></td>
                  </tr>
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
