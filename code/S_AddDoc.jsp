<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Adding Documents..</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-quicksand.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
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
.style39 {font-size: 13px; font-weight: bold; color: #6666FF; }
.style35 {	color: #9900FF;
	font-weight: bold;
}
.style36 {color: #9900FF}
.style40 {color: #0000FF}
.style12 {color: #009900}
-->
</style>
<script type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
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
          <li><a href="UserLogin.jsp">User </a></li>
          <li class="active"><a href="ServerLogin.jsp">Server</a></li>
          
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
          <h2 class="style40"><span class="style12">Add Documents.. </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="img">
            <form action="S_AddDoc11.jsp" method="post"  name="form1" id="form1">
              <table width="648" border="0" align="center">
                <tr>
                  <td width="186"><span class="style39">Category (Required)</span></td>
                  <td width="452"><label> <br />
                        <input name="t1" type="text" size="40" />
                        <br />
                        <br />
                  </label></td>
                </tr>
                <tr>
                  <td><span class="style39">Title (Required)</span></td>
                  <td><p>
                      <input type="text" name="t2" size="40" />
                  </p></td>
                </tr>
                <tr>
                  <td><span class="style39">Uses (Required)</span></td>
                  <td><p>
                    <label>
                    <textarea name="textarea" cols="40" rows="4"></textarea>
                    </label>
                  </p></td>
                </tr>
                <tr>
                  <td><span class="style39">Choose Document</span></td>
                  <td><input type="file" id="file" name="file"  onchange="loadFileAsText()" size="29" /></td>
                </tr>
                <tr>
                  <td><span class="style39">Enter File Name </span></td>
                  <td><label> <br />
                        <input type="text" name="fname" size="40" />
                        <br />
                  </label></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td><label>
                    <textarea name="textarea1" id="textarea" cols="50" rows="18"></textarea>
                  </label></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="26"><label></label></td>
                  <td><label>
                    <input type="submit" name="Submit" value="Submit" />
                    <input type="reset" name="Submit2" value="Reset" />
                  </label></td>
                </tr>
              </table>
            </form>
          </div>
          <div class="clr"></div>
          <div align="right"><span class="style35"><a href="ServerMain.jsp" class="style36">Back</a></span></div>
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
              <p><a href="S_AddDoc.jsp">Home</a></p>
              <p><span class="style11"><a href="index.html">Log Out </a></span></p>
            </li>
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
