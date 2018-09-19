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
<title>User Home</title>
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
.style12 {
	color: #0000FF;
	font-weight: bold;
	font-size: 15px;
}
.style13 {font-size: 16px}
.style14 {color: #0000FF}
.style16 {
	font-size: 12px;
	font-weight: bold;
	color: #0000FF;
}
.style18 {color: #0000FF; font-size: 10; }
.style20 {color: #0000FF; font-weight: bold; }
.style21 {color: #0000FF; font-weight: bold; font-size: 14px; }
.style22 {
	color: #FF0000;
	font-weight: bold;
}
.style23 {color: #2A00AA}
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
            <td width="58"> <a href="user_inbox.jsp" class="style23" style="text-decoration:none">
			  <div style="height:34px;background: url('images/inbox1.png') no-repeat;padding-left: 32px;cursor: pointer;">
			    <strong> <span style="font-size:20px;font-family:'Times New Roman', Times, serif;">
		        <% if(counter!=0) out.println(counter); %>
		        </span></strong>
                            </a></div>
            </a></td>
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
 					<li><a href="forum.jsp">Forum</a></li>
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
          <br/>
            <form id="form1" name="form1" method="post" action="post_insert.jsp" onsubmit="return checkPostField()">
              <table width="473" border="0" cellspacing="0">
                <tr>
                  <td>
                    <div align="right">
                      <textarea name="postmsg" cols="75" rows="5" placeholder="&nbsp;what's on your mind?" style="border-radius:10px;border:1px solid #FF9900;resize:none;"></textarea>
                      <br/>
                      
                      <input type="submit" name="Submit" value="Post" id="postBtn" />
                    </div></td>
                </tr>
              </table>
            </form>
            <table width="625" cellspacing="1">
            <%
            /*****Post Display****/
            Statement stmt2 = con.createStatement();
            ResultSet rst2 = stmt2.executeQuery("select * from post order by post_slno desc");
            String post_msg ="",pemail="";
            String post_date="",image="",fname1="",lname1="",post_slno="";
            while(rst2.next())
            {
                post_slno = rst2.getString("post_slno");
                pemail=rst2.getString("email");
                post_msg = rst2.getString("post_msg");
                post_date = rst2.getString("post_date");
                String uemail = (String)session.getAttribute("email");
                //out.println(pemail);
   
                   
                String femail="";
                Statement stm = con.createStatement();
                ResultSet prst = stm.executeQuery("select * from friend where sendto='"+pemail+"' and sendfrom='"+uemail+"' and status='friend'");
                while(prst.next())
                {

                    Statement stmt3 = con.createStatement();
                    ResultSet rst3 = stmt3.executeQuery("select * from userreg where email='"+pemail+"'");
                    if(rst3.next())
                    {
                            image =  rst3.getString("profilepic");
                            fname1 = rst3.getString("fname");
                            lname1 = rst3.getString("lname");
                    }
                /*******like counter*******/
                Statement lcountst = con.createStatement();
                ResultSet lcountrs = lcountst.executeQuery("select * from like_counter where post_slno='"+post_slno+"'");
                String lcount="";
                int lkcount=0;
                while(lcountrs.next())
                {
                     lcount = lcountrs.getString("count");
                }
                if(! "".equals(lcount))
                {
                    lkcount = Integer.parseInt(lcount);
                }

                /*************************/  
            %>
            <tr style="width:540px">
                    <td width="68" rowspan="2"><img src="profilepic/<%=image %>" height="68" width="60"/></td>
                    <td width="545"><p>&nbsp;</p>
                      <div class="style12" style="display:block;">
					  <a href="view_user_profile.jsp?email=<%=pemail%>" style="text-decoration:none"><strong><%= fname1 %>&nbsp;<%= lname1 %></strong></a>
					  </div>
              <div style="width:500px;word-wrap:break-word;margin-top:0px;letter-spacing:1px;"><%=post_msg %></div></td>
       		  </tr>
            
            <tr>
              <td height="45"><a href="show_like.jsp?post_slno=<%= post_slno %>" class="likeunlike"><%= lkcount%> People like this</a> 
                  <%
                  if(pemail.equals(email))
                  {
                  %>
                  <span class="style13">.</span> 
                  <a href="delete_post.jsp?post_slno=<%= post_slno %>" class="likeunlike">Delete</a>
                  <%
                  }
                  %>
                  <br/>
                <span class="style14"><strong>Posted on:</strong> <%= post_date %> </span></td>
            </tr>
                <tr>
                    <td></td>
                    <td>
                    <%
                        /****like unlike********/
                        Statement likest = con.createStatement();
                        ResultSet likers = likest.executeQuery("select * from like_count where email='"+email+"' and post_slno='"+post_slno+"'");
                        String like="";
                        if(likers.next())
                        {
                            like = "yes";
                        }
                        if("yes".equals(like))
                        {
                        %>
                          <a href="unlike.jsp?post_slno=<%= post_slno %>" class="likeunlike">unlike</a>
                        <%
                        }
                       else
                        {
                            %><a href="like.jsp?post_slno=<%= post_slno %>" class="likeunlike">like</a><%
                        }
                         %>

                         &nbsp;&nbsp;
                         <a href="" class="likeunlike" onClick="document.getElementById('<%= post_slno %>').innerHTML='<form action=comment_insert.jsp><input type=hidden name=post_slno value=<%= post_slno %>><input type=text name=comment placeholder=Comment.....><input type=submit id=commentBtn value=Comment></form>';return false;">comment</a>&nbsp;&nbsp;
                    <br/>
                    <div id="<%= post_slno %>">                    </div>

                       <%
                        Connection con1 = DbConnection.getConnect();
                        Statement cst = con1.createStatement();
                        ResultSet crs = cst.executeQuery("select * from comment where post_slno='"+post_slno+"'");
                        while(crs.next())
                        {
                            String cuserid =  crs.getString("email");
                            Statement cst1 = con1.createStatement();
                            ResultSet crs1 = cst1.executeQuery("select * from userreg where email='"+cuserid+"'");
                            String cfname="",clname="",cimage="";
                            if(crs1.next())
                            {
                                cfname = crs1.getString("fname");
                                clname = crs1.getString("lname");
                                cimage = crs1.getString("profilepic");
                            }

                           %>
                           <table width="228" cellspacing="0">
                               <tr>
                                 <td width="60"><span class="style1"><img src="profilepic/<%= cimage %>" height="46" width="54" /></span><br></td>
                                   <td width="153"><p class="style12">
                                           <div class="style12" style="display:block;"><strong><span class="style9"><%= cfname%>&nbsp;<%= clname %></span></strong></div>
                                   <div style="width:500px;word-wrap:break-word;margin-top:0px;letter-spacing:1px;"><span class="style20">Says:</span> <%= crs.getString("msg") %></div>                                     
                                   <div style="width:200px;word-wrap:break-word;margin-top:0px;"><span class="style16">Posted on</span><strong>: &nbsp;</strong><span class="style18"><%= crs.getString("date_post") %></span></div></td>
                               </tr>
                      </table>
                           <%
                        }
                    %>                    </td>
                </tr>
                <%
                    }
                    }

                %>
        <!--extract  -->
        
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
