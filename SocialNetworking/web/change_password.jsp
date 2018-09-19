<%
    String email= request.getParameter("email");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friends Forever Verification</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}
    .style1 {
	font-size: 18px;
	font-weight: bold;
	color: #0000FF;
	font-family: "Times New Roman", Times, serif;
}
    .style6 {font-size: 14px; font-weight: bold; color: #0000FF; font-family: "Times New Roman", Times, serif; }
    .style7 {font-size: large}
    .style8 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.style9 {font-size: 12px; font-weight: bold; color: #0000FF; font-family: Arial, Helvetica, sans-serif; }
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
	<script type="text/javascript">
            function passwordValidate()
            {
				
                var newpassword = document.frm1.password.value;
                var confpassword = document.frm1.confpassword.value;
               
                if(newpassword=="")
                {

                    document.getElementById("errormsgNewpassword").innerHTML="<br/>* Enter New Password";
                    document.getElementById("errormsgNewpassword").style.color="#FF0000";
                    document.frm1.password.value="";
                    document.frm1.password.focus();
                    return false;
                }
                else
                {
                    document.getElementById("errormsgNewpassword").innerHTML="";
                }
                if(confpassword=="")
                {

                    document.getElementById("errormsgConfpassword").innerHTML="<br/>* Enter Confirm Password";
                    document.getElementById("errormsgConfpassword").style.color="#FF0000";
                    return false;
                }
                else
                {
                    document.getElementById("errormsgConfpassword").innerHTML="";
                }
                if(confpassword!=newpassword)
                {
                    document.getElementById("errormsgConfpassword").innerHTML="<br/>* Password does not match.";
                    document.getElementById("errormsgConfpassword").style.color="#FF0000";
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

<body >
<div id="container">
  <div id="header">
    <table width="981" border="0">
      <tr>
        <td width="276">&nbsp;</td>
        <td width="695"><img src="images/logo1.png" width="375" height="62"  /></td>
      </tr>
    </table>
  </div>
  <div id="body">
    <div>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <form name="frm1" action="reset_password.jsp" method="post" onsubmit="return passwordValidate()">
        <table width="390" border="0" align="center" cellpadding="5" cellspacing="1">
          <tr>
            <td colspan="2"><div align="center" class="style1">
              <div align="center" class="style7">Change Password </div>
            </div></td>
          </tr>
          <tr>
            <td width="117"><div align="right" class="style6 style8">New Password </div></td>
            <td width="258"><label>
              <input name="password" type="password" id="password" size="20" />
            </label><span id="errormsgNewpassword" style="font-weight:bold"></span></td>
          </tr>
          <tr>
            <td><div align="right" class="style9">Confirm Password </div></td>
            <td><label>
              <input name="confpassword" type="password" id="confpassword" size="20" />
            </label><span id="errormsgConfpassword" style="font-weight:bold"></span></td>
          </tr>
          <tr>
            <td colspan="2"><div align="center">
              <label>
                  <input type="hidden" name="email" value="<%=email%>">
              <input name="Submit" type="submit" class="lbuttonr" style="color:#FFFBF0;font-weight:bold" value="Save" />
              </label>
            </div></td>
          </tr>
        </table>
      </form>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </div>
  </div>
</div>
<div id="footer">Designed by Asit Kumar Mohanty</div>
</body>
</html>
