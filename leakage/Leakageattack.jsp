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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

  try{      
        
			String file = request.getParameter("data");
			String fname = request.getParameter("filename");
			String url = request.getRequestURL()+"";
	
			String user = (String)application.getAttribute("uname");
			
			//out.print(file+"<br/><br/>");
					//	out.print(fname+"<br/><br/>");
			//out.print(url+"<br/><br/>");
			
		
			int a=0,b=0,c=0,d_id=0,total=0,total_c=0;
			
		String d_content="",d_sign="",d_category="",d_title="";
		
		if(file.equals(""))
		{
		
				 %><br/><br/><%
				 out.print("Enter Data To Insert !!..");
		}
		else if(fname.equals(""))
		{
		
		
				 %><br/><br/><%
				 out.print("Enter Filename to attack and Insert !!..");
		
		}
		else
		{
	
			Statement st=connection.createStatement();
			String strQuery = "select content,digital_sign,dcategory,dtitle,count from documents where fname='"+fname+"'";
			ResultSet rs = st.executeQuery(strQuery);
			if(rs.next())
			{
					d_content=rs.getString(1);
					d_sign=rs.getString(2);
					d_category=rs.getString(3);
					d_title=rs.getString(4);
					d_id=rs.getInt(5);
					
					
					
					 total=d_id+1;
					//out.print(total+"<br/><br/>");
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						
						String keyWord = "5765586965748666502846";
						keyWord = keyWord.substring(0, 16);
						byte[] keyValue = keyWord.getBytes();
						Key key = new SecretKeySpec(keyValue, "AES");
						Cipher c2 = Cipher.getInstance("AES");
						c2.init(Cipher.ENCRYPT_MODE, key);
					
						String decoded_content = new String(Base64.decode(d_content.getBytes()));
											//out.print(decoded_content+"<br/><br/>");

						String s=new String(decoded_content);
						String appended=s+file;
																	//out.print("appended= "+ appended+"<br/><br/>");

						
						String encoded_content = new String(Base64.encode(appended.getBytes()));
																							//out.print("total encode= "+ encoded_content+"<br/><br/>");

				
							String namefile="filename.txt";
							PrintStream p=new PrintStream(new FileOutputStream("C:\\Tomcat 6.0\\"+namefile+"/"));
							p.print(new String(appended));
							
							
							MessageDigest md=MessageDigest.getInstance("SHA1");
							FileInputStream fis11=new FileInputStream("C:\\Tomcat 6.0\\"+namefile+"/");				
							DigestInputStream dis1=new DigestInputStream(fis11,md);
							BufferedInputStream bis1=new BufferedInputStream(dis1);				
							while(true)
							{
							
								int b1=bis1.read();
								if(b1==-1)
								
									break;
							}
								
							
							BigInteger bi1=new BigInteger(md.digest());
							String spl1=bi1.toString();
							String h1=bi1.toString(16);
							String status="Not Safe";
							//out.print(h1+"<br");
						
					Statement st1=connection.createStatement();
   					String strQuery1 = "update documents set digital_sign='"+h1+"',content='"+encoded_content+"', status='"+status+"',count='"+total+"' where dtitle='"+d_title+"' and dcategory='"+d_category+"'" ;
  					 a=st1.executeUpdate(strQuery1);
		
		
						int cross_count=0,c1=1;
		
		
							String str2 = "select count from crossattack where( title='"+d_title+"' and category='"+d_category+"')" ;
							Statement st2=connection.createStatement();
							ResultSet rs2 = st2.executeQuery(str2);
							if(rs2.next())
							{
									 cross_count=rs2.getInt(1);
									 total_c=cross_count+1;
								
									Statement st3=connection.createStatement();
									String strQuery3 = "update crossattack set digital_sign='"+h1+"', dt='"+dt+"',url='"+url+"',count='"+total_c+"' where( title='"+d_title+"' and category='"+d_category+"')" ;
									 c=st3.executeUpdate(strQuery3);
														
							}
					
							else
							{
					
					   
									String str4 = "insert into crossattack (title,category,user,fname,dt,digital_sign,url,count) values('"+d_title+"','"+d_category+"','"+user+"','"+fname+"','"+dt+"','"+h1+"','"+url+"','"+c1+"')";
									 b=connection.createStatement().executeUpdate(str4);
						   }
						   
						   
						   
						   
							 if(((a>0)&&(b>0))||((a>0)&&(c>0)))
							{
								 %><br/><br/><%					
								 out.print("Content Attacked by Leakage Attack  Successfully..");
	
							}
							else
							{
									 %><br/><br/><%					
								 out.print("Content Edit Not Successful..");
							}
						
					}
					else
					{
							 %><br/><br/><%
							 out.print("File Does Not Exist !!..");
					}
				
	}
	
}
  catch (Exception e){
    e.printStackTrace();
  }
%>

</body>
</html>