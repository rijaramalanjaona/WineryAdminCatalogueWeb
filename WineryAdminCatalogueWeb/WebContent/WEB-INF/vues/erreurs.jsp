<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<%@ page import="com.ingesup.exception.DaoException" %>
<% 
	DaoException monException = (DaoException)exception;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1 { 
  		font-family: serif;
		color: red;
		padding: 0.3em;
		text-align: center;
		letter-spacing: 0.3em;
	}
	#contenu
	{
    	margin:20px auto;
    	font-size: 0.8em;
	    letter-spacing: 1px;
	    width:50%;
	    border: 1px solid white;
	    color: white;
	    background-color:red;
	    padding:10px; 
	}
	
</style>

</head>
<body>
	<h1>Des erreurs ont &eacute;t&eacute; trouv&eacute;es...</h1>
	<div id="contenu">
		<%=monException.getMessage() %> - [code= <%=monException.getCode() %>]
	</div>

</body>
</html>