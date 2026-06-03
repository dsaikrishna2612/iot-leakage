
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Server Main Page</title>
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
	font-size: 22px;
	font-weight: bold;
}
a:link {
	color: #FF00FF;
}
.style6 {
	color: #FF6600;
	font-size: 28px;
}
.style16 {color: #FF00FF}
.style12 {color: #009900}
.style17 {color: #FF0000}
.style18 {
	font-size: 24px;
	color: #FF0000;
}
.style19 {color: #FF0000; font-weight: bold; }
.style20 {font-weight: bold}
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
          <h2><span class="style12">Welcome to IOT Cloud Server Main </span></h2>
          <p class="infopost style18">Alerts</p>
          <div class="clr"></div>
          <div class="img">
            <table width="656" height="194" border="2" align="center"  cellpadding="0" cellspacing="0"  ">
                <tr>
                  <td  width="42"  valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style57 style17"><em><strong>Si No. </strong></em></div></td>
                  <td  width="123" height="29" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style57 style17"><em><strong>Attacker Name </strong></em></div></td>
                  <td  width="126" height="29" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style57 style17"><em><strong>Document Title </strong></em></div></td>
                  <td  width="112" height="29" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style57 style17"><em><strong>File Name </strong></em></div></td>
                  <td  width="114" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style57 style17"><em><strong>Status</strong></em></div></td>
                 <td  width="134" valign="middle" bgcolor="#FFFF00" style="color: #2c83b0;"><div align="center" class="style5 style56 style57 style17"><em><strong>Recovered</strong></em></div></td>
                </tr>
                <%@ include file="connect.jsp" %>
                <%
					  
						String s1,s2,s3,s4,s5,s6="",s7="",s8="";
						int i=1;
						try 
						{
						
						
						
						
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate ;
						
						
						
						
						
						   	String query="select * from crossattack  "; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		while ( rs.next() )
					   		{
								
								s1=rs.getString(2);
								s2=rs.getString(3);
								s3=rs.getString(4);
								s4=rs.getString(5);
								s5=rs.getString(6); // Dt
								s8=rs.getString(8);
								
								
								String dt1=s5.substring(0,10);
								
								
								if(dt.equalsIgnoreCase(dt1))

							{								
							String query1="select status,digital_sign from documents where dtitle='"+s1+"' and dcategory='"+s2+"'"; 
						   	Statement st1=connection.createStatement();
						   	ResultSet rs1=st1.executeQuery(query1);
					   		if ( rs1.next() )
					   		{
								
								s6=rs1.getString(1);
								s7=rs1.getString(2);
							}
							
								String sign="";
								String query11="select digital_sign from metadata where dtitle='"+s1+"' and dcategory='"+s2+"'";  
								Statement st11=connection.createStatement();
								ResultSet rs11=st11.executeQuery(query11);
								if ( rs11.next() )
					   			{
								
									sign=rs11.getString(1);
								}
								
							
							
							
					%>
                <tr>
                  <td align="center"  valign="middle"><div align="center" class="style17 style55 style54 style37 style5 style22"><strong>
                      <%out.println(i);%>
                  </strong></div></td>
                  <td width="123" rowspan="1" align="center" valign="middle" ><div align="center" class="style17 style55 style54 style37 style20 style5 style22"><strong>
                      <a href="S_AttackerDetails.jsp?name=<%=s3%>" class="style62">
                      <%out.println(s3);%>
                      </a></strong></div></td>
                  <td height="49" align="center"  valign="middle"><div align="center" class="style17 style55 style54 style37 style20 style5 style22"><strong>
                      <%out.println(s1);%>
                  </strong></div></td>
                  <td height="49" align="center"  valign="middle"><div align="center" class="style17 style55 style54 style37 style20 style5 style22"><strong>
                      <%out.println(s4);%>
                  </strong></div></td>
                  <td align="center"  valign="middle"><div align="center" class="style17 style62 style55 style54 style37 style20 style5 style22"><strong>
                    <%
				  if(s6.equalsIgnoreCase("Safe") && s7.equals(sign))
				  {
				 		   out.println(s6);
				   }
				   
				   else
				   {
				   
				   out.println("Not Safe");
				   
				   }
				   %>
                  </strong></div></td>
                  <td align="center"  valign="middle"><p class="style19">&nbsp;</p>
                    <div align="center" class="style22 style5 style37 style55 style62 style17 style20">
                      <p>
                        <%
				  if(s6.equalsIgnoreCase("Safe")&& s7.equals(sign))
				  {
				 		   out.println("Yes");
				   }
				   
				   else
				   {
				   
				   out.println("No");
				   %>
                      </p>
                      <p><a href="recovered.jsp?title=<%=s1%>&amp;cat=<%=s2%>" class="style56">Recover</a></p>
                      <%
				   
				   }
				   %>
                  </div></td>
                </tr>
                <%
						i+=1;
						
						}
						}
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
                <tr>
                  <td  valign="baseline">&nbsp;</td>
                  <td  valign="baseline" height="20">&nbsp;</td>
                  <td  valign="baseline" height="20">&nbsp;</td>
                  <td  valign="baseline" height="20">&nbsp;</td>
                  <td  valign="baseline">&nbsp;</td>
                </tr>
            </table>
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
          <div class="clr"></div>
          <ul class="sb_menu">
            <li>
             <a href="ServerMain.jsp">Home</a>            </li>
            <li><a href="S_AddDoc.jsp" class="style16">Add Documents </a> </li>
            <li><a href="S_AllUsersandAuthorize.jsp">All Users </a> </li>
            <li><a href="S_AllDocsWithImages.jsp">All Documents</a></li>
            <li><a href="S_SearchHistory.jsp">Search History</a> </li>
            <li><a href="S_AttackedDocs.jsp">Attacked Docs / Recover </a> </li>
            <li><a href="S_DocsMetadata.jsp">Documents Metadata </a></li>
            <li><a href="S_DocsReviews.jsp">Documents Reviews </a> </li>
            <li><a href="S_DocsChart.jsp">Documents Results</a> </li>
            <li><a href="index.html">Log Out </a></li>
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
