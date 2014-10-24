<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<c:choose>
		<c:when test='${type == "ajoutenfant" }'>
		<div class="panel panel-default">
		<div class="panel-heading">
		<h1>${titre }
		</h1>
		</div>
			
			<form action="<c:url value="${url }"/>"
			modelAttribute="enfant"
			role="form"
			method="post"
			>
				
						<div class="form-group" >
							<label>Nom : </label>
							<input type="text" required="required" class="form-control" placeholder="nom de l'enfant" name="nom"/>
						</div>
						<div class="form-group">
							<label>Prenom: </label>
							<input type="text" required="required" class="form-control" placeholder="prenom de l'enfant" name="prenom"/>
						</div>
						<div class="form-group">
							<label>Matricule : </label>
							<input type="date" required="required"  class="form-control" name="_datenaissance"/>
						</div>
						 <div class="panel-footer">
						 <div class="form-group">
						<input type="submit" value="valider" class="btn btn-primary " /> 
						
						<input type="reset" value="annuler" class="btn btn-primary" /> 
						</div>
						 
						 </div>
						
			</form>
			</div>
		</c:when>
		<c:when test='${type == "voirenfant" }'>
			<div class="panel panel-info">
				<div class="panel-heading">
				<h1>${titre }
				</h1>
				</div>
				<div class="panel-body">
				<table class="table table-condensed table-bordered table-striped">
					<thead>
						<tr>
							<th>Nom</th>
							<th>Prenom</th>
							<th>Date de naissance</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ec.enfants }" var="en">
				    		<tr>
				    			<td>${en.nom }</td>
				    			<td>${en.prenom }</td>
				    			<td>${en.datenaissance }</td>
				    		</tr>
				    			
				   		 </c:forEach>
					</tbody>
					<tfoot>
						<tr class="warning">
							<td colspan="2"> Nombre d'enfants </td>
							<td>${fn:length(ec.enfants) }</td>
						</tr>
					</tfoot>
				</table>
				    
				 </div>
			
			</div>
		</c:when>
		<c:when test='${type == "poste" }'>
			<h1>${titre }</h1>
		</c:when>
		<c:when test='${type == "coordonneebancaire" }'>
			<h1>${titre }</h1>
		</c:when>
		<c:when test='${type == "contrat" }'>
			<h1>${titre }</h1>
		</c:when>
		<c:when test='${type == "paie" }'>
			<h1>${titre }</h1>
		</c:when>
		<c:when test='${type == "document" }'>
			<h1>${titre }</h1>
		</c:when>
		
	
	</c:choose>
	
</body>
</html>