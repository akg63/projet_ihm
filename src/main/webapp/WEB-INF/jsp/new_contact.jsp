<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Ajouter un contact</title>
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
	<h2 id="title">Ajouter un contact</h2>

	<div id="window" >
		<form:form method="post" modelAttribute="contact">
		 
			<table>
				<tr>
					<td><form:label path="Nom">Nom</form:label></td>
			        <td><form:input path="Nom" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="Prenom">Prénom</form:label></td>
			        <td><form:input path="Prenom" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="Email">Email</form:label></td>
			        <td><form:input path="Email" /></td>
			    </tr>
			    <tr>
			        <td><form:label path="DateNaissance">Date de naissance</form:label></td>
			        <td><form:input path="DateNaissance" /></td>
			    </tr>		    
			    <tr>
			        <td colspan="2">
			            <input type="submit" value="Ajouter Contact"/>
			        </td>
			    </tr>
			</table> 
		     
		</form:form>
	</div>
	
	<a id="back" href="<c:url value="/" />">Retour</a>


</body>
</html>