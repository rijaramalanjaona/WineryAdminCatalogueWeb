<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des produits</title>

<style type="text/css">
	h1 { 
  		font-family: serif;
		color: #996600;
		padding: 0.3em;
		text-align: center;
		letter-spacing: 0.3em;
	}
	#tab
	{
		margin: auto;
	    border: #DDEEFF 2px solid;
	    border-collapse: separate;
	    border-spacing: 2px;
	    empty-cells: hide;
	}
	
	#tab th, fieldset legend
	{
	    color: #996600;
	    background-color: #FFCC66;
	    border: #FFCC66 1px solid;
	    font-variant: small-caps;
	    font-size: 0.8em;
	    letter-spacing: 1px;
	}
	
	#tab td
	{
	    border: #DDEEFF 1px solid;
	    padding-left: 10px;
	    font-size: 0.8em;
	    letter-spacing: 1px;
	}
	
	fieldset
	{
    	border:2px solid #DDEEFF;
    	-moz-border-radius:8px;
    	-webkit-border-radius:8px;	
    	border-radius:8px;	
    	width:35%;
    	margin:20px auto;
    	font-size: 0.8em;
	    letter-spacing: 1px;
	}
	
</style>
</head>
<body>

	<h1>Liste des produits :</h1>
	<table id="tab">
		<tr>
			<th></th>
			<th></th>
			<th>Id</th>
			<th>Appellation</th>
			<th>Cuvee</th>
			<th>Millesime</th>
			<th>Prix</th>
			<th>Producteur</th>
			<th>Stock</th>
		</tr>
		<c:if test="${liste != null}">
			<c:forEach var="produit" items="${liste}">
		    <tr>
		       	<td><a href="<c:url value="/?action=supprimer&id=${produit.id}"/>">Supprimer</a></td>
		       	<td><a href="<c:url value="/?action=modifier&id=${produit.id}"/>">Editer</a></td>
		    	<td><c:out value="${produit.id}" /></td>
		    	<td><c:out value="${produit.appellation}" /></td>
		    	<td><c:out value="${produit.cuvee}" /></td>
		    	<td><c:out value="${produit.millesime}" /></td>
		    	<td><c:out value="${produit.prix}" /></td>
		    	<td><c:out value="${produit.producteur}" /></td>
		    	<td><c:out value="${produit.stock}" /></td>
		    </tr>	
			</c:forEach>
		</c:if>
	</table>
	
	<form action="<c:url value="/?action=inserer" />" method="post">
		<fieldset>
			<legend>Insertion d'un produit</legend>
			<table>
				<tr>
					<td>Appellation :</td>
					<td><input type="text" name="appellation" value="" /></td>
				</tr>
				<tr>
					<td>Cuvée :</td>
					<td><input type="text" name="cuvee" value="" /></td>
				</tr>
				<tr>
					<td>Millésime :</td>
					<td><input type="text" name="millesime" value="" /></td>
				</tr>
				<tr>
					<td>Prix :</td>
					<td><input type="text" name="prix" value="" /></td>
				</tr>
				<tr>
					<td>Producteur :</td>
					<td><input type="text" name="producteur" value="" /></td>
				</tr>
				<tr>
					<td>Stock :</td>
					<td><input type="text" name="stock" value="" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="Envoyer"/></td>
				</tr>
			</table>
		</fieldset>
			
	</form>
</body>
</html>