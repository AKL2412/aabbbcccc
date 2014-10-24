<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<ul class="gp-action">
	<li class="gp-lien"><a href="<c:url value="/admin/gerer-utilisateurs/creer"/>">Créer</a> </li>
	<li class="gp-lien"><a href="<c:url value="/admin/gerer-utilisateurs/modifier"/>">Modifier</a> </li>
	<li class="gp-lien"><a href="#">Désactiver</a></li>
	<li class="gp-lien"><a href="#">Supprimer</a></li>
</ul>