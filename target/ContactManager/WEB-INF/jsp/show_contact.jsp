<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${contact.prenom} ${contact.nom}</title>
	<style type="text/css">		
body {
    margin: 0;
    text-decoration: none;
    font-family: Helvetica, Arial, sans-serif;
    background-color: #F7F7F7;
}
#window {
    box-shadow: 0 3px 6px rgba(50, 50, 50, 0.13);
    background-color: white;
    border-radius: 9px;
    border: 1px solid #F7F7F7;
    width: 35em;
    margin: 1em auto 1em auto;
}
#back {
    margin-left: 33.6em;
}
#add-remove {
    margin-left: 25em;
}
table {
    margin: 0 auto;
}
tbody > tr:first-child td {
    padding-top: 1em;
}
td {
    padding-bottom: 1em;
}
.window-link, .window-link-bis {
    padding-left: 50px;
    width: 50px;
}
.label, .value {
    text-align: left;
}
.label, .label-bis {
    font-weight: bold;
}
.label-bis, .value-bis, .window-link-bis {
    padding-bottom: 7px;
}
#title {
    margin: 3em auto 0 auto;
    width: 390px;
}
a {
    font-size: small;
}
	
	</style>
</head>
<body>
	
	<h2 id="title">Profil de ${contact.prenom} ${contact.nom}</h2>
	
	<div id="window">
		<table>
			<thead></thead>
			<tbody>
				<c:if test="${empty contact.adresseFacturation.numero && empty contact.adresseFacturation.rue && empty contact.adresseFacturation.codePostal && empty contact.adresseFacturation.ville}">
					<c:set target="${contact}" property="actif" value="false"/>
				</c:if>
				<c:if test="${!empty contact.adresseFacturation.numero && !empty contact.adresseFacturation.rue && !empty contact.adresseFacturation.codePostal && !empty contact.adresseFacturation.ville}">
					<tr>
						<td class="label">Actif :</td>
						<c:choose>
							<c:when test="${contact.actif}">
								<td class="value">Oui</td>
							</c:when>
							<c:when test="${!contact.actif}">
								<td class="value">Non</td>
							</c:when>
						</c:choose>
						<td><a class="window-link" href="<c:url value="/edit/${contactId}/Actif" />">Editer</a></td>
					</tr>
				</c:if>
				<tr>
					<td class="label">Nom :</td>
					<td class="value">${contact.nom}</td>
					<td><a class="window-link" href="<c:url value="/edit/${contactId}/Nom" />">Editer</a></td>
				</tr>
				<tr>
					<td class="label">Prenom :</td>
					<td class="value">${contact.prenom}</td>
					<td><a class="window-link" href="<c:url value="/edit/${contactId}/Prenom" />">Editer</a></td>
				</tr>
				<tr>
					<td class="label">E-mail :</td>
					<td class="value">${contact.email}</td>
					<td><a class="window-link" href="<c:url value="/edit/${contactId}/Email" />">Editer</a></td>
				</tr>
				<tr>
					<td class="label">Date de naissance :</td>
					<td class="value">${contact.dateNaissance}</td>
					<td><a class="window-link" href="<c:url value="/edit/${contactId}/DateNaissance" />">Editer</a></td>
				</tr>
				<tr>
					<td class="label">Adresse de facturation :</td>
					<td class="value">${contact.adresseFacturation.numero} ${contact.adresseFacturation.rue}</td>
					<td><a class="window-link" href="<c:url value="/show/${contactId}/invoicing" />">Editer</a></td>
				</tr>
				<tr>
					<td class="label"></td>
					<td class="value">${contact.adresseFacturation.codePostal} ${contact.adresseFacturation.ville}</td>
				</tr>
				<!--<c:set var="key" value="0" scope="request" />-->
			    <c:forEach items="${contact.adressesLivraison}" var="adresse" >
					<tr>
						<!--<c:set target="${requestScope}" property="key" value="${key+1}" />-->
						<td class="label-bis">Adresse de livraison ${adresse.key+1} :</td>
						<td class="value-bis">${adresse.value.numero} ${adresse.value.rue} </td> 
						<td><a class="window-link-bis" href="<c:url value="/show/${contactId}/edit_delivery/${adresse.key}" />">Editer</a></td>
					</tr>
					<tr>
						<td class="label"></td>						
						<td class="value">${adresse.value.codePostal} ${adresse.value.ville}</td>
						<td><a class="window-link" href="<c:url value="/show/${contactId}/remove_delivery/${adresse.key}" />">Supprimer</a></td>
					</tr>		    	
			    </c:forEach>
			    <tr>
			    	 <td><a href="<c:url value="/show/${contactId}/new_delivery" />">Ajouter une adresse de livraison</a></td>
			    </tr>		
			</tbody>
		</table>
	</div>
	
	<a id="back" href="<c:url value="/" />">Retour</a>
	<a id="add-remove" href="<c:url value="/delete/${contactId}" />">Supprimer le contact</a>

</body>
</html>