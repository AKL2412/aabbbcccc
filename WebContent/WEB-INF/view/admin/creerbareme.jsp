<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${baremeAction == 'ajout-tranche' and  bareme != null }">
		<div class="panel panel-success">
		<div class="panel-heading">Les tanches du barème : ${bareme.nom }</div>
			  <div class="panel-body">
			    <c:if test="${fn:length(bareme.tranches) >0 }">
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
			    <hr>
			    </c:if>
			    
			    
			    <div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">Ajouter une tranche : </h3>
		    
		  </div>
		  <form action="" method="post" modelAttribute ="bareme" modelAttribute ="tranche">
		  <div class="panel-body">
		    <div id="bareme-form">
		    <input type="text" hidden="hidden" name="action" required="required" value="a-t"/>
		    		<div class="form-group c4 ">
		    			<label>Debut:</label>
		    			<input type="number" class="form-control" name="debut" required="required"/>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Fin:</label>
		    			<input type="number" class="form-control" name="fin" required="required"/>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Taux:</label>
		    			<input type="number" class="form-control" name="taux" required="required"/>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Deduire:</label>
		    			<input type="number" class="form-control" name="deduire"/>
		    		</div>
		    		<input type="number"  name="idbareme" hidden="hidden" value="${bareme.baremeId }" required="required"/>
		    	</div>
		  </div>
		  
		  <div class="panel-footer">
		  <input type="submit" class="btn btn-primary"> 
		  </div>
		  </form>
		</div>
			    
			    
			  </div>
		</div>
	</c:when>
	
	<c:when test="${baremeAction == 'ajout-bareme' }">
				<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">Ajouter un bareme</h3>
		    
		  </div>
		  <form action="" method="post" modelAttribute ="bareme" modelAttribute ="tranche">
		  <div class="panel-body">
		    <div id="bareme-form">
		    <input type="text" hidden="hidden" name="action" required="required" value="a-b"/>
		    		<div class="form-group c2 ">
		    			<label>Nom du barème :</label>
		    			<input type="text" class="form-control" name="nom" required="required"/>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Type de tranche :</label>
		    			<select class="form-control" required="required" name="tranche">
		    				<option value>Tranche</option>
		    				<option value="somme">montant</option>
		    				<option value="anciennente">année</option>
		    			</select>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Type de barème :</label>
		    			<select class="form-control" required="required" name="type">
		    				<option value>type</option>
		    				<option value="1">obligatoire</option>
		    				<option value="0">optionnel</option>
		    			</select>
		    		</div>
		    	</div>
		  </div>
		  
		  <div class="panel-footer">
		  <input type="submit" class="btn btn-primary"> 
		  </div>
		  </form>
		</div>
	</c:when>
	<c:otherwise>
		Erreur
	</c:otherwise>
</c:choose>