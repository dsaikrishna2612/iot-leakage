<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Attacked Documents / Recover..</title>
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

            <p class="style46">  Attacked Documents / Recover..</p>
            <p class="infopost">&nbsp;</p>
            <div class="clr"></div>
            <div>
              <p>&nbsp;</p>
              <table width="1017" height="194" border="2" align="center"  cellpadding="0" cellspacing="0"  ">
                <tr>
                  <td  width="42"  valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Si No. </div></td>
                  <td  width="123" valign="middle" height="29" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Attacker Name </div></td>
                  <td  width="126" valign="middle" height="29" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Document Title </div></td>
                  <td  width="112" valign="middle" height="29" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">File Name </div></td>
                  <td  width="114" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Status</div></td>
                  <td  width="134" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Recovered</div></td>
                  <td  width="109" valign="middle" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Date</div></td>
                  <td  width="109" valign="middle" height="29" style="color: #2c83b0;"><div align="center" class="style5 style56 style57">Leakage Attacked URL</div></td>
                </tr>
                <%@ include file="connect.jsp" %>
                <%
					  
						String s1,s2,s3,s4,s5,s6="",s7="",s8="";
						int i=1;
						try 
						{
						   	String query="select * from crossattack"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		while ( rs.next() )
					   		{
								
								s1=rs.getString(2);
								s2=rs.getString(3);
								s3=rs.getString(4);
								s4=rs.getString(5);
								s5=rs.getString(6);
								s8=rs.getString(8);
								
								
								
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
                  <td align="center"  valign="middle"><div align="center" class="style22 style5 style37 style54 style55">
                      <%out.println(i);%>
                  </div></td>
                  <td width="123" rowspan="1" align="center" valign="middle" ><div align="center" class="style22 style5 style20 style37 style54 style55">
                      <a href="S_AttackerDetails.jsp?name=<%=s3%>" class="style62">
                      <%out.println(s3);%>
                      </a></div></td>
                  <td height="49" align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                      <%out.println(s1);%>
                  </div></td>
                  <td height="49" align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                      <%out.println(s4);%>
                  </div></td>
                  <td align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55 style62">
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
                  </div></td>
                  <td align="center"  valign="middle"><p>&nbsp;</p>
                    <div align="center" class="style22 style5 style20 style37 style55 style62">
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
                  <td align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                    <%out.println(s5);%>
                  </div></td>
                  <td height="49" align="center"  valign="middle"><div align="center" class="style22 style5 style20 style37 style54 style55">
                 
           
                      <label>
                        <textarea name="textarea" cols="30" rows="10">   <%out.println(s8);%></textarea>
                      </label>
            
                    </div></td>
                </tr>
                <%
						i+=1;}
						
					
				
						
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
                  <td  valign="baseline">&nbsp;</td>
                  <td  valign="baseline">&nbsp;</td>
                  <td  valign="baseline" height="20">&nbsp;</td>
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
	<div class="content_resize">
      <div class="sidebar">
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
 
</div>
</body>
</html>
