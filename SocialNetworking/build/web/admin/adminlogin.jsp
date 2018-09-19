<%
	String msg = request.getParameter("msg");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friends Forever Login Error</title>
<link href="../style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}
#adminlogindiv
{
				border:2px solid red;
				border-radius:5px;
				box-shadow:15px 15px 10px;
				padding-top:20px;
				padding-bottom:20px;
				width:350px;
				height:130px;
				shadow:20px;
				margin:200px;
				background-color:white;
}
#errmsg
{
	border:1px solid red;
	width:100px;
	color:#FF0000;
}
.style5 {
	color: #0000FF;
	font-size: large;
}
    .style6 {color: #0000FF}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
</head>

<body >
<div id="container">
  <div id="header">

    <table width="981" border="0">
      <tr>
        <td width="276">&nbsp;</td>
        <td width="695"><img src="../images/logo1.png" width="375" height="62"  /></td>
      </tr>
    </table>
  </div>
  <div id="body" align="center">
    <div id="adminlogindiv" align="center">
      <form action="../AdminVerify" name="frm1" onsubmit="return checkBlankField()" method="post">
        <table width="343" height="178" align="center">
				<tr>
					<th height="31" colspan="2" id="th1"><span class="style5">Welcome To Admin Login Page.</span></th>
				</tr>
				<tr>
					<th colspan="2"></th>
				</tr>
				<tr>
				  <th width="108"><div align="right" class="style6">UserName:</div></th><td width="223"><input name="uname" type="text" size="20"/></td>
				</tr>
				<tr>
					<th><div align="right" class="style6">Password:</div></th><td><input name="password" type="password" size="20"/></td>
				</tr>
				<tr>
					<th colspan="2"><p>
					  <input type="submit" id="uploadBtn" value="Login"/>
					</p><br/>
					 </th>
				</tr>
		</table>
      </form>
    </div>
  </div>
</div>
<div id="footer">Designed by Asit Kumar Mohanty</div>
</body>
</html>
