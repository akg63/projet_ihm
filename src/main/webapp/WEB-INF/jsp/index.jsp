<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Contact Manager - Index</title>
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
    margin-left: 29em;
}
#add-remove {
    margin-left: 60em;
}
table {
    margin: 0 auto;
}
tbody > tr:first-child td {
    padding-top: 1em;
}
.window-link {
    padding-left: 50px;
    width: 50px;
}
.name, .firstname {
    text-align: left;
}
.email {
    text-align: center;
    padding-top: 0;
    padding-bottom: 2em;
}
.hidden-name, .hidden-firstname {
	color: #D5D3D3;
    text-align: left;
}
.hidden-email {
	color: #D5D3D3;
    text-align: center;
    padding-top: 0;
    padding-bottom: 2em;
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
	<h2 id="title">Liste des contacts</h2>
	
	<div id="window">
		<table>
			<thead></thead>
			<tbody>
				<c:forEach items="${contacts}" var="contact">
					<tr>
						<c:choose>
							<c:when test="${contact.value.actif}">
								<td class="name">${contact.value.nom}</td>
								<td class="firstname">${contact.value.prenom}</td>
							</c:when>
							<c:when test="${!contact.value.actif}">
								<td class="hidden-name">${contact.value.nom}</td>
								<td class="hidden-firstname">${contact.value.prenom}</td>
								</c:when>
							</c:choose>
						<td class="window-link"><a href="<c:url value="/show/${contact.key}" />">Voir</a></td>
					</tr>
				    <tr>
				    	<c:choose>
					    	<c:when test="${contact.value.actif}">
					        	<td class="email" colspan="2">${contact.value.email}</td>
					        </c:when>
					    	<c:when test="${!contact.value.actif}">
					        	<td class="hidden-email" colspan="2">${contact.value.email}</td>
					        </c:when>
				        </c:choose>
				    </tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		
	<a id="add-remove" href="<c:url value="/new" />">Ajouter contact</a>

</body>
</html>
