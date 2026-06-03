	<%@ include file="connect.jsp" %>
 	<%
  		
   	try {
		   
			
			String title=request.getParameter("title");
			String categorie=request.getParameter("cat");
			
			String str = "Safe",m_digital="",des="",d_digital="",d_content="",b_digital="",b_content="";
			
			
			
			String query121="select digital_sign,content from documents where dtitle='"+title+"' and dcategory='"+categorie+"'"; 
			Statement st121=connection.createStatement();
			ResultSet rs121=st121.executeQuery(query121);
			if ( rs121.next() )
		    {
			
				d_digital=rs121.getString(1);
				d_content=rs121.getString(2);
			}
			String query1211="select digital_sign from metadata where dtitle='"+title+"' and dcategory='"+categorie+"'"; 
			Statement st1211=connection.createStatement();
			ResultSet rs1211=st1211.executeQuery(query1211);
			if ( rs1211.next() )
		    {
			
				m_digital=rs1211.getString(1);
			}
			
			
			if(d_digital.equals(m_digital))
			{
					
					Statement st4=connection.createStatement();
					String strQuery4 = "update documents set status='"+str+"' where dtitle='"+title+"' and dcategory='"+categorie+"'"; 
					st4.executeUpdate(strQuery4);
					
					%><br/><p> Recovered Succeessfully..</p><br/><br/><a href="S_AttackedDocs.jsp">Back</a><%
			}
			else
			{
					String query12="select digital_sign,content from backup where dtitle='"+title+"' and dcategory='"+categorie+"'"; 
					Statement st12=connection.createStatement();
					ResultSet rs12=st12.executeQuery(query12);
					if ( rs12.next() )
					{
					
						b_digital=rs12.getString(1);
						b_content=rs12.getString(2);
					}
					
					Statement st1=connection.createStatement();
					String strQuery1 = "update documents set status='"+str+"',content='"+b_content+"',digital_sign='"+b_digital+"'  where dtitle='"+title+"' and dcategory='"+categorie+"'"; 
					st1.executeUpdate(strQuery1);
			
			
			connection.close();
			%><br/><p> Recovered Succeessfully..</p><br/><br/><a href="S_AttackedDocs.jsp">Back</a><%
		
			}
	   		
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		
	%>
