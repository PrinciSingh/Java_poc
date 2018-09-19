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
	String album_slno = request.getParameter("album_slno");
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
	a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
    </style>
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

        <script type="text/javascript">
            function checkDelete()
            {
                if(confirm("Do you really want to delete this request"))
                    return true;
                else
                    return false;
            }
        
            function checkBlankField()
            {
                var fileselect = document.frm1.albumPhoto.value;
                if(fileselect==null || fileselect=='')
                {
                    alert("Please Select An Image To Upload.");
                    return false;
                }
            }
	</script>

        <style type="text/css">
<!--
.style10 {
	color: #0000FF;
	font-size: 12px;
}
.style11 {
	font-size: x-large;
	font-weight: bold;
	color: #0000FF;
}
.style13 {font-size: 24px; font-weight: bold; color: #0000FF; }
.style14 {
	color: #0000FF;
	font-weight: bold;
}
-->
        </style>
</head>

    <body><%

            /***********Friend Request **********/
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from friend where sendto='"+email+"' and status='no action'");
            int cnt=0;
            while(rs1.next())
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

      <form action="AlbumPhotoUpload.jsp" name="frm1" method="POST" enctype="multipart/form-data" onsubmit="return checkBlankField()">
        <table width="622" height="130" align="center" cellpadding="2" cellspacing="0">
            <input type="hidden" name="title" value="<%= request.getParameter("title")%>" />
            <input type="hidden" name="album_slno" value="<%= request.getParameter("album_slno")%>" />
            <tr>
              <td width="190" rowspan="4"><div align="center"><span class="style13">Add Photos </span></div></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
				<td width="137">
			  <div align="right" class="style14">Select photo </div></td>
            <td width="281"><input type="file" name="albumPhoto" value="" /></td>
            </tr>
			<tr>
				<td>
					<div align="right" class="style14">Image caption </div></td>
            <td><input type="text" name="image_caption"/> </td>
            </tr>
            <tr>
				<td>
					<div align="right">
					  <input type="checkbox" name="album_cover" value="Y" />				
				  </div></td>
            	<td><span class="style14">Album Cover</span></td>
            </tr>
			<tr>
			  <td width="190"><div align="center" >
			  <a href="delete_album.jsp?album_slno=<%=album_slno%>" style="text-decoration:none;color:#FFFBF0;" id="unfriend">Delete This Album </a>
			  </div></td>
				<td><div align="right">
				  <input type="submit" value="Upload" id="uploadBtn" />
			    </div></td>
            	<td><input type="reset" value="Reset" id="uploadBtn"/></td>
          	</tr>
		</table>
        <p>&nbsp;</p>
      </form>
        <div class="highslide-gallery">
        <table border="0" cellspacing="8" align="left">
        <%
            Statement stm = con.createStatement();
            ResultSet rst = stm.executeQuery("select * from album_details where album_slno='"+album_slno+"'");
            int count=0;
            while(rst.next())
            {
                String imageno = rst.getString("image_slno");
                String image=email+"/"+rst.getString("image");
                String image_caption = rst.getString("image_caption");
                String uploaded = rst.getString("date_uploaded");
                count++;
                if(count==1)
                {
                    out.println("<tr>");
                }
                else if(count%5==0)
                {
                    %>
                        </tr> <tr>
                    <%
                }
        %>
        <td>
        <table border="0" style="border-collapse: collapse">
        <tr>
        <td>
            <a href="albums/<%= image %>" title="<%=image_caption %>" class="highslide" onclick="return hs.expand(this)" class="highslide-move">
               <img alt="<%= image %>"  src="albums/<%= image %>" width="130" height="130"/>
            </a><div class="highslide-caption" align='center'><%=image_caption %></div>
        </td>
        </tr>
        <tr>
            <td>
                <span class="style9 style10"><%= image_caption %><br/>
                <strong>Uploaded On: </strong><br/>
                <%= uploaded %><br/>
                <a href="DeleteAlbumPhoto.jsp?imgno=<%= imageno %>&album_slno=<%= album_slno %>&title=<%= request.getParameter("title")%>" onclick="return checkDelete()"><strong>Delete</strong></a></span>            </td>
        </tr>
        </table>
        </td>
        <%
        }
      %>
        </tr>
        </table>
        <div style="clear:both"></div>
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
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        </div>
    </div>
    </div>
    </body>
</html>
