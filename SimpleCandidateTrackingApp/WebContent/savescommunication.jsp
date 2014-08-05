<html>
<head>
<title>Saves the communication with client</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;

    String endclientname = request.getParameter("txtendclientname");
	String clientname = request.getParameter("txtsubmittedby");
	String candidate = request.getParameter("txtcandidate");
	String dat = request.getParameter("statusdate");
	java.text.SimpleDateFormat sdf = 
		     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String entrydate = sdf.format(dat);
	String commdetails= request.getParameter("txtattachment");
	String status = request.getParameter("status");
	
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn =

		DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/insight4excel", "root",
				"2929");
		PreparedStatement st;
		st = conn
				.prepareStatement("INSERT INTO insight4excel.commdetails(submittedby,candidateid,interactiontime,description,endclient,currentstatus)VALUES(?,?,?,?,?,?)");
		st.setString(1, clientname);
		st.setString(2, candidate);
		st.setString(3, entrydate);
		st.setString(4, commdetails);
		st.setString(5, endclientname);
		st.setString(6, status);
	
		st.executeUpdate();
		st.clearParameters();
	    conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}

	response.sendRedirect("index.jsp");
%>



</body>
</html>