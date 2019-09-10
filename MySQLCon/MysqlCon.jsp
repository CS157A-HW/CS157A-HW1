<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>JDBC Connection Example</title>
	</head>
	<body>
		<h1>JDBC Connection Example</h1>
		<%
			//String db = request.getParameter("root");
			//System.out.println(db);
			try{
				java.sql.Connection con;
				Class.forName("org.gjt.mm.mysql.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?useSSL=false", "root", "root");
				
				Statement stmt = con.createStatement();
				
				ResultSet rs = stmt.executeQuery("select * from emp");
				
				while(rs.next()) {
					out.println("<h2>" + rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3) + "</h2>");
				}
				con.close();
				
			}catch(SQLException e){
				out.println("SQLException caught: " + e.getMessage());
			}
		%>
	</body>
</html>