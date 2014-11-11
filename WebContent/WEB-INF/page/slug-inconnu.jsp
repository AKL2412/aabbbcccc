<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Erreur</title>
    <link href="<c:url value="/sources/css/bootstrap.css"/> " rel="stylesheet">
</head>
<body>

<div class="jumbotron">
<div class="row">
<div class="col-md-6 col-md-offset-2 alert alert-danger text-center">
<c:choose>
	<c:when test="${code == -1 }">
		Vueillez vous connecter
	</c:when>
	<c:when test="${code == -2 }">
		<h1>${slug } ne correspond à aucune société !!!</h1>
	</c:when>
	<c:when test="${code == 0 }">
		<h1>Non habilité !!!</h1>
		
	</c:when>
	<c:when test="${code == 1 }">
		<i class="fa fa-warning"></i>
		Le salarie avec l'identifiant [ID : ${id }] n'existe pas
		
	</c:when>
</c:choose>
</div>

</div>
<div class="row"><a class="btn-simple" href="<c:url value="/gestion-de-paie"/>">Accueil </a></div>
</div>
</body>
</html>