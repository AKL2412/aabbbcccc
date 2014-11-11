<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${bareme != null }">
	<div class="panel panel-default">
		<div class="panel-heading">
		<a href="<c:url value="/admin/gerer-baremes/les-compagnies/voir/${bareme.compagnie.compagnieId }" />" >
		    	${bareme.compagnie.nom }
		    </a> &gt; Barème : <span class="badge"> ${bareme.nom }</span> </div>
		<div class="panel-body">
		<table class="table table-striped table-condensed table-bordered">
			    	<thead>
			    		<tr>
			    			<th>Debut</th>
			    			<th>Fin</th>
			    			<th>Taux</th>
			    			<th colspan="2">Formule</th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<c:forEach items="${bareme.tranches }" var="t">
			    			<tr>
			    				<td>${t.debut }</td>
			    				<td>${t.fin }</td>
			    				<td>${t.taux }</td>
			    				<td>${t.formule }</td>
			    				<td>
			    				<a class="btn btn-danger btn-xs supprimer-object" action="delete" object="tranche" objectId="${t.trancheId }">
			    					<i class="fa fa-trash"></i>
			    					Supprimer
			    				</a>
			    		</c:forEach>
			    	</tbody>
			    </table>
		</div>
		<div class="panel-footer text-right">
			<a href="<c:url value="/admin/gerer-baremes/ajout-tranche/${bareme.baremeId}"/> " 
  		class="btn btn-link" role="button">ajouter tranche</a>
		</div>
	</div>
	</c:when>
	<c:otherwise>
		<div class="danger">Erreur </div>
	</c:otherwise>
</c:choose>