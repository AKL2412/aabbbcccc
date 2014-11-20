<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 

 		<div class="row"><h1>${bareme.nom }</h1></div>
 		<div class="row">
 			<table class="table table-condensed">
			 <tr>
			 	<td>Type de tranche</td><td><b>${bareme.tranche } </b></td>
			 	<td></td><td><b></b></td>
			 </tr>   	
			  <tr>
			  	<td>Type du barème</td><td><b>${bareme.type }</b></td>
			  	<td>Caratère du barème</td><td><b>${bareme.caractere }</b></td>
			  </tr>
			  <tr>
			  	<td colspan="4">
			  	<div class="alert alert-info">
			  		<h4>Description : </h4>
			  		${bareme.description }
			  	</div>
			  	
			  	</td>
			  </tr>
			  </table>
 		</div>
 	
 		
 		
 			<div class="panel panel-default">
		<div class="panel-heading">
		Les tranches
		 </div>
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
			    		<c:forEach items="${bareme.tranches }" var="t">
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
	
 		<div class="panel panel-default">
		<div class="panel-heading">
			<h2>Compagnie : ${bareme.compagnie.nom }</h2>
		 </div>
		<div class="panel-body">
			${bareme.compagnie.description }
		</div>
	</div>
 
 