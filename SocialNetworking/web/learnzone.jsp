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
<title>Learning Zone</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style9 {font-size: 14px}
    .style19 {
	color: #0000CC;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
}
    .style24 {
	font-size: x-large;
	font-weight: bold;
	color: #0000FF;
}
    .style25 {
	font-size: 18px;
	font-weight: bold;
}
.style27 {
	font-size: 16px;
	font-weight: bold;
	color: #0000FF;
}
    .style28 {
	color: #0000FF;
	font-weight: bold;
}
    .style29 {font-size: 16px}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script type="text/javascript" src="JavaScript/script.js"></script>
</head>

    <body>
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
              </p>            </td>
            <td width="42"><a href="#"></a></td>
            <td width="54"><a href="userhome.jsp" class="style19" style="text-decoration:none">Home</a></td>
            <td width="156"><strong><font color="#0000CC" size="2"><%= fname %>&nbsp;<%= lname %></font></strong></td>
            <td width="68"><div align="center"><b><a href="logout.jsp" class="style9" style="text-decoration:none; color:#000099">Logout</a></b></div></td>
          </tr>
        </table>
      </div>
      <div id="userhomeleftbody">
        <p>&nbsp;</p>
      </div>
        <div id="userhomerbody">
          <div id="ucleft">
		    <p>&nbsp;</p>
		    <form id="form1" name="form1" method="post" action="learn_fileupload.jsp" enctype="multipart/form-data">
		      <table width="627" border="0" align="center" cellpadding="5">
                <tr>
                  <td width="459"><div align="center" class="style24">
                    <div align="left">LEARNING ZONE                    </div>
                  </div></td>
                  <td width="142"><div align="center" class="style25">
                    <label>
                    <input type="button" name="upload file" value="Upload Article" onclick="uploadFieldLearnZone()" id="uploadArticleBtn" />
                    </label>
                  </div></td>
                </tr>
              </table>
		      <p>&nbsp;</p>
		      <table width="407" border="0" align="center" id="uploadFileTable" cellpadding="7" cellspacing="0" bordercolor="#0000FF" bgcolor="#FCFCFC">
              </table>
		    </form>
			<form id="form2" name="form2" method="post" action="">
		      <table width="578" border="0" align="center" cellpadding="7" cellspacing="0">
                <tr>
                  <td><div align="center"><img src="images/Search-icon.png" width="100" height="100" /></div></td>
                </tr>
                <tr>
                  <td><label>
                    <div align="center">
                      <input type="text" name="searchboxLearnzone" id="learnzonefield" placeholder="Search........" onkeyup="learningzoneSearch()"/>
                    </div>
                  </label></td>
                </tr>
                <tr>
                  <td><label>
                    <div align="center">
                      <input type="submit" name="Submit2" value="Search" id="uploadBtn" />
                    </div>
                  </label></td>
                </tr>
              </table>
            </form><br/>
		    <div id="learnL">			</div>
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
    <p class="style28">&nbsp;</p>
    </body>
</html>
