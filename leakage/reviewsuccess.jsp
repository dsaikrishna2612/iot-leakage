<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%@ include file="connect.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import ="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%
	int id =  Integer.parseInt(request.getParameter("id"));
	String title=request.getParameter("title");
	String comment=request.getParameter("textarea");	
			   
  	try{            
					
					if(comment.equals(""))
						{
								%>
							  <br/>
							  <span class="style69">
							  <%out.print("Please Enter Review....");%>
							  </span>  
							 <p align="left" class="style72"><a href="U_Review.jsp?id=<%=id%>&amp;title=<%=title%>" class="style56">Back</a></p>
							  <%
						}
						else
						{
    	  			  		String uname=(String)application.getAttribute("uname");
					   
					   
							SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
							SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						
							Date now = new Date();
						
							String strDate = sdfDate.format(now);
							String strTime = sdfTime.format(now);
							String dt = strDate + "   " + strTime;
							
							
							String cat="";	
							String str = "select dcategory from documents where id='"+id+"'";
							Statement st=connection.createStatement();
							ResultSet rs = st.executeQuery(str);
							
							if(rs.next())
							{
									cat=rs.getString(1);
							}
							
					   Statement st3 = connection.createStatement();
					   String query3 ="insert into reviews (uname,title,category,comment,date)values('"+uname+"','"+title+"','"+cat+"','"+comment+"','"+dt+"')";
					   int i=st3.executeUpdate (query3); 
    					
						if(i>0)
						{
								%><br/><%
								out.print("Reviewed Successfully..");
								%>  <p align="left" class="style72"><a href="U_SearchDetails.jsp?id=<%=id%>&amp;title=<%=title%>" class="style56">Back</a></p><%	
		    			}
  				}
	}
  	catch (Exception e){
    	e.printStackTrace();
  	}
%>

</body>
</html>