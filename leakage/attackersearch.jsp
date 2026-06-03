<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Found Documents..</title>
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
.style10 {color: #FF00FF;
	font-weight: bold;
}
.style52 {	font-size: 25px;
	color: #009900;
}
.style22 {font-size: 16px; color: #FFFFFF; }
.style42 {font-size: 14px}
.style45 {color: #66CCFF}
.style5 {color: #66CCFF;
	font-size: 21px;
	font-weight: bold;
}
.style50 {font-size: 14px; color: #CC0000; }
.style57 {font-size: 16px}
.style58 {color: #FF0000}
.style63 {color: #FF00FF; font-size: 14px; font-weight: bold; }
.style66 {font-size: 14px; font-weight: bold; }
.style67 {color: #009900; font-size: 14px; font-weight: bold; }
.style69 {
	color: #993300;
	font-weight: bold;
	font-size: 14px;
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
          <h2><span class="style52">Searched Documents By Contents..</span></h2>
          <p class="infopost">&nbsp;</p>
          <div>
          
            <p class="style50">
            <p class="style50">
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
              <%
try 
{
  
 	SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

	Date now = new Date();

	String strDate = sdfDate.format(now);
	String strTime = sdfTime.format(now);
	String dt = strDate + "   " + strTime;
				
		String dt1 = request.getParameter("t3");
		if(dt1.equals(""))
		{
				%>
              <br/>
              <span class="style69">
              <%out.print("Please Input the Keyword to Search and Attack..");%>
              </span>              </span>
            <p align="left" class="style50">
              <%
		}
		else
		{
				
				String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
				int i=1,j=0;
%>
            <p>&nbsp;</p>
            <table width="631" border="1" align="center"  cellpadding="0" cellspacing="0"  ">
              <tr>
                <td  width="63"  valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style57 style58">Si No. </div></td>
                <td  width="173" valign="middle" height="34" style="color: #2c83b0;"><div align="center" class="style5 style57 style58"><strong>Title</strong></div></td>
                <td  width="198" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style57 style58">File Name  </div></td>
                <td  width="187" valign="middle" height="34" style="color: #2c83b0;">&nbsp;</td>
              </tr>
              <tr>
                <%
				
		
					  /* String uname=(String)application.getAttribute("uname");
					   Statement st3 = connection.createStatement();
					   String search_on="Content";
					   String query3 ="insert into attack (uname,keyword,date)values('"+uname+"','"+dt1+"','"+dt+"')";
					   st3.executeUpdate (query3); */
      		
					   
						String str = "select * from documents order by count";
						Statement st=connection.createStatement();
						ResultSet rs = st.executeQuery(str);
						
						while(rs.next())
						{
								
								j=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(3);
								String d_Cont = rs.getString(6);  
								s4=rs.getString(8);
								s5=rs.getString(4);
								
								
						
								String keys = "ef50a0ef2c3e3a5f";
								byte[] keyValue = keys.getBytes();
								Key key = new SecretKeySpec(keyValue,"AES");
								Cipher c = Cipher.getInstance("AES");
								c.init(Cipher.ENCRYPT_MODE,key);
								String keyy = String.valueOf(keyValue);
				
      	      					String Cont = new String(Base64.decode(d_Cont.getBytes()));
								
								String d_Cont1 = Cont.toLowerCase(); 
						
								if (d_Cont1.indexOf(dt1)>=0)
      							{
      								/*String query4 ="insert into search_found(uname,keyword,date,title)values('"+uname+"','"+dt1+"','"+dt+"','"+s2+"')";
									Statement st4=connection.createStatement();
					  				st4.executeUpdate(query4);*/
						%>
                <td height="0" align="center"  valign="middle"><div align="center" class="style63"> 
                      <%out.println(i);%>
                    </div></td>
                <td width="173" align="center" valign="middle" ><div class="style66" style="margin:10px 13px 10px 13px;; color: #FF00FF;" >
                    <%out.println(s2);%>
                </div></td>
                <td align="center"  valign="middle"><div align="center" class="style63">
                  <%out.println(s5);%>
                </div></td>
                <td height="0" align="center"  valign="middle"><p class="style22 style5 style20 style29 style42 style45">
                    <form method="post" action="AttackerSearchDetails.jsp">
                      <div align="center"><p><input type="hidden" value="<%=j%>" name="id"/>
                        <input type="hidden" value="<%=s2%>" name="title"/>
						<input type="hidden" value="<%=dt1%>" name="keyword"/>
                        <input type="submit" name="Submit" value="Document Details" />
                        </label>
                    </p>
                      </div>
                  </form></td>
              </tr>
              <% i+=1;}}%>
              <tr>
                <td  valign="baseline" height="0">&nbsp;</td>
                <td  valign="baseline" height="0">&nbsp;</td>
                <td  valign="baseline">&nbsp;</td>
                <td  valign="baseline" height="0">&nbsp;</td>
              </tr>
              <%}
           connection.close();
		   
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
            </table>
            <p>&nbsp;</p>
            <p align="right"><a href="attacker.jsp" class="style10">Back</a></p>
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
              <p><a href="index.html">Log Out </a></p>
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
