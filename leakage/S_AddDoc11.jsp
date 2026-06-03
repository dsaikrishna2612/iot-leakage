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
.style34 {font-size: 15px; font-weight: bold; color: #6666FF; }
.style41 {color: #FF3300}
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
            <p>
              <%@ include file="connect.jsp" %>
              <%@ page import="java.io.*" %>
              <%@ page import="java.util.*" %>
              <%@ page import="com.oreilly.servlet.*" %>
              <%


try {	
	String dcat=request.getParameter("t1");

	
	String dtitle=request.getParameter("t2");
	//application.getAttribute("ddesc",ddesc);
	
	String duses=request.getParameter("textarea");

	
	String fname=request.getParameter("fname");
	//application.getAttribute("fname",fname);
	
	String doc=request.getParameter("textarea1");
	//application.getAttribute("doc",doc);
	
					
int i2=0;
		
		String query1="select * from documents  where  dtitle='"+dtitle+"' and dcategory='"+dcat+"' ";
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query1);
			if ( rs1.next()==true)
			   {
					
				%>
            </p>
            <p class="style18 style32">Title Already Exist in this Category, Please give some other Title Name or Category!!</p>
            <br/>
            <p><a href="S_AddDoc.jsp" class="style35">Back</a></p>
            <%
				}
				else
				{
				%>
            <form action="S_AddDoc12.jsp" method="post"  name="form1" id="form1" enctype="multipart/form-data">
              <table width="648" border="0" align="center">
                <tr>
                  <td><span class="style34">Category Name</span></td>
                  <td><label> <br />
                        <input name="dcat" type="text" value="<%=dcat%>"size="40" />
                        <br />
                  </label></td>
                </tr>
                <tr>
                  <td width="233"><span class="style34">Topic Name</span></td>
                  <td width="317"><label> <br />
                    <input  type="text" name="dtitle" value="<%=dtitle%>"size="40" />
                        <input  type="hidden" name="duses" value="<%=duses%>"size="40" />
                        <input  type="hidden" name="fname"value="<%=fname%>"size="40" />
                        <input  type="hidden" name="doc"value="<%=doc%>"size="40" />
                        <br />
                  </label></td>
                </tr>
                <tr>
                  <td><span class="style34"> Document Image</span></td>
                  <td><p>
                      <input type="file" id="pic" name="pic" class="text" />
                  </p></td>
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
              <p><a href="S_AddDoc.jsp" class="style35 style39">Back</a></p>
            </form>
            <%	
			
							

		}
} 
catch(Exception e)
{
out.print(e.getMessage());
}  
%>

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
              <p><a href="S_AddDoc11.jsp">Home</a></p>
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
