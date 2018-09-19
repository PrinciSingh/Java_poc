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
	table tr,th,td
	{
		border:0px;
	}

        a#vlb{display:none}
        .style7 {font-weight: bold}
        .style9 {font-size: 14px}
        .style19
        {
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
.style20 {
	font-size: x-large;
	font-weight: bold;
	color: #0000FF;
}
-->
        </style>
</head>

    <body onload="JavaScript:AutoRefresh(5000);">
      <%
            String email = (String)session.getAttribute("email");
            String fname = (String)session.getAttribute("fname");
            String lname = (String)session.getAttribute("lname");

            String email1 = request.getParameter("email1");
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
            <td>
				<div class="sidebar_section">
					<ul class="category_list">
						<li><a href="view_user_profile.jsp?email=<%= email1 %>">About me</a></li>
						<li><a href="view_photos.jsp?email1=<%= email1 %>">Photos</a></li>
						<li><a href="view_friends.jsp?email=<%= email1 %>">Friends</a></li>
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
		    <div align="center" class="style20"><%=fname1%>'s Albums		    </div>
		    <p>&nbsp;</p>
		    <table border="0">

       <%
            String email2 = (String)session.getAttribute("email1");
            Statement st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery("select * from album_master where email='"+email1+"'");
            int count=0;
            while(rs2.next())
            {
                String album_slno=rs2.getInt("album_slno")+"";
                String title = rs2.getString("album_title");
                String description = rs2.getString("description");
                Statement st3 = con.createStatement();
                ResultSet rs3 = st3.executeQuery("select * from album_details where album_slno='"+album_slno+"'");
                int imageCount=0;
                String coverImage="noimage.jpg";
                String image="";
                while(rs3.next())
                {
                     image = rs3.getString("image");
                     String albumcover = rs3.getString("album_cover");
                     if("Y".equalsIgnoreCase(albumcover))
                     {
                        coverImage=email1+"/"+image;
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
                                <a href="view_album.jsp?album_slno=<%=album_slno %>&email1=<%=email1 %>">
                                    <img src="albums/<%=coverImage %>" width="140" height="130" border="0"/>
                                </a>
                            </td>
                        </tr>
                        <tr>
                           <th>
                               <a href="view_album.jsp?album_slno=<%=album_slno %>&title=<%=title %>" style="text-decoration:none">
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
