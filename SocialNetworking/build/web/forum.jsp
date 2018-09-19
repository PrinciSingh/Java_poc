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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" src="JavaScript/script.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Forum</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/script.js"></script>
        <script type="text/javascript">
            //This Function autorefresh the page every 10 seconds. passed in onload() in body tag.
            function AutoRefresh( t )
            {
                setTimeout("window.location.reload(true);", t);
            }
        </script>
        <script type="text/javascript" src="highslide/highslide-full.js"></script>
        <link rel="stylesheet" type="text/css" href="highslide/highslide.css" />
        <script type="text/javascript">
            hs.graphicsDir = 'highslide/graphics/';
            hs.align = 'center';
            hs.transitions = ['expand', 'crossfade'];
            hs.outlineType = 'rounded-white';
            hs.fadeInOut = true;
            hs.dimmingOpacity = 0.75;

            // define the restraining box
            hs.useBox = true;
            hs.width = 640;
            hs.height = 480;

            // Add the controlbar
            hs.addSlideshow({
            //slideshowGroup: 'group1',
            interval: 5000,
            repeat: false,
            useControls: true,
            fixedControls: 'fit',
            overlayOptions: {
            opacity: 1,
            position: 'bottom center',
            hideOnMouseOut: true
            }
            });
    </script>
    <style type="text/css">
<!--
.style14 {color: #0000FF}
.style21 {color: #0000FF; font-weight: bold; font-size: 14px; }
.style22 {
	color: #FF0000;
	font-weight: bold;
}
.style23 {color: #2A00AA}
.style24 {
	font-size: x-large;
	font-weight: bold;
	color: #0000FF;
}
-->
    </style>
</head>

    <body onload="JavaScript:AutoRefresh(50000);">
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
    <div id="container"><div class="userhome_header">
        <table width="1101" border="0" cellpadding="7" cellspacing="0">
          <tr>
            <td width="234"><label></label>
            <img src="images/logo1.png" width="234" height="65" /></td>
              <td width="465"><input name="searchName"  type="text" size="60" id="searchbox" placeholder="Search for people" onkeyup="suggest()"/></td>
              <td width="43"><a href="javascript:" onclick="showRequest()">
                    <div style="height:33px;background: url('images/friendrequest.gif') no-repeat;padding-left: 26px;">
                       <b> <span style="color:#000099;font-size:18px;font-family:'Times New Roman', Times, serif;"><% if(count!=0) out.println(count); %></span></b>
                    </div>
          
            </a></td>
            <td width="58">    
			  <div style="height:34px;background: url('images/inbox1.png') no-repeat;padding-left: 32px;">
			    <a href="user_inbox.jsp" style="text-decoration:none"><strong> <span style="font-size:20px;font-family:'Times New Roman', Times, serif;">
		        <% if(counter!=0) out.println(counter); %>
		        </span></strong><span class="style22"><span style="font-size:20px;font-family:'Times New Roman', Times, serif;">		          </span></span>	              </a></div>
		    <a href="user_inbox.jsp" class="style23" style="text-decoration:none"></a></td>
            <td width="144"><strong><font color="#0000CC" size="2"><%= fname %>&nbsp;<%= lname %></font></strong></td>
            <td width="73"><div align="center"><b><a href="logout.jsp" class="style9" style="text-decoration:none; color:#000099">Logout</a></b></div></td>
          </tr>
        </table>
      </div>
      <div id="userhomeleftbody">
        <table width="152" border="0" cellpadding="5" cellspacing="0">
          <tr>
            <td align="center" class="highslide-gallery">

                <a href="profilepic/<%= profilepic %>" class="highslide" onclick="return hs.expand(this)">
                <img src="profilepic/<%= profilepic %>" height="139" width="139" oncopy="return false" onselect="return false"/>
                </a>
			<a href="upload_pic.jsp" style="text-decoration:none">Change Picture</a>
            </td>
          </tr>
          <tr>
            <td><div align="center" class="style7"><font color="#0000CC" size="2"><%= fname %>&nbsp;<%= lname %></font></div></td>
          </tr>
          <tr>
            <td background="privacy_settings.jsp">
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
          <div id="ucleft" >
            <p>&nbsp;</p>
            <p align="left"><span class="style24">Ask Your Questions: </span></p>
            <form id="form1" name="form1" method="post" action="post_insert.jsp" onsubmit="return checkPostField()">
              <table width="473" border="0" cellspacing="0">
                <tr>
                  <td>
                    <div align="right">
                      <textarea name="postmsg" cols="75" rows="8" placeholder="Ask Your Doubts..." style="border-radius:10px;border:1px solid #FF9900;resize:none;"></textarea>
                      <br/>
                      
                      <input type="submit" name="Submit" value="Submit" id="postBtn" />
                    </div></td>
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
          <p>&nbsp;</p>
          <p>&nbsp;</p>
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
			<th height="27" colspan="3" bgcolor="#FFDF55" class="style21">Online Friends</th>
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
