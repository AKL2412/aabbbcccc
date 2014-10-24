<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${bareme != null }">
	<div class="panel panel-default">
		<div class="panel-heading"><h1>${bareme.nom }</h1></div>
		<div class="panel-body">
		<table class="table table_striped table-condensed table-bordered">
			    	<thead>
			    		<tr>
			    			<th>Debut</th>
			    			<th>Fin</th>
			    			<th>Taux</th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<c:forEach items="${bareme.tranches }" var="t">
			    			<tr>
			    				<td>${t.debut }</td>
			    				<td>${t.fin }</td>
			    				<td>${t.taux }</td>
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