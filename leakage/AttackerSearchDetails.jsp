<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="connect.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="javax.crypto.Cipher" %>
<%@ page import ="org.bouncycastle.util.encoders.Base64" %>
<%@ page import ="javax.crypto.spec.SecretKeySpec" %>
<%@ page import ="java.security.KeyPairGenerator,java.security.KeyPair,java.security.Key" %>
<%@ page import="java.security.*,java.security.DigestInputStream,java.math.BigInteger"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.style71 {font-size: 12px}
-->
</style>
<head>
<title>Documents Details..</title>
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
.style22 {font-size: 16px; color: #FFFFFF; }
.style39 {color: #9900FF;
	font-weight: bold;
	font-size: 14px;
}
.style5 {color: #66CCFF;
	font-size: 21px;
	font-weight: bold;
}
.style55 {font-size: 14px}
.style56 {color: #FF0000}
.style12 {	color: #0000FF;
	font-size: 25px;
}
.style40 {color: #FF00FF}
.style41 {font-size: 16px}
.style45 {color: #66CCFF}
.style47 {font-size: 21px; color: #66CCFF;}
.style63 {color: #0000FF; font-weight: bold; font-size: 15px; }
.style64 {color: #0000FF}
.style67 {
	font-size: 15px;
	color: #0000FF;
}
.style68 {
	font-size: 15px;
	font-weight: bold;
}
.style70 {color: #FF3300}
.style72 {
	color: #FF0000;
	font-size: 16px;
	font-weight: bold;
}
.style73 {
	color: #0000FF;
	font-weight: bold;
}
.style74 {color: #009900}
-->
</style>
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("inputTextToSave").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = document.getElementById("inputFileNameToSaveAs").value;

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}

function loadFileAsText()
{
	var fileToLoad = document.getElementById("fileToLoad").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("inputTextToSave").value = textFromFileLoaded;
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
          <li><a href="index.html">Home Page</a></li>
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
          <h2><span class="style12"><span class="style40"><span class="style74">Document</span> <span class="style73"><%=request.getParameter("title")%></span> <span class="style74">Details</span></span><span class="style74">..</span></span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
         
          <div>
             <%String title=request.getParameter("title");
			 String keyword=request.getParameter("keyword");
			   int id = Integer.parseInt(request.getParameter("id"));%>
             <%
  
 

  


	String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
	int i=0,j=0;

try 
{
           
      		
           String query="select * from documents where id="+id+" "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
		   while ( rs.next() )
		   {
				j=rs.getInt(1);
				s2=rs.getString(2);
				s3=rs.getString(3);
				s4=rs.getString(4);
				s5=rs.getString(5);
				s6=rs.getString(6);
				s7=rs.getString(7);
				s8=rs.getString(11);

				String keys = "ef50a0ef2c3e3a5f";
			    byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue,"AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE,key);
				String keyy = String.valueOf(keyValue);
				
      	        String decryptedDesc = new String(Base64.decode(s6.getBytes()));
				
			
		
%>
                <table width="624" border="2" cellspacing="2" cellpadding="2">
                  <tr>
                    <td width="235" height="37" valign="middle"><span class="style2 style41  style47"><span class="style47 style2 style64"><span class="style68">Doc Image </span></span></span></td>
                    <td><span class="style22 style29 style42 style45" style="margin:10px 13px 10px 13px;; font-size: 14px;">
                      <input  name="image" type="image" src="images.jsp?id=<%=j%>" style="width:120px; height:120px;" />
                    </span></td>
                  </tr>
                  <tr>
                    <td width="235" height="37"><span class="style63">Category</span></td>
                    <td width="367"><span class="style70 style55"><strong>
                      <%out.println(s2);%>
                    </strong></span></td>
                  </tr>
                  <tr>
                    <td height="31"><p class="style2 style47 style64 style67">Title</p></td>
                    <td><span class="style70 style55"><strong>
                      <%out.println(s3);%>
                    </strong></span></td>
                  </tr>
                  <tr>
                    <td height="34"><span class="style63">File Name </span></td>
                    <td><span class="style70 style55"><strong>
				     <input name="hidden" type="hidden" id="inputFileNameToSaveAs" value="<%=s4%>" />
                      </input>
                      <%out.println(s4);%>
                    </strong></span></td>
                  </tr>
                  <tr>
                    <td height="34"><span class="style63">Date</span></td>
                    <td><span class="style70 style55"><strong>
                      <%out.println(s7);%>
                    </strong></span></td>
                  </tr>
                  <tr>
                    <td><div align="left" class="style5 style56 style2">
                      <div align="center"><span class="style63">Uses</span></div>
                    </div></td>
                    <td><div align="left" class="style5 style56 style2">
                      <div align="center"><span class="style63">Contents</span></div>
                    </div></td>
                  </tr>
                  <tr>
                    <td height="342" valign="top">
                      <label> <br />
					  
                      <textarea name="textarea2" cols="36" rows="10"><%=s5%></textarea>
                      </label>                    </td>
                    <td><p align="left">
			  <form id="form1" name="form1" method="post" action="attackerupdate.jsp">
                      <textarea name="textarea" cols="80" rows="10" id="inputTextToSave" style="width:360px;height:256px" ><%=decryptedDesc%></textarea>
                      </p>
                      <div align="center">
                        <div align="center">
                          <p align="center">
						
							<input type="hidden" value="<%=s3%>" name="title"/>					
							<input type="hidden" value="<%=s2%>" name="cat"/>
							<input type="hidden" value="<%=s4%>" name="fname"/>
							<input type="hidden" value="<%=keyword%>" name="keyword"/>
                            <input type="submit" name="Submit" value="Attack" />
                     </form>
                          </p>
                      
                          <div align="center">
                            <button onclick="saveTextAsFile()">Download</button>
                          </div>
                     
          
                      
                    </td>
                  </tr>
            </table>
                <%

	   }

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
                <p align="right">&nbsp;</p>
                <p align="right"><a href="attacker.jsp" class="style39 style71 style71">Back</a></p>
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
              <p><a href="#">Home</a></p>
              <p><a href="index.html">Log Out</a></p>
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
