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
      %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My photos</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	table tr,th,td
	{
		border:0px;
	}

            a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
    .style10 {
	font-size: x-large;
	font-weight: bold;
	color: #0000FF;
}
.style14 {color: #0000FF;font-weight: bold;}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/script.js"></script>
        <script type="text/javascript">
//            function checkBlankField()
//            {
//                var title = document.frm1.title.value;
//                var arr = document.getElementsByName("accesstype");
//                count=0;
//           
//                var description = document.frm1.description.value;
//                if(title=="")
//                {
//
//                    document.getElementById("errormsgTitle").innerHTML="<br/>* Enter Album Title";
//                    return false;
//                }
//                else
//                {
//                    document.getElementById("errormsgTitle").innerHTML="";
//                }
//
//                for(i=0;i<arr.length;i++)
//                {
//                    if(arr[i].checked)
//                    {
//                       count= 1;
//                    }
//                }
//                if(count==0)
//                {
//                    alert("Select Who can view the Album ?");
//                    return false;
//                }
//            }
	</script>

</head>

    <body>
              <%
            /***********Friend Request **********/
            Statement stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("select * from friend where sendto='"+email+"' and status='no action'");
            int cnt=0;
            while(rst.next())
            {
                cnt++;
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
    <div id="container">
      <div class="userhome_header">
        <table width="1101" border="0" cellpadding="7" cellspacing="0">
          <tr>
            <td width="232"><label></label>
            <img src="images/logo1.png" width="234" height="65" /></td>
            <td width="465"><input name="textfield" type="text" size="60" id="searchbox" placeholder="Search for people" onkeyup="suggest()"/></td>
            <td width="43"><a href="javascript:" onclick="showRequest()">
                    <div style="height:33px;background: url('images/friendrequest.gif') no-repeat;padding-left: 26px;">
                       <b> <span style="color:#000099;font-size:18px;font-family:'Times New Roman', Times, serif;"><% if(cnt!=0) out.println(cnt); %></span></b>
                    </div>

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
          <div id="ucleft"> <br/>
              <form action="createalbum.jsp" name="frm1" method="post">
                <table width="620" border="0" align="center" cellpadding="7" cellspacing="2">
                  <tr>
                    <td><div align="center"><span class="style10">My Photos </span></div></td>
                    <td><div align="center">
                      <input type="button" onclick="generateCreateAlbumField()" value="Create Album" id="uploadBtn">
                    </div></td>
                  </tr>
                </table>
                <p>&nbsp;</p>
                <table width="430" border="0" align="center" cellpadding="6" cellspacing="0" id="createalbumfield">
                </table>
            </form>

       <table border="0">

       <%
            String email1 = (String)session.getAttribute("email");
            Statement st1 = con.createStatement();
            ResultSet rs1 = st.executeQuery("select * from album_master where email='"+email1+"'");
            int count=0;
            while(rs1.next())
            {
                String album_slno=rs1.getInt("album_slno")+"";
                String title = rs1.getString("album_title");
                String description = rs1.getString("description");
                ResultSet rs2 = st1.executeQuery("select * from album_details where album_slno='"+album_slno+"'");
                int imageCount=0;
                String coverImage="noimage.jpg";
                String image="";
                while(rs2.next())
                {
                     image = rs2.getString("image");
                     String albumcover = rs2.getString("album_cover");
                     if("Y".equalsIgnoreCase(albumcover))
                     {
                        coverImage=email+"/"+image;
                        imageCount++;
                     }
                     else
                     {
                        coverImage="noimage.jpg";
                     }
                 }// end: for Album Cover
                if(imageCount>0 && coverImage.equals("noimage.jpg"))
                    coverImage=image;
                
                count++;
                if(count==1)
                {
                    out.println("<tr>");
                }
                else if(count%5==0)
                {
                    out.println("</tr><tr>");
                }
                %>

                <td>
                <table border="1" class="table1">
                        <tr>
                            <td align="center" valign="middle">
                                <a href="AlbumDetails.jsp?album_slno=<%=album_slno %>&title=<%=title %>">
                                    <img src="albums/<%=coverImage %>" width="140" height="130" border="0"/>
                                </a>
                            </td>
                        </tr>
                        <tr>
                           <th>
                               <a href="AddAlbumDetails.jsp?album_slno=<%=album_slno %>&title=<%=title %>" style="text-decoration:none">
                                   <%= title %>
                               </a>
                           </th>
                        </tr>
                </table>
                </td>
        <%
            }
       %>

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
			<th height="27" colspan="3" bgcolor="#FFDF55" class="style9 style21"><span class="style14">Online Friends</span></th>
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
