<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="javax.sql.DataSource" %>
<html>
<head>
    <title>Lists all the Candidates</title>
    <style type="text/css">
    H1 {font-size:20pt;}
    table {background-color:white;}
.button {
  display: block;
  width: 80px;
  height: 28px;
  background: #4E9CAF;
  padding: 9px;
  text-align: center;
  border-radius: 41px;
  color: white;
  font-size: 13;
}

.m01 {
  display:none; }
    </style>
</head>
<body>

<div id="header" style="background-color:#FFA500;">
<h1 style="margin-bottom:0;">List the submissions</h1></div>
<hr/>
<div id="menu" style="background-color:#FFD700;height:200px;width:100px;float:left;">
<a href="updatenewdocument.jsp" class="button">New Documents</a>
<a href="updatedoc.jsp" class="button">Update Documents</a>
<a href="personaldetails.jsp" class="button">Personal Details</a>
<a href="viewsubmission.jsp" class="button">View Submission</a>
<a href="newcandidate.jsp" class="button">New Candidate</a></div>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/insight4excel"
     user="root"  password="2929" />

<sql:query var="candidates" dataSource="${snapshot}">
	 select  c.candidateid , c.name , sub.client , 
	sub.idsubmission,date(sub.commdatestamp) as subdate from candidatedetails c
	inner join submission sub on c.candidateid = sub.candidateid
	where c.issoftdeleted= false and sub.issoftdeleted = false
	
</sql:query>

<table border="1">
    <tr>        
        <th>Candidate Name</th>
        <th style="display:none">Candidate id</th>
        <th>Buyer Name</th>
        <th style="display:none">Submission id</th>
        <th>Submitted On</th>
   </tr>
    <c:forEach var="row" items="${candidates.rows}">
        <tr> 	
            <td><c:out value="${row.name}"/></td>
            <td style="display:none"><c:out value="${row.candidateid}"/></td> 
            <td><c:out value="${row.client}"/></td>
            <td style="display:none"><c:out value="${row.idsubmission}"/></td>
            <td><c:out value="${row.subdate}"/></td>
            <td><a href="edit.jsp"><img src="images/Edit.png" alt="Edit Candiate" width="16" height="16"></a>
				<a href="delete.jsp"><img src="images/Delete_32x32.png" alt="Delete Candidate" width="16" height="16"></a></td>        	     	
        </tr>
    </c:forEach>
</table>

<hr/>
<i>Candidates- tracking</i>
</body>
</html>

					  