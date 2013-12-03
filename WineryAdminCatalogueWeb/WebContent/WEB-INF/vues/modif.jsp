<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modification d'un produit</title>
<style type="text/css">
	h1 { 
  		font-family: serif;
		color: #996600;
		padding: 0.3em;
		text-align: center;
		letter-spacing: 0.3em;
	}
	#frm
	{
    	margin:20px auto;
    	font-size: 0.8em;
	    letter-spacing: 1px;
	}
	
</style>
</head>
<body>

	<h1>Modification d'un produit</h1>
	<form action="<c:url value="/?action=valideModif" />" method="post">
		<input type="hidden" name="id" value="<c:out value="${produit.id}" />" />
		<table id="frm">
			<tr>
				<td>Appellation :</td>
				<td><input type="text" name="appellation" value="<c:out value="${produit.appellation}" />" /></td>
			</tr>
				<tr>
					<td>Cuvée :</td>
					<td><input type="text" name="cuvee" value="<c:out value="${produit.cuvee}" />" /></td>
				</tr>
				<tr>
					<td>Millésime :</td>
					<td><input type="text" name="millesime" value="<c:out value="${produit.millesime}" />" /></td>
				</tr>
				<tr>
					<td>Prix :</td>
					<td><input type="text" name="prix" value="<c:out value="${produit.prix}" />" /></td>
				</tr>
				<tr>
					<td>Producteur :</td>
					<td><input type="text" name="producteur" value="<c:out value="${produit.producteur}" />" /></td>
				</tr>
				<tr>
					<td>Stock :</td>
					<td><input type="text" name="stock" value="<c:out value="${produit.stock}" />" /></td>
				</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Envoyer"/></td>
			</tr>
		</table>
	</form>

</body>
</html>