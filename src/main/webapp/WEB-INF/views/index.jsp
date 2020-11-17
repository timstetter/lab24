<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lab 24 | Pizza Party Planner</title>
</head>
<body>
Navigation: <a href="/options">Options and Votes</a>
	<h1>Parties</h1>
	<c:forEach var="party" items="${parties}">
	<ul>
		<li>${ party.getName() } - <fmt:formatDate type ="date" pattern = "MM/dd/yyyy"
         value = "${ party.getDate() }" /></li>
	</ul>
	</c:forEach>
</body>
</html>