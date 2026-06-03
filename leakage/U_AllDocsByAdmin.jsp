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
<head>
<title>All Documents Shared By Admin..</title>
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
.style31 {color: #009900;
	font-size: 28px;
}
.style39 {color: #9900FF;
	font-weight: bold;
	font-size: 14px;
}
.style46 {color: #0000FF}
.style5 {color: #66CCFF;
	font-size: 21px;
	font-weight: bold;
}
.style54 {color: #009900}
.style55 {font-size: 14px}
.style56 {color: #FF0000}
.style57 {font-size: 15px}
.style59 {font-size: 12px}
-->
</style>

</head>
<body>
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
      <div class="sidebar">
        <div class="searchform">
                    <div class="mainbar">
              <div class="article">
                <h2><span class="style31 style46"> Documents Shared By Admin..</span></h2>
                <p class="infopost">&nbsp;</p>
                <div class="clr"></div>
                <div>
                  <p>&nbsp;</p>
                  <table width="875" border="1" align="center"  cellpadding="0" cellspacing="0"  ">
                    <tr>
                      <td  width="44"  valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Si No. </div></td>
                      <td  width="149" valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Document Image</div></td>
                      <td  width="114" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Document Title </div></td>
                      <td  width="119" valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Category </div></td>
                      <td  width="145" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Fila Name </div></td>
                      <td  width="90" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Status</div></td>
                      <td  width="98" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Date</div></td>
                      <td  width="98" valign="middle" height="34" style="color: #2c83b0;">&nbsp;</td>
                    </tr>
                    <%
					  
						String s1,s2,s3,s4,s5,s6,s7;
						int i=1;
						try 
						{
						   	String query="select * from documents"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		while ( rs.next() )
					   		{
								
								int j=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(3);
								s6=rs.getString(6);
								s3=rs.getString(8);
								s5=rs.getString(7);
								s7=rs.getString(4);
								
								
								String keys = "ef50a0ef2c3e3a5f";
								byte[] keyValue = keys.getBytes();
								Key key = new SecretKeySpec(keyValue,"AES");
								Cipher c = Cipher.getInstance("AES");
								c.init(Cipher.ENCRYPT_MODE,key);
								String keyy = String.valueOf(keyValue);
								
								String decryptedDesc = new String(Base64.decode(s6.getBytes()));
								
					%>
                    <tr>
                      <td height="0" align="center"  valign="middle"><div align="center" class="style22 style5 style37 style54 style55">
                          <%out.println(i);%>
                      </div></td>
                      <td width="149" rowspan="1" align="center" valign="middle" ><div class="style22 style5 style37 style54 style55" style="margin:10px 13px 10px 13px;" > <a class="#" id="img1" href="#" >
                          <input  name="image" type="image" src="images.jsp?id=<%=j%>" style="width:100px; height:100px;" />
                      </a> </div></td>
                      <td align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                          <%out.println(s2);%>
                      </div></td>
                      <td height="0" align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                          <%out.println(s1);%>
                      </div></td>
                      <td align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                          <input name="hidden" type="hidden" id="inputFileNameToSaveAs" value="<%=s7%>" />
                          </input>
                          <%out.println(s7);%>
                      </div></td>
                      <td align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                          <%out.println(s3);%>
                      </div></td>
                      <td align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                          <%out.println(s5);%>
                      </div></td>
                      <td><p align="left">
                          <input name="hidden" type="hidden" id="inputTextToSave" value="<%=decryptedDesc%>" />
                          </input>
                        </p>
                          <div align="center">
                            <button onclick="saveTextAsFile()">Download</button>
                          </div></td>
                    </tr>
                    <%
						i+=1;}
						
					
				
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
                  </table>
                  <p>&nbsp;</p>
                  <p align="right"><a href="UserMain.jsp" class="style39 style59">Back</a></p>
                  <div class="clr"></div>
                </div>
                <div class="clr"></div>
              </div>
            </div>
          
        </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
 
</div>
</body>
</html>
