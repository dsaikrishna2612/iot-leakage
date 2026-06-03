<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-quicksand.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script language="javascript" type="text/javascript">    
function valid()
{


var na3=document.s.userid.value;
if(na3=="")

{
alert("Please Enter User Name");
document.s.userid.focus();
return false;
}
else
{

}
var na4=document.s.pass.value;
if(na4=="")

{
alert("Please Enter Password");
document.s.pass.focus();
return false;
}



var na6=document.s.email.value;
if(na6=="")

{
alert("Please Enter the Email");
document.s.email.focus();
return false;
}

if (na6.indexOf("@", 0) < 0)
{
alert("Please enter a valid e-mail address.");
document.s.email.focus();
return false;
}

if (na6.indexOf(".", 0) < 0)
{
alert("Please enter a valid e-mail address.");
document.s.email.focus();
return false;
}	


var na7=document.s.mobile.value;
if(na7.length!=10)

{
alert("Please Enter Valid Mobile number or Enter 10 Digit number");
document.s.mobile.focus();
return false;
}

if(na7=="")

{
alert("Please Enter  Mobile number");
document.s.mobile.focus();
return false;
}

var na55=document.s.address.value;
if(na55=="")

{
alert("Please Enter Your Address");
document.s.address.focus();
return false;
}

var dob=document.s.dob.value;
if(dob=="")

{
alert("please Enter Your Date Of Birth");
document.s.dob.focus();
return false;
}

var na9=document.s.gender.value;
if(na9=="--Select--")

{
alert("Please Select Your Gender");
document.s.gender.focus();
return false;
}

var na11=document.s.pic.value;
if(na11=="")

{
alert("please Select Picture");
document.s.pic.focus();
return false;
}

}
</script>





<style type="text/css">
<!--
.style2 {
	color: #0000FF;
	font-size: 20px;
	font-weight: bold;
}
a:link {
	color: #FF00FF;
}
.style6 {	color: #0000FF;
	font-size: 22px;
	font-weight: bold;
}
.style6 {	color: #FF6600;
	font-size: 28px;
}
.style11 {color: #B9C322}
.style7 {
	color: #0000FF;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.style10 {color: #FF00FF;
	font-weight: bold;
}
.style30 {color: #FF00FF}
.style9 {color: #FF0000; font-weight: bold; }
.style12 {color: #FF0000}
.style13 {color: #666666}
.style31 {	font-size: 25px;
	color: #0000FF;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo style2">
        <blockquote>
          <p class="style6">Leakage of Authorization-Data in IoT Device Sharing New Attacks and Countermeasure </p>
          <p class="style6"></p>
        </blockquote>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home Page</span></a></li>
          <li class="active"><a href="UserLogin.jsp">User </a></li>
          <li><a href="ServerLogin.jsp">Server</a></li>
          
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="935" height="285" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="935" height="285" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="935" height="285" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span class="style31">Welcome To User Registration </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="img">
            <form name="s" action="UserRegisterAuthentication.jsp" method="post" onSubmit="return valid()"  id="" enctype="multipart/form-data">
              <label for="name"><span class="style9">User Name (required)</span></label>
              <p class="style9">
                <input id="name" name="userid" class="text" />
              </p>
              <span class="style9">
              <label for="password">Password (required)</label>
              </span>
              <p class="style9">
                <input type="password" id="password" name="pass" class="text" />
              </p>
              <span class="style9">
              <label for="email">Email Address (required)</label>
              </span>
              <p class="style9">
                <input id="email" name="email" class="text" />
              </p>
              <span class="style9">
              <label for="mobile">Mobile Number (required)</label>
              </span>
              <p class="style9">
                <input id="mobile" name="mobile" class="text" />
              </p>
              <span class="style9">
              <label for="address">Your Address</label>
              </span>
              <p class="style9">
                <textarea id="address" name="address" rows="3" cols="50"></textarea>
              </p>
              <span class="style9">
              <label for="dob">Date of Birth (required)<br />
              </label>
              </span>
              <p class="style9">
                <input id="dob" name="dob" class="text" />
              </p>
              <span class="style9">
              <label for="gender">Select Gender (required)</label>
              </span>
              <p class="style9">
                <select id="s1" name="gender" style="width:480px;" class="text">
                  <option>--Select--</option>
                  <option>MALE</option>
                  <option>FEMALE</option>
                </select>
              </p>
              <span class="style9">
              <label for="pincode"></label>
              </span>
              <p class="style9">&nbsp;</p>
              <span class="style9">
              <label for="location"></label>
              </span>
              <p class="style9">
                <label for="pic">Select Profile Picture (required)</label>
                <input type="file" id="pic" name="pic" class="text" />
              </p>
              <p><br />
                  <input name="submit" type="submit" value="REGISTER" />
              </p>
              <p align="right" class="style30"><a href="index.html" class="style10">Back</a></p>
            </form>
          </div>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li>
              <p><a href="UserRegister.jsp">Home</a></p>
              <span class="style13"><a href="UserLogin.jsp">User Login </a></span> </li>
            <li>I<span class="style11"><a href="index.html">ndex Page </a></span></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
 
</div>
</body>
</html>
