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
        
			String title = request.getParameter("title");
			String categorie = request.getParameter("cat");
			
			String des = request.getParameter("textarea");
			String fname = request.getParameter("fname");
			
			String keyword = request.getParameter("keyword");			
			
			String user = (String)application.getAttribute("uname");
			
			/*application.setAttribute("p_Name",p_Name);
		application.setAttribute("categorie",categorie);
		application.setAttribute("p_model_no",p_model_no);	
		application.setAttribute("keyword",keyword);			
*/
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
		
			String digital = new String(Base64.encode(des.getBytes()));
			
			
			String namefile="filename.txt";
				PrintStream p=new PrintStream(new FileOutputStream(namefile+"/"));
				p.print(new String(des));
				
				
				MessageDigest md=MessageDigest.getInstance("SHA1");
				FileInputStream fis11=new FileInputStream(namefile+"/");				
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
			
					String d_check_sign="";
					String d_check_content="";	
						
					String str5 = "select digital_sign,content from documents where dtitle='"+title+"' and dcategory='"+categorie+"'";
					Statement st5=connection.createStatement();
					ResultSet rs5 = st5.executeQuery(str5);
					if(rs5.next())
					{
						
						d_check_sign=rs5.getString(1);
						d_check_content=rs5.getString(2);
					}	
						
					if((d_check_sign.equals(h1)) && (d_check_content.equals(digital)))
					{
					
					
								 out.print("Content Not Modified !!..");
								 %><br/><br/><p><a href="attacker.jsp">Back</a></p><%
					}
					else
					{
					
						 String url=request.getRequestURL()+"";

						int j1=0,total=0;
						String str = "select count from documents where dtitle='"+title+"' and dcategory='"+categorie+"'";
						Statement st=connection.createStatement();
						ResultSet rs = st.executeQuery(str);
						
						if(rs.next())
						{
								
								j1=rs.getInt(1);
			
						}
						total=j1+1;
			
		Statement st1=connection.createStatement();
   		String strQuery1 = "update documents set digital_sign='"+h1+"',content='"+digital+"', status='"+status+"',count='"+total+"' where dtitle='"+title+"' and dcategory='"+categorie+"'" ;
  		int a=st1.executeUpdate(strQuery1);
		
				
						int b=0;
						String str21 = "select * from attacker where title='"+title+"' and category='"+categorie+"'";
						Statement st21=connection.createStatement();
						ResultSet rs21 = st21.executeQuery(str21);
						int c=0;
						if(rs21.next())
						{
							
							int cc=0;
							cc=rs21.getInt(10);
							int cc1=cc+1;
						Statement st121=connection.createStatement();
						String strQuery121 = "update attacker set digital_sign='"+h1+"', dt='"+dt+"',keyword='"+keyword+"',url='"+url+"',count='"+cc1+"' where( title='"+title+"' and category='"+categorie+"')" ;
						 c=st121.executeUpdate(strQuery121);
											
						}
				
						else
						{
				
				   			int z=1;
						String str2 = "insert into attacker (title,category,user,fname,dt,digital_sign,keyword,url,count) values('"+title+"','"+categorie+"','"+user+"','"+fname+"','"+dt+"','"+h1+"','"+keyword+"','"+url+"','"+z+"')";
						 b=connection.createStatement().executeUpdate(str2);
					}
		if(((a>0)&&(b>0))||((a>0)&&(c>0)))
		{
     out.print("Content Attacked Successfully..");
	 %><br/><br/><p><a href="attacker.jsp">Back</a></p><%
  		}
		else{}
		}
 
  }
  catch (Exception e){
    e.printStackTrace();
  }
%>

</body>
</html>