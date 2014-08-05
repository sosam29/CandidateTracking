<html>
<head>
<title>Saves the submission to client</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;

        String name = request.getParameter("txtname");
        String email = request.getParameter("email");
        String address = request.getParameter("txtclientaddress");
        /*String address2 = request.getParameter("txtaddress2");
         String city = request.getParameter("txtcity");
        String state = request.getParameter("txtstate");
        String zip = request.getParameter("txtzip");
        String state = request.getParameter("txtstate"); */
        String phone = request.getParameter("txtclientphone");
        String contactname= request.getParameter("txtclientcontact");
        String candidateid = request.getParameter("txtcandidate");
        //String clientcontact = request.getParameter("clientcontact");
        
        //String queryText ="insert into candidatedetails (\"email_id\",\"name\",\"address\",\"phone\",\"state\", \"city\", \"zip\") values ('"+email+"','"+name+"','"+address+"','"+phone+"','"+state+"','"+city+"','"+zip+"')";  

        try {
              Class.forName("com.mysql.jdbc.Driver").newInstance ();
              conn =

DriverManager.getConnection("jdbc:mysql://localhost:3306/insight4excel","root","2929");
			PreparedStatement st;
			st = conn.prepareStatement("INSERT INTO insight4excel.submission (client,address1,candidateid,phone,email_id,contactname) VALUES(?,?,?,?,?,?)");
			st.setString(1, name);
			st.setString(2, address);
			st.setString(3, candidateid);
			st.setString(4, phone);
			st.setString(5, email);
			st.setString(6, contactname);
			//st.setString(7, contactname);
			//st.setString(7, zip); 
			//st.setString(1, email);
			 st.executeUpdate();
             st.clearParameters(); 
           // Statement stat = con.prepareStatement(queryText);

           // ResultSet rst = stat.execute(sql)

           /*  rst.close();
            stat.close(); */
            conn.close();
        } catch (Exception e) {e.printStackTrace(); }

        response.sendRedirect("index.jsp");
%>



</body>
</html>