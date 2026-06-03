<html>
<body>

<%@ include file="connect.jsp" %>

<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>
              <%
/*String dtopic="";//=request.getParameter("t1");
String ddesc="";//=request.getParameter("t2");
String ddate="";//=request.getParameter("t3");
String pic="";//request.getParameter("docimg");
String fname="";//=request.getParameter("docfile");
String doc="";//=request.getParameter("textarea");*/
					
				    ArrayList list = new ArrayList();
					
					ServletContext context = getServletContext();
					
					String dirName =context.getRealPath("Gallery/");
					
					String paramname=null,uses=null,ddesc=null,title=null,pic=null,fname=null,cat=null,doc=null,pincode=null,content=null,image=null,bin = "";
				
					FileInputStream fs=null;
					
					File file1 = null;	
					
					try {
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024);	
						
						Enumeration params = multi.getParameterNames();
						
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
							
							if(paramname.equalsIgnoreCase("cat"))
							{
								cat=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("title"))
							{
								title=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("textarea"))
							{
								uses=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("fname"))
							{

								fname=multi.getParameter(paramname);
															
							}
							if(paramname.equalsIgnoreCase("textarea1"))
							{
								content=multi.getParameter(paramname);
							}
							
							
						}
							int f = 0;
							Enumeration files = multi.getFileNames();	
							while (files.hasMoreElements()) 
							{
								paramname = (String) files.nextElement();
								
								
								if(paramname != null)
								{
									f = 1;
									image = multi.getFilesystemName(paramname);
									String fPath = context.getRealPath("Gallery\\"+image);
									file1 = new File(fPath);
									fs = new FileInputStream(file1);
									list.add(fs);
								
									String ss=fPath;
									FileInputStream fis = new FileInputStream(ss);
									StringBuffer sb1=new StringBuffer();
									int i = 0;
									while ((i = fis.read()) != -1) 
									{
										if (i != -1)
										 {
											//System.out.println(i);
											String hex = Integer.toHexString(i);
											// session.put("hex",hex);
											sb1.append(hex);
											
										
											String binFragment = "";
											int iHex;
				 
											for(int i1= 0; i1 < hex.length(); i1++)
											{
												iHex = Integer.parseInt(""+hex.charAt(i1),16);
												binFragment = Integer.toBinaryString(iHex);
				
												while(binFragment.length() < 4)
												{
													binFragment = "0" + binFragment;
												}
												bin += binFragment;
								
											}
										}	
										
									}
									
								}		
							}
					
						
		
						FileInputStream fs1 = null;
int i2=0;
		
		String query1="select * from documents  where dtitle='"+title+"' and dcategory='"+cat+"' "; 
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query1);
			if ( rs1.next()==true)
			   {
					
				%>
              	 <br/><p class="style18 style32">Title Already Exist in This Category, Please change title or category name!!</p>
				 <br/><p><a href="S_AddDoc.jsp">Back</a></p>
				 <%
				}
				else
				{
				
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						
						//Digital Sign Generation
						
						String namefile="filename.txt";
						PrintStream p=new PrintStream(new FileOutputStream(namefile+"/"));
						p.print(new String(content));
						
						
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
						
						
						String keys = "ef50a0ef2c3e3a5f";
						byte[] keyValue = keys.getBytes();
						Key key = new SecretKeySpec(keyValue,"AES");
						Cipher c = Cipher.getInstance("AES");
						c.init(Cipher.ENCRYPT_MODE,key);
						String keyy = String.valueOf(keyValue);
						
						String encryptedContent = new String(Base64.encode(content.getBytes()));
								
						
						
						
						
						
						
						
						
				 String status = "Original";
				 int c1=0;
PreparedStatement ps=connection.prepareStatement("insert into documents(dcategory,dtitle,fname,duses,content,ddate,status,image,count,digital_sign) values(?,?,?,?,?,?,?,?,?,?)");
						ps.setString(1,cat);
						ps.setString(2,title);
						ps.setString(3,fname);	
						ps.setString(4,uses);
						ps.setString(5,encryptedContent);
						ps.setString(6,dt);
						ps.setString(7,status);
						ps.setBinaryStream(8, (InputStream)fs, (int)(file1.length()));	
						ps.setInt(9,c1);
						ps.setString(10,h1);
						
						
						int x=ps.executeUpdate();
						
						
						PreparedStatement ps1=connection.prepareStatement("insert into backup(dcategory,dtitle,fname,ddate,digital_sign,content) values(?,?,?,?,?,?)");
						ps1.setString(1,cat);
						ps1.setString(2,title);
						ps1.setString(3,fname);	
						ps1.setString(4,dt);
						ps1.setString(5,h1);
						ps1.setString(6,encryptedContent);
						
						
						int x1=ps1.executeUpdate();
						
						
						
						
						
						PreparedStatement ps3=connection.prepareStatement("insert into metadata(dcategory,dtitle,fname,ddate,digital_sign) values(?,?,?,?,?)");
						ps3.setString(1,cat);
						ps3.setString(2,title);
						ps3.setString(3,fname);	
						ps3.setString(4,dt);
						ps3.setString(5,h1);
					
						
						
						int x3=ps3.executeUpdate();
						
						
						
						
						
						if(x>0 && x1>0 && (x3>0))
						{
						
						
						
						/*st.executeUpdate("insert into  document(dtopic,ddesc,fname,ddate,image,doc,count) values ('"+dtopic+"','"+ddesc+"','"+fname+"','"+ddate+"','"+image+"','"+doc+"',"+i+")" );*/
						%><br/><%
						out.print("Document Uploaded Successfully");	
								
						}else{}		%><br/><p><a href="ServerMain.jsp">Back</a></p>


				<%}
} 
catch(Exception e)
{
out.print(e.getMessage());
}  
%>
           
   </body>
</html>
        
           
           
           
           
           
           
           
           
       