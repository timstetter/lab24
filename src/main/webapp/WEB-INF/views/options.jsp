<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lab 24 | Options</title>
</head>
<body>
Navigation: <a href="/">Parties</a>
	<h1>Pizza Options</h1>
	
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Description</th>
				<th>Votes</th>
				<th></th>				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="partyOption" items="${ partyOptions }">				
				<tr>
					<td>${ partyOption.getName() }</td>
					<td>${ partyOption.getDescription() }</td>
					<td>${ partyOption.getVotes() }</td>					
					<td><a href="/vote/${ partyOption.getId() }">Vote!</a></td>
				</tr>					
			</c:forEach>
		</tbody>
	</table>
</body>
</html>