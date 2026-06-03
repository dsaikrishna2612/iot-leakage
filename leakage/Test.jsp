
<%
    try 
	{
      		String file=request.getParameter("data");
			String fname=request.getParameter("fname");    		
      		String str=request.getRequestURL()+"";
            out.println("Data="+file+"<br><br>"); 
			 out.println("File Name="+fname+"<br><br>"); 
			out.println("URL="+str);
          }
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
  %>
	
