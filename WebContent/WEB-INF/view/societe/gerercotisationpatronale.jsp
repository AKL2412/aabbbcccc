<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="panel">
	<div class="panel-heading">
		<h2>Les cotisations | Pratonales</h2>
	</div>
	<div class="panel-body">
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"></div> -->
<!-- 			<div class="panel-body"></div> -->
<!-- 		</div> -->
		<c:forEach items="${societe.baremePatronal() }" var="b">
			<div class="panel panel-default">
				<div class="panel-heading">${b.bareme.nom } | ${b.bareme.compagnie.nom }</div>
				<div class="panel-body">
				<table class="table table-striped table-condensed table-bordered">
			    	<thead>
			    		<tr>
			    			<th>Debut</th>
			    			<th>Fin</th>
			    			<th>Taux</th>
			    			<th >Formule</th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<c:forEach items="${b.bareme.tranches }" var="t">
			    			<tr>
			    				<td>${t.debut }</td>
			    				<td>${t.fin }</td>
			    				<td>${t.taux }</td>
			    				<td>${t.formule }</td>
			    			</tr>
			    		</c:forEach>
			    	</tbody>
			    </table>
				</div>
			</div>
		</c:forEach>
	</div>
</div>