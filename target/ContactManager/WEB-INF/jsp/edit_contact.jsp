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
    width: 25em;
    margin: 1em auto 1em auto;
}
#back {
    margin-left: 39em;
}
#contact {
    padding-top: 1em;
    padding-bottom: 1em;
}
table {
    text-align: center;
    margin: 0 auto;
}
#title {
    margin: 3em auto 0 auto;
    width: 390px;
}
#label, #input {
    margin-top: 1em;
}
a {
    font-size: small;
}
#submit {
    padding-top: 5px;
}
	
	</style>
</head>
<body>

	<h2 id="title">Editer le profil de ${contact.prenom} ${contact.nom}</h2>
	
	<div id="window">
		<form:form method="post" modelAttribute="contact">
			<table>
				<tr>
					<c:choose>
						<c:when test="${fieldType == 'Actif'}">
							<td class="label"><form:label path="Actif">Actif :</form:label></td>
					        <td class="input"><form:checkbox path="Actif" /></td>
				        </c:when>
						<c:when test="${fieldType == 'Nom'}">
							<td class="label"><form:label path="Nom">Nom :</form:label></td>
					        <td class="input"><form:input path="Nom" /></td>
				        </c:when>
					    <c:when test="${fieldType == 'Prenom'}">
					    	<td class="label"><form:label path="Prenom">Prénom :</form:label></td>
					    	<td class="input"><form:input path="Prenom" /></td>
					    </c:when>
					    <c:when test="${fieldType == 'Email'}">
					        <td class="label"><form:label path="Email">Email :</form:label></td>
					        <td class="input"><form:input path="Email" /></td>
					    </c:when>
					    <c:when test="${fieldType == 'DateNaissance'}">
							<td class="label"><form:label path="DateNaissance">Date de naissance :</form:label></td>
					        <td class="input"><form:input path="DateNaissance" /></td>
					    </c:when>
				    </c:choose>
				</tr>
			    <tr>
			        <td id="submit" colspan="2">
			            <input type="submit" value="Editer"/>
			        </td>
			    </tr>
			</table> 
		     
		</form:form>
	</div>

	<a id="back" href="<c:url value="/show/${contactId}" />">Retour</a>

</body>
</html>