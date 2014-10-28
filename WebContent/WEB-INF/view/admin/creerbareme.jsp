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
		    			<label>formule:</label>
		    			<textarea class="form-control" name="formule"></textarea>
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
				<div class="panel panel-primary">
				<c:choose>
		  	<c:when test="${compagnie != null }">
		  <div class="panel-heading">
		    <h3 class="panel-title">Ajouter un bareme | ${compagnie.nom }</h3>
		    
		  </div>
		  
		  		 <form action="" method="post" modelAttribute ="bareme"  modelAttribute ="tranche">
		  
		  <div class="panel-body">
		  
		  	
		  
<%-- 		  <input type="text" hidden="hidden" name="_compagnie" required="required" value="${compagnie.compagnieId }"/> --%>
		    <div id="bareme-form">
		    <input type="text" hidden="hidden" name="action" required="required" value="a-b"/>
		    		<div class="form-group c4 ">
		    			<label>Nom du barème :</label>
		    			<input type="text" placeholder="Nom du barème" class="form-control" name="nom" required="required"/>
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
		    				<option value="Salarié">Salarié</option>
		    				<option value="Patronal">Patronal</option>
		    			</select>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Caractère de barème :</label>
		    			<select class="form-control" required="required" name="caractere">
		    				
		    				<option value="optionnel">optionnel</option>
		    			</select>
		    		</div>
		    		<div class="form-group col-md-12 ">
		    			<label>Description :</label>
		    			<textarea class="form-control" name="description"></textarea>
		    		</div>
		    	</div>
		  </div>
		  
		  <div class="panel-footer">
		  <input type="submit" class="btn btn-primary"> 
		  </div>
		  </form>
		  	</c:when>
		  	<c:otherwise>
		  		<div class="alert alert-danger">
		  			Erreur
		  		</div>
		  	</c:otherwise>
		  </c:choose>
		 
		</div>
	</c:when>
	<c:when test="${baremeAction == 'ajout-bareme-obligatoire' }">
	<div class="panel panel-primary">
		  <div class="panel-heading">
		    <h3 class="panel-title">Ajouter un bareme obligatoire</h3>
		    
		  </div>
		  		 <form action="" method="post" modelAttribute ="bareme" modelAttribute ="tranche">
		  
		  <div class="panel-body">
		  
		    <div id="bareme-form">
		    <input type="text" hidden="hidden" name="action" required="required" value="a-b"/>
		    		<div class="form-group c4 ">
		    			<label>Nom du barème :</label>
		    			<input type="text" placeholder="Nom du barème" class="form-control" name="nom" required="required"/>
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
		    				<option value="Salarié">Salarié</option>
		    				<option value="Patronal">Patronal</option>
		    			</select>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Caractère de barème :</label>
		    			<select class="form-control" required="required" name="caractere">
		    				<option value>Caractère</option>
		    				<option value="obligatoire">obligatoire</option>
		    				<option value="optionnel">optionnel</option>
		    			</select>
		    		</div>
		    		<div class="form-group col-md-12 ">
		    			<label>Description :</label>
		    			<textarea class="form-control" name="description"></textarea>
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