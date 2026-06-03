<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cross Site Script Attackers..</title>
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
.style22 {font-size: 16px; color: #FFFFFF; }
.style39 {color: #9900FF;
	font-weight: bold;
	font-size: 14px;
}
.style46 {
	color: #0000FF;
	font-size: 30px;
}
.style5 {color: #66CCFF;
	font-size: 21px;
	font-weight: bold;
}
.style54 {color: #009900}
.style55 {font-size: 14px}
.style56 {color: #FF0000}
.style57 {font-size: 15px}
.style62 {color: #FF00FF}
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
      <div class="sidebar">
        <div class="searchform">

            <p class="style46">Cross Site Script Attackers..</p>
            <p class="infopost">&nbsp;</p>
            <div class="clr"></div>
            <div>
              <p>&nbsp;</p>
              <table width="1020" height="194" border="2" align="center"  cellpadding="0" cellspacing="0"  ">
                <tr>
                  <td  width="54"  valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Si No. </div></td>
                  <td  width="138"  valign="middle" height="29" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Attacker Image </div></td>
                  <td  width="160" valign="middle" height="29" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Attacker Name </div></td>
                  <td  width="179" valign="middle" height="29" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">E-mail </div></td>
                  <td  width="170" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Mobile</div></td>
                  <td  width="170" valign="middle" height="29" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Address</div></td>
                  <td  width="131" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Date</div></td>
                </tr>
       		    <%@ include file="connect.jsp" %>
                <%
					  
						String ss1,ss2,ss3,ss4,ss5,ss6="",ss7="",ss8="";
						String s1,s2,s3,s4,s5,s6="",s7="",s8="";	
						int j=1,i=0;
						try 
						{
						   	String querys="select * from crossattack"; 
						   	Statement sst=connection.createStatement();
						   	ResultSet rss=sst.executeQuery(querys);
					   		while ( rss.next() )
					   		{
								
								//ss1=rss.getString(2);
								//ss2=rss.getString(3);
								ss3=rss.getString(4);
								//ss4=rss.getString(5);
								ss5=rss.getString(6);
								//ss8=rss.getString(8);
								
								
								String query="select * from user where username='"+ss3+"'"; 
								Statement st=connection.createStatement();
								ResultSet rs=st.executeQuery(query);
								if ( rs.next() )
								{
											i=rs.getInt(1);
											s1=rs.getString(4);
											s2=rs.getString(5);
											s3=rs.getString(6);

							/*String querys1="select status,digital_sign from documents where dtitle='"+ss1+"' and dcategory='"+ss2+"'"; 
						   	Statement sts1=connection.createStatement();
						   	ResultSet rss1=sts1.executeQuery(querys1);
					   		if ( rss1.next() )
					   		{
								
								ss6=rss1.getString(1);
								ss7=rss1.getString(2);
							}
							
								String signs="";
								String querys11="select digital_sign from metadata where dtitle='"+ss1+"' and dcategory='"+ss2+"'";  
								Statement sts11=connection.createStatement();
								ResultSet rss11=sts11.executeQuery(querys11);
								if ( rss11.next() )
					   			{
								
									signs=rss11.getString(1);
								}
								*/
							
							
							
					%>
                <tr>
                  <td align="center"  valign="middle"><div align="center" class="style22 style5 style37 style54 style55">
                      <%out.println(j);%>
                  </div></td>
                  <td height="49" align="center"  valign="middle"><div class="style22 style4 style5" style="margin:10px 13px 10px 13px;" >
                      <div align="center"><a class="#" id="img1" href="#" >
                        <input  name="image" type="image" src="user_Pic.jsp?id=<%=i%>" style="width:120px; height:120px;" />
                      </a> </div>
                  </div></td>
                  <td width="160" rowspan="1" align="center" valign="middle" ><div align="center" class="style22 style5 style20 style37 style54 style55">
                      <%out.println(ss3);%>
                  </div></td>
                  <td height="49" align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                      <%out.println(s1);%>
                  </div></td>
                  <td align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                    <%out.println(s2);%>
                  </div></td>
                  <td height="49" align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                      <%out.println(s3);%>
                  </div></td>
                  <td align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                    <%out.println(ss5);%>
                  </div></td>
                </tr>
                <%
					}	j+=1;
						
					
				}
						connection.close();
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
                  <td  valign="baseline" height="20">&nbsp;</td>
                  <td  valign="baseline">&nbsp;</td>
                </tr>
              </table>
              <p>&nbsp;</p>
              <p align="right"><a href="index.html" class="style10"></a><a href="ServerMain.jsp" class="style39">Back</a></p>
              <div class="clr"></div>
            </div>
            <div class="clr"></div>
          </form>
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
