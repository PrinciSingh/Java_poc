
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Friends Forever Login form</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {
	font-size: 24px;
	font-weight: bold;
	color: #000066;
}
.style2 {color: #000066}
.style4 {color: #000066; font-size: 14; }
.style5 {color: #000066; font-size: 14px; }
.style6 {font-size: 14px}
-->
</style>
<link rel="stylesheet" type="text/css" href="engine/style.css" media="screen" />
	<style type="text/css">
	a#vlb{display:none}.style7 {font-size: 13px}
    </style>
	<script type="text/javascript" src="engine/jquery.js"></script>
        <script language="javascript">

            function checkBlankField()
            {
                len = document.frm1.elements.length;
                for(i=0;i<len-1;i++)
                {
                    if(document.frm1.elements[i].value=="" || document.frm1.elements[i].value=="Select:" || document.frm1.elements[i].value=="Month:"||document.frm1.elements[i].value=="Days:"||document.frm1.elements[i].value=="Year:")
                    {
                       document.frm1.elements[i].focus();
                       document.getElementById("checkr").innerHTML ="You must fill in all of the fields";
                       document.getElementById("checkr").style.background="#FFFF99";
                       document.getElementById("checkr").style.border="1px solid #FF0000";
                       return false;
                    }
                }
            }
            function checkNum(num)
            {
                x = event.keyCode;
                if(x<48 || x>57)
                {
                    return false;
                }
            }

            function checkStatus(eid)
            {
                var xmlhttp;
                if (window.XMLHttpRequest)
                  {
                    xmlhttp=new XMLHttpRequest();
                  }
                else
                  {
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                  }
                xmlhttp.open("GET","check_staus.jsp?eid="+eid,true);
                xmlhttp.send();

                xmlhttp.onreadystatechange=function()
                  {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                       var result = xmlhttp.responseText;
                       if(result.trim()=="yes")
                       {
                           document.frm1.email.value = "";
                           document.getElementById("emailL").innerHTML ="* Email ID Already Exists";
                       }
                       else
                           {
                               document.getElementById("emailL").innerHTML="";
                           }
                    }
                  }
            }
        </script>
</head>

    <body onload="document.form1.userid.focus();" >
<div id="container">
    <div id="header">
    <div class="left_header"><img src="images/logo1.png" width="389" height="69" /></div>

    <div class="right_header">

      <form id="form1" name="form1" method="post" action="login_val.jsp"
      style="margin:0px;"> 
        <table width="450" border="0" align="right">
          <tr>
            <td width="205"><span class="style7">Email</span></td>
            <td width="174"><span class="style7">Password</span></td>
            <td width="99">&nbsp;</td>
          </tr>
          <tr>
            <td><label>
              <input name="userid" type="text" class="lfield" id="textfield" />
            </label></td>
            <td><label>
              <input name="password" type="password" class="lfield" id="textfield2" />
            </label></td>
            <td><label>
              <input name="button" type="submit" class="lbutton" id="button" value="Log In" />
            </label></td>
          </tr>
          <tr>
              <td><label id="checkL">
                    <input type="checkbox"  name="keepmelogin" id="checkbox" value="on"/>
              Keep Me logged in</label></td>
            <td><a href="forgot_password.jsp" style="text-decoration:none;color:black">Forgot your password?</a></td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </form>
    </div>
  </div>
  <div id="body">
    <div class="left_body">

            <div id="wowslider-container">
	<div id="wowslider-images">
<a href="#"><img src="data/images/connectandshare.jpg" alt="" title="" id="wows0"/></a>
<a href="#"><img src="data/images/images_(1).jpg" alt="" title="" id="wows1"/></a>
<a href="#"><img src="data/images/images_(3).jpg" alt="" title="" id="wows3"/></a>
<a href="#"><img src="data/images/images.jpg" alt="images" title="" id="wows4"/></a>
</div>
<div class="ws_bullets">
<a href="#wows0" title="connectandshare"><img src="data/tooltips/connectandshare.jpg" alt="connectandshare"/></a>
<a href="#wows1" title="images (1)"><img src="data/tooltips/images_(1).jpg" alt="images (1)"/></a>
<a href="#wows2" title="images (2)"><img src="data/tooltips/images_(2).jpg" alt="images (2)"/></a>
<a href="#wows3" title="images (3)"><img src="data/tooltips/images_(3).jpg" alt="images (3)"/></a>
<a href="#wows4" title="images"><img src="data/tooltips/images.jpg" alt="images"/></a>
</div>
<a style="display:none" href="http://wowslider.com">Js Photo Slider by WOWSlider.com v1.3</a>
	</div>
	<script type="text/javascript" src="engine/script.js"></script>
    </div>
    <div class="right_body">
        <form name="frm1" action="reginsert.jsp" onsubmit="return checkBlankField()">
      <table width="100%" border="0" cellpadding="5">
        <tr>
          <td width="38%">&nbsp;</td>
          <td width="62%">&nbsp;</td>
        </tr>
        <tr>
          <td><div align="center" class="style1">Sign Up</div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right"><span class="style2"></span></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><div align="right" class="style5">First Name:</div></td>
          <td><label>
            <input name="fname" type="text" class="rfield" id="fname" placeholder="First Name"/>
          </label></td>
        </tr>
        <tr>
          <td><div align="right" class="style5">Last Name:</div></td>
          <td><input name="lname" type="text" class="rfield" id="lname" placeholder="Last Name"/></td>
        </tr>
        <tr>
          <td><div align="right" class="style5">Your Email:</div></td>
          <td><input name="email" type="text" class="rfield" id="email" placeholder="Email" onblur="checkStatus(this.value)"/>
          <br/><span id="emailL" style="color:red;font-weight:bold"></span>
          </td>
        </tr>
        <tr>
          <td><div align="right" class="style5">Re-enter Email:</div></td>
          <td><input name="reemail" type="text" class="rfield" id="reemail" placeholder="Re-Email"/>
          <br/><span id="reemailL" style="color:red;font-weight:bold"></span>
          </td>
        </tr>
        <tr>
          <td><div align="right" class="style5">New Password:</div></td>
          <td><input name="pwd" type="password" class="rfield" id="pwd" placeholder="New Password"/></td>
        </tr>
        <tr>
          <td><div align="right" class="style4"><span class="style6">Telephone</span>:</div></td>
          <td><input name="tel" type="text" class="rfield" id="tel" onkeyup="return checkNum(this.value)" placeholder="Phone"/></td>
        </tr>
        <tr>
          <td><div align="right" class="style5">I am:</div></td>
          <td><label>
            <select name="gender" id="gender">
              <option selected="selected">Select:</option>
              <option>Male</option>
              <option>Female</option>
            </select>
          </label></td>
        </tr>
        <tr>
          <td><div align="right" class="style5">Birthday:</div></td>
          <td><label>
            <select name="month" id="month">
              <option>Month:</option>
              <option>Jan</option>
              <option>Feb</option>
              <option>Mar</option>
              <option>Apr</option>
              <option>May</option>
              <option>June</option>
              <option>July</option>
              <option>Aug</option>
              <option>Sep</option>
              <option>Oct</option>
              <option>Nov</option>
              <option>Dec</option>
            </select>
            <select name="day" id="day">
              <option>Days:</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
              <option>13</option>
              <option>14</option>
              <option>15</option>
			  <option>16</option>
              <option>17</option>
              <option>18</option>
              <option>19</option>
              <option>20</option>
              <option>21</option>
              <option>22</option>
              <option>23</option>
              <option>24</option>
              <option>25</option>
              <option>26</option>
              <option>27</option>
              <option>28</option>
              <option>29</option>
              <option>30</option>
			  <option>31</option>
            </select>
            <select name="year" id="year">
			<option>Year</option>
              <option>1940</option>
              <option>1941</option>
              <option>1942</option>
              <option>1943</option>
              <option>1944</option>
              <option>1945</option>
              <option>1946</option>
              <option>1947</option>
              <option>1948</option>
			  <option>1949</option>
              <option>1950</option>
              <option>1951</option>
              <option>1952</option>
              <option>1953</option>
              <option>1954</option>
              <option>1955</option>
              <option>1956</option>
              <option>1957</option>
			  <option>1958</option>
              <option>1959</option>
              <option>1960</option>
              <option>1961</option>
              <option>1962</option>
              <option>1963</option>
              <option>1964</option>
              <option>1965</option>
              <option>1966</option>
              <option>1967</option>
              <option>1968</option>
              <option>1969</option>
              <option>1970</option>
              <option>1971</option>
               <option>1972</option>
              <option>1973</option>
              <option>1974</option>
              <option>1975</option>
              <option>1976</option>
              <option>1977</option>
              <option>1978</option>
              <option>1979</option>
              <option>1980</option>
			  <option>1981</option>
              <option>1982</option>
              <option>1983</option>
              <option>1984</option>
              <option>1985</option>
              <option>1986</option>
              <option>1987</option>
              <option>1988</option>
              <option>1989</option>
              <option>1990</option>
              <option>1991</option>
              <option>1992</option>
              <option>1993</option>
			  <option>1994</option>
              <option>1995</option>
              <option>1996</option>
              <option>1997</option>
              <option>1998</option>
              <option>1999</option>
              <option>2000</option>
            </select>
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><label>
            <input name="button2" type="submit" class="lbuttonr" id="button2" value="Sign Up" />
          </label></td>
        </tr>
      </table>
      <div id="checkr" style="margin-top: 15px;width:300px;height:30px;margin-left:120px;text-align:center;" ></div>
      </form>
    </div>
    <p>&nbsp;</p>
  </div>
  </div>
<div id="footer">Designed by Asit Kumar Mohanty</div>
</body>
</html>
