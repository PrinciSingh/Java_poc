<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friends Forever Login Error</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	table tr,th,td
	{
		border:0px;
	}
	a#vlb{display:none}
	.style1 {
	color: #0000FF;
	font-weight: bold;
	font-size: 14px;
}
    .style2 {
	color: #D40000;
	font-weight: bold;
	font-size: 14px;
}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script language="javascript">
            function checkBlankField()
            {
                len = document.frm1.elements.length;
                for(i=0;i<len-1;i++)
                {
                    if(document.frm1.elements[i].value=="")
                    {
                       document.frm1.elements[i].focus();
                       document.getElementById("checkr").innerHTML ="Enter Code";
                       document.getElementById("checkr").style.background="#FFFF99";
                       document.getElementById("checkr").style.border="1px solid #FF0000";
                       return false;
                    }
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
      <p align="center">&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <form action="login_error_check.jsp" name="frm1" onsubmit="return checkBlankField()" method="post">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <table width="335" height="128" border="1" align="center" cellpadding="3" cellspacing="1">
        <tr>
          <td colspan="2" bgcolor="#C0DCC0"><p align="center" class="style2">Invalid Email Or Password Please Enter Again </p>          </td>
        </tr>
        <tr>
          <td width="189"><div align="right" class="style1">Email</div></td>
          <td width="298"><label>
            <input type="text" name="userid" />
          </label></td>
        </tr>
        <tr>
          <td><div align="right" class="style1">Password</div></td>
          <td><label>
            <input type="password" name="password" />
          </label></td>
        </tr>
        <tr>
          <td colspan="2"><div align="center">
            <label>
            <input name="Submit" type="submit" class="lbutton" style="color:#FFFFFF;font-weight:bold" value="Login" />
            </label>
          </div></td>
        </tr>
      </table>
      </form>
      <p align="center">&nbsp;</p>
      <p>&nbsp;</p>
      
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
