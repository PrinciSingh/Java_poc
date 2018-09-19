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

<%
    String address="",school="",college="",work="",curcity="",hometown="",status="",interest="",country="";
    Statement stmt = con.createStatement();
    ResultSet rst = stmt.executeQuery("select * from personal where email='"+email+"'");
    if(rst.next())
    {
        address=rst.getString("address");
        if(address.equals(""))
            {
                address="Not Mentioned";
            }
        school=rst.getString("school");
        if(school.equals(""))
            {
                school="Not Mentioned";
            }
        college=rst.getString("college");
        if(college.equals(""))
            {
                college="Not Mentioned";
            }
        work=rst.getString("work");
        if(work.equals(""))
            {
                work="Not Mentioned";
            }
        curcity=rst.getString("currentcity");
        if(curcity.equals(""))
            {
                curcity="Not Mentioned";
            }
        hometown=rst.getString("hometown");
        if(hometown.equals(""))
            {
                hometown="Not Mentioned";
            }
        status=rst.getString("status");
        interest=rst.getString("interest");
        if(interest.equals(""))
            {
                interest="Not Mentioned";
            }
        country=rst.getString("country");
        if(country.equals(""))
            {
                country="Not Mentioned";
            }
    }
    else
    {
        address="Not Mentioned";
        school="Not Mentioned";
        college="Not Mentioned";
        work="Not Mentioned";
        curcity="Not Mentioned";
        hometown="Not Mentioned";
        status="Not Mentioned";
        interest="Not Mentioned";
        country="Not Mentioned";
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User Profile</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {font-weight: bold}
.style9 {font-size: 14px}
    .style10 {
	font-size: 18px;
	font-weight: bold;
	color: #FF9933;
}
.style13 {font-size: 18}
.style17 {color: #0033cc}
    .style19 {font-weight: bold}
.style21 {color: #609142}
    .style22 {color: #0000FF}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/script.js"></script>
	<script type="text/javascript">
            function basicEditFieldGenerate()
            {
                document.getElementById("fname").innerHTML="<input type='text' value='<%=fname%>' name='fname'>";
                document.getElementById("lname").innerHTML="<input type='text' value='<%=lname%>' name='lname'>";
                document.getElementById("mobno").innerHTML="<input type='text' value='<%=mobno%>' name='mobno'>";
                document.getElementById("dob").innerHTML="<input type='text' value='<%=dob%>' name='dob'>";
                document.getElementById("updateButton").innerHTML="<input type='submit' value='Update' class='lbuttonr'>";
                document.getElementById("cancelButton").innerHTML="<input type='button' value='Cancel' class='lbuttonr' onclick='window.location.reload()'>";
            }

            function personalEditFieldGenerate()
            {
                document.getElementById("address").innerHTML="<input type='text' value='<%=address%>' name='address'>";
                document.getElementById("school").innerHTML="<input type='text' value='<%=school%>' name='school'>";
                document.getElementById("college").innerHTML="<input type='text' value='<%=college%>' name='college'>";
                document.getElementById("work").innerHTML="<input type='text' value='<%=work%>' name='work'>";
                document.getElementById("curcity").innerHTML="<input type='text' value='<%=curcity%>' name='curcity'>";
                document.getElementById("hometown").innerHTML="<input type='text' value='<%=hometown%>' name='hometown'>";
                document.getElementById("status").innerHTML="<select name='status'><option value='Not Mentioned'>------Select Status------</option>\n\
                                                              <option value='Single'>Single</option>\n\
                                                              <option value='Married'>Married</option>\n\
                                                              <option value='In a Relation'>In a Relation</option>\n\
                                                             </select>";
                document.getElementById("interest").innerHTML="<input type='text' value='<%=interest%>' name='interest'>";
                document.getElementById("country").innerHTML="<input type='text' value='<%=country%>' name='country'>";
                document.getElementById("update").innerHTML="<input type='submit' value='Update' class='lbuttonr'>";
                document.getElementById("cancel").innerHTML="<input type='button' value='Cancel' class='lbuttonr' onclick='window.location.reload()'>";
            }
	</script>

</head>

    <body>
         <%

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
    <div id="container">
      <div class="userhome_header">
        <table width="1101" border="0" cellpadding="7" cellspacing="0">
          <tr>
            <td width="232"><label></label>
            <img src="images/logo1.png" width="234" height="65" /></td>
            <td width="465"><input name="textfield" type="text" size="60" id="searchbox" placeholder="Search for people" onkeyup="suggest()"/></td>
            <td width="43"><a href="javascript:" onclick="showRequest()">
                    <div style="height:33px;background: url('images/friendrequest.gif') no-repeat;padding-left: 26px;">
                       <b> <span style="color:#000099;font-size:18px;font-family:'Times New Roman', Times, serif;"><% if(count!=0) out.println(count); %></span></b>
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
              <form action="profile_update.jsp" name="editFrm1" method="post">
              <table width="449" border="0" align="center" cellpadding="7" cellspacing="0">
                <tr>
                  <td width="226"><div align="center" class="style17">
                    <div align="right" class="style19 style10">Basic Details  </div>
                  </div></td>
                  <td width="209"><div align="center" class="style17">
             <div align="center" class="style10" style="cursor:pointer;text-decoration:underline;"onclick="basicEditFieldGenerate()">Edit</div>
                  </div></td>
                </tr>
                <tr>
                  <td><div align="right" class="style13 style17"><strong>First Name </strong></div></td>
                  <td id="fname"><span class="style25 style21"><strong><%= fname %></strong></span></td>
                </tr>
                <tr>
                  <td><div align="right" class="style13 style17"><strong>Last Name </strong></div></td>
                  <td id="lname"><span class="style25 style21"><strong><%= lname %></strong></span></td>
                </tr>
                <tr>
                  <td><div align="right" class="style13 style17"><strong>Email Id </strong></div></td>
                  <td id="email"><span class="style25 style21"><strong><%= email %></strong></span></td>
                </tr>
                <tr>
                  <td><div align="right" class="style13 style17"><strong>Phone Number 	</strong></div></td>
                  <td id="mobno"><span class="style25 style21"><strong><%= mobno %></strong></span></td>
                </tr>
                <tr>
                  <td><div align="right" class="style13 style17"><strong>Gender</strong></div></td>
                  <td id="gender"><span class="style25 style21"><strong><%= gender %></strong></span></td>
                </tr>
                <tr>
                  <td><div align="right" class="style13 style17"><strong>D.O.B</strong></div></td>
                  <td id="dob"><span class="style25 style21"><strong><%= dob %></strong></span></td>
                </tr>
                <tr>
                  <td><div align="right" class="style13 style17"><strong>Started on </strong></div></td>
                  <td id="datereg"><span class="style21 style25"><strong><%= datereg %></strong></span></td>
                </tr>
                <tr>
                  <td><div align="right" id="updateButton"></div>				  </td>
                  <td><div align="left" id="cancelButton"></div></td>
                </tr>
              </table>
            </form>
              <p class="style26">  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - </p>
            <form id="form1" name="form1" method="post" action="personal_data_update.jsp">
                <table width="450" border="0" align="center" cellpadding="7" cellspacing="0">
                  <tr>
                    <td><div align="right"><span class="style19 style10">Personal Details</span></div></td>
                    <td><div align="center"><span class="style10" style="cursor:pointer;text-decoration:underline;" onclick="personalEditFieldGenerate()">Edit</span></div></td>
                  </tr>
                  <tr>
                    <td width="218"><div align="right" class="style22"><strong>Address</strong></div></td>
                    <td width="204" class="style21" id="address"><div align="left"><strong><%=address%></strong></div></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style22"><strong>School</strong></div></td>
                    <td class="style21" id="school"><div align="left"><strong><%=school%></strong></div></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style22"><strong>College</strong></div></td>
                    <td class="style21" id="college"><div align="left"><strong><%=college%></strong></div></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style22"><strong>Work</strong></div></td>
                    <td class="style21" id="work"><div align="left"><strong><%=work%></strong></div></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style22"><strong>Current City </strong></div></td>
                    <td class="style21" id="curcity"><div align="left"><strong><%=curcity%></strong></div></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style22"><strong>Home Town </strong></div></td>
                    <td class="style21" id="hometown"><div align="left"><strong><%=hometown%></strong></div></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style22"><strong>Status</strong></div></td>
                    <td class="style21" id="status"><div align="left"><strong><%=status%></strong></div></td>
                  </tr>
                  <tr>
                    <td><div align="right" class="style22"><strong>Interest</strong></div></td>
                    <td class="style21" id="interest"><div align="left"><strong><%=interest%></strong></div></td>
                  </tr>
                  <tr>
                    <td class="style22" ><div align="right"><strong>Country</strong></div></td>
                    <td ><div align="left" class="style21" id="country"><strong><%=country%></strong></div></td>
                  </tr>
                  <tr>
                    <td ><div align="right" id="update"></div></td>
                    <td ><div align="left" id="cancel"></div></td>
                  </tr>
              </table>
            </form>
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
