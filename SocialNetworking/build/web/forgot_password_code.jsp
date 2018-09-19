<%
    String email = request.getParameter("email");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friends Forever</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 16px;
	font-weight: bold;
	color: #0066FF;
}
.style12 {
	font-size: large;
	font-weight: bold;
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #0000FF;
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
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <form action="forgot_password_code_verify.jsp" name="frm1" onsubmit="return checkBlankField()" method="post">
      <table width="556"  align="center" cellpadding="7" cellspacing="0" class="ctable">
        <tr>
          <td height="54" colspan="3"><div align="center" class="style12">Enter Code Sent To Your e-Mail </div></td>
        </tr>
        <tr>
          <td width="154"><div align="right"><span class="style7">Enter Code </span></div></td>
          <td colspan="2"><label>
            <input name="code" type="text" class="rfield"/>
          </label></td>
        </tr>
        <tr>
            <td></td>
            <td align="center">
			<div  style="width:180px;" id="checkr" ><b style="color:red">
				<%
						String msg = request.getParameter("msg");
						if(msg!=null)
							out.println(msg);
				%>
            </b></div></td>
            <td align="center"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td width="230">
            <div align="center">
                <input type="hidden" value="<%=email%>" name="email"/>
              <input name="Submit" type="submit" class="lbuttonr" id="proceed" value="Next"/>
            </div>          </td>
          <td width="116">&nbsp;</td>
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
