<%@page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
    <html><head><title>JDBC test</title></head><body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/insight4excel", "root", "2929");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("select * from candidatedetails");
      %><table border= "1"><%
      ResultSetMetaData resMetaData = rs.getMetaData();
      int nCols = resMetaData.getColumnCount();
      %><tr><%
      for (int kCol = 1; kCol <= nCols; kCol++) {
        out.print("<td><b>" + resMetaData.getColumnName(kCol) + "</b></td>");
        }

      while (rs.next()) {
        %><tr><%
        for (int kCol = 1; kCol <= nCols; kCol++) {
          out.print("<td>" + rs.getString(kCol) + "</td>");
          }
        %></tr><%
        }
      %></table><%
      conn.close();
      %>
    </body></html>