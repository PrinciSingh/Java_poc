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
<title>View Profile</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
    .style10 {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 24px;
	font-weight: bold;
	color: #0000FF;
}
.style13 {font-family: Georgia, "Times New Roman", Times, serif; font-size: 14; }
    .style14 {font-family: Georgia, "Times New Roman", Times, serif; font-size: 14px; }
    .style17 {color:#FFFFFF}
    .style18 
	{
		font-family: Georgia, "Times New Roman", Times, serif;
		font-weight: bold;
		background-color:#2A00AA;
		padding:5px 10px;
		border-radius:8px;
	}
    .style19 {
	color: #0000CC;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/script.js"></script>
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
.style20 {color: #0000FF}
.style22 {font-family: Arial, Helvetica, sans-serif}
.style24 {font-size: 12px}
.style25 {color: #609142}
-->
        </style>
</head>

    <body onload="JavaScript:AutoRefresh(5000);">
      <%
            String email = (String)session.getAttribute("email");
            String fname = (String)session.getAttribute("fname");
            String lname = (String)session.getAttribute("lname");

            String email1 = request.getParameter("email");
            Connection con = DbConnection.getConnect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from userreg where email='"+email1+"'");
            String fname1="",lname1="",profilepic="";
            String tel1="",dob1="",gender1="";
            if(rs.next())
            {
                fname1 = rs.getString("fname");
                lname1 = rs.getString("lname");
                tel1 = rs.getString("tel");
                dob1 = rs.getString("dob");
                gender1 = rs.getString("gender");
                profilepic = rs.getString("profilepic");
            }

            /*******************Search Status*****************/
            Connection con1 = DbConnection.getConnect();
            Statement st1 = con1.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from friend where sendto='"+email1+"' and sendfrom='"+email+"' or sendto='"+email+"' and sendfrom='"+email1+"'");
            String status="";
            if(rs1.next())
            {
                status = rs1.getString("status");
            }
            /**************************************************/
      %>
<%
    /********************Fetching Data From Privacy Settings. *********/
    Statement stmt = con.createStatement();
    ResultSet rst = stmt.executeQuery("select * from privacy_settings where email='"+email1+"'");
    String rphotos="",remail="",rmobile="",rfriends="";
    if(rst.next())
    {
        remail = rst.getString("rest_on_email");
        rmobile = rst.getString("rest_on_mobile");
        rphotos = rst.getString("rest_on_photos");
        rfriends = rst.getString("rest_on_friends");
    }
    /******************************************************************/
%>
	  <div id="suggestion">
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
            <td width="42"><a href="#"></a></td>
            <td width="54"><a href="userhome.jsp" class="style19" style="text-decoration:none">Home</a></td>
            <td width="156"><strong><font color="#0000CC" size="2"><%= fname %>&nbsp;<%= lname %></font></strong></td>
            <td width="68"><div align="center"><b><a href="logout.jsp" class="style9" style="text-decoration:none; color:#000099">Logout</a></b></div></td>
          </tr>
        </table>
      </div>
      <div id="userhomeleftbody">
        <table width="152" border="0" cellpadding="6" cellspacing="0">
          <tr>
            <td>
                <a href="profilepic/<%= profilepic %>" class="highslide" onclick="return hs.expand(this)">
                <img src="profilepic/<%= profilepic %>" height="139" width="139" oncopy="return false" onselect="return false"/>                </a>            </td>
          </tr>
          <tr>
            <td><div align="center" class="style7"><font color="#0000CC" size="2"><%= fname1 %>&nbsp;<%= lname1 %></font></div></td>
          </tr>
          
          <tr>
		  	<% 
		  	if(rphotos.equals("private"))
			{
			%>
            <td>
				<div class="sidebar_section">
					<ul class="category_list">
						<li><a href="">Photos</a></li>
			<%
			}
			
			else if(rphotos.equals("friend"))
			{
				if(status.equals("friend"))
				{
			%>	
				<td>	
				<div class="sidebar_section">
					<ul class="category_list">
						<li><a href="view_photos.jsp?email1=<%= email1%>">Photos</a></li>
			<%
				}
			}
			else if(rphotos.equals("all"))
			{
			%>
				<td>
				<div class="sidebar_section">
					<ul class="category_list">
						<li><a href="view_photos.jsp?email1=<%= email1 %>">Photos</a></li>
			<%
                        }
			%>
				<% 
		  	if(rfriends.equals("private"))
			{
			%>
					<li><a href="">Friends</a></li>
			<%
			}
			
			else if(rfriends.equals("friend"))
			{
				if(status.equals("friend"))
				{
			%>	
						<li><a href="view_friends.jsp?email=<%= email1%>">Friends</a></li>
			<%
				}
			}
			else if(rfriends.equals("all"))
			{
			%>
						<li><a href="view_friends.jsp?email=<%= email1 %>">Friends</a></li>
			<%
                        }
			%>
					</ul>
				</div>
			</td>
          </tr>
        </table>
        <p>&nbsp;</p>
        
	  </div>
        <div id="userhomerbody">
          <div id="ucleft">
		    <p>&nbsp;</p>
		    <table width="581" border="0" cellpadding="7" cellspacing="0">
              <tr>
                <td width="178"><div align="center" class="style10">About Me </div></td>
                <td width="375"><div align="right">

                  <%
                        if(email.equals(email1))
                        {
                            response.sendRedirect("userhome.jsp");
                        }
                        else if(status.equals("no action"))
                        {
                   %>
                             ..
                             <form id="form1" name="form1" method="post" action="cancel_friend_request.jsp">
                               <span class="style17"><span class="style18">Request Sent..</span>           </span>
                      <input type="hidden" name="sendto" value="<%= email1 %>" />
                      <input type="hidden" name="sendfrom" value="<%= email %>" />
                        <label>
                        <input type="submit" id="cancelrequest" name="Submit" value="Cancel" />
                        </label>
                  </form>
                  <%
                        }
                        else if(status.equals("friend"))
                        {
                            %>
                            <span class="style17"><span class="style18">Friends</span></span>
                            <%
                        }
                        else
                        {
                            %>
                              <form id="form1" name="form1" method="post" action="add_friend.jsp">
                                      <input type="hidden" name="sendto" value="<%= email1 %>" />
                                      <input type="hidden" name="sendfrom" value="<%= email %>" />
                                      <label>
                                      <input type="submit" name="Submit" value="Add Friend" id="addfriendbutton" />
                                      </label>
                  </form>
                            <%
                        }
                  %>
                 
                    
                   </div>                </td>
              </tr>
              <tr>
                <td><div align="right" class="style22 style13 style20"><strong><span class="style9">Email</span>: </strong></div></td>
				<%
					if(remail.equals("friend"))
					{
						if(status.equals("friend"))
						{
				%>
                			<td><span class="style25 style22 style24"><strong><%= email1 %></strong></span></td>
				<%
						}
					}
				%>
				
				<%
					if(remail.equals("friend"))
					{
						if(!status.equals("friend"))
						{
				%>
                			<td><span class="style25 style22"><strong><%= "*****************" %></strong></span></td>
				<%
						}
					}
				%>
				
				<%
					if(remail.equals("all"))
					{
				%>
					<td><span class="style25 style22"><strong><%= email1 %></strong></span></td>
				<%
					}
				%>
				<%
					if(remail.equals("private"))
					{
				%>
					<td><span class="style25 style22"><strong><%="*****************"%></strong></span></td>
				<%
					}
				%>
              </tr>
              <tr>
                <td><div align="right" class="style22 style14 style20"><strong>Mobile  Number : </strong></div></td>
				<%
					if(rmobile.equals("friend"))
					{
						if(status.equals("friend"))
						{
				%>
                <td><span class="style25 style22 style24"><strong><%= tel1 %></strong></span></td>
				<%
						}
					}
				%>
				
				<%
					if(rmobile.equals("friend"))
					{
						if(!status.equals("friend"))
						{
				%>
				<td><span class="style25 style22"><strong><%= "**********" %></strong></span></td>
				<%
						}
					}
				%>
				<%
					if(rmobile.equals("all"))
					{
				%>
				<td><span class="style25 style22"><strong><%= tel1 %></strong></span></td>
				<%
					}
				%>
				<%
					if(rmobile.equals("private"))
					{
				%>
				<td><span class="style25 style22"><strong><%= "**********" %></strong></span></td>
				<%
					}
				%>
              </tr>
              <tr>
                <td><div align="right" class="style22 style14 style20"><strong>D.O.B : </strong></div></td>
                <td><span class="style22 style24 style25"><strong><%= dob1 %></strong></span></td>
              </tr>
              <tr>
                <td><div align="right" class="style22 style13 style20"><strong><span class="style9">Gender</span> : </strong></div></td>
                <td><span class="style22 style24 style25"><strong><%= gender1 %></strong></span></td>
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
		    <p><br/>
	        </p>
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
