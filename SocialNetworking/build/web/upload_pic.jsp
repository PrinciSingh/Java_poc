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
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/upload_pic.js"></script>
        

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
        <table width="152" border="0" cellpadding="6" cellspacing="0">
          <tr>
            <td align="center"><img src="profilepic/<%= profilepic %>" height="139" width="139" oncopy="return false" onselect="return false"/>
			<br/>
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
		   
		 <form action="upload_image_processing.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1" onSubmit="return checkField()">
                 <table width="232" border="0" align="center" cellpadding="6" cellspacing="0">
                 
    			<tr>
                            <td width="51%" align="center"><div align="center"><img src="profilepic/<%=profilepic%>" name="image_preview" width="280" height="180" align="baseline" id="image_preview"/></div></td>
    
				</tr>
    			<tr>
      				<td><label>
                            <center><input name="profilephoto" type="file" id="profilephoto" value='Choose' onchange="previewUploadImage()" size="30"/>
                            </center>
         		
      				</label>
                    </td>
    			</tr>
   				 <tr>
   				   <td>
   			          
                     <div align="center">
  <input name="submit" type="submit" id="uploadBtn"  value="Upload Image" />
  &nbsp;&nbsp;&nbsp;</div></td>
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
		 </form>
				
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
