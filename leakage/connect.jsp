<title></title>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
	Connection connection = null;
 	try {
		String dbHost = System.getenv("DB_HOST");
		if (dbHost == null || dbHost.trim().isEmpty()) {
			dbHost = "localhost";
		}
		String dbPort = System.getenv("DB_PORT");
		if (dbPort == null || dbPort.trim().isEmpty()) {
			dbPort = "3306";
		}
		String dbName = System.getenv("DB_NAME");
		if (dbName == null || dbName.trim().isEmpty()) {
			dbName = "leakage_of_authorization";
		}
		String dbUser = System.getenv("DB_USER");
		if (dbUser == null || dbUser.trim().isEmpty()) {
			dbUser = "root";
		}
		String dbPassword = System.getenv("DB_PASSWORD");
		if (dbPassword == null) {
			dbPassword = "root";
		}

		String jdbcUrl = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName
				+ "?useSSL=false&allowPublicKeyRetrieval=true";

	  	Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
      	String sql="";

	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
