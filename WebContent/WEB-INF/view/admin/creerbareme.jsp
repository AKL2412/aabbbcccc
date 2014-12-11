<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${baremeAction == 'ajout-tranche' and  bareme != null }">
		<div class="panel panel-success">
		<div class="panel-heading">Les tanches du barème : 
		<a href="<c:url value="/admin/gerer-baremes/voir/${bareme.baremeId}"/> ">
 														${bareme.nom } <span class="badge">${bareme.tranche }</span>
 													</a> | 
		<a href="<c:url value="/admin/gerer-baremes/les-compagnies/voir/${bareme.compagnie.compagnieId }" />" >
		    	${bareme.compagnie.nom }
		    </a>
		</div>
			  <div class="panel-body">
			    <c:if test="${fn:length(bareme.tranches) >0 }">
			    	<table class="table table_striped table-condensed table-bordered">
			    	<thead>
			    		<tr>
			    			<th>Debut</th>
			    			<th>Fin</th>
			    			<th>Taux</th>
			    			<th>Formule</th>
			    		</tr>
			    	</thead>
			    	<tbody>
			    		<c:forEach items="${bareme.tranches }" var="t">
			    			<tr>
			    				<td>${t.debut }</td>
			    				<td>${t.fin }</td>
			    				<td>${t.taux }</td>
			    				<td>${t.formule }</td>
			    		</c:forEach>
			    	</tbody>
			    </table>
			    <hr>
			    </c:if>
			    
			    
			    <div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">Ajouter une tranche : </h3>
		    
		  </div>
		  <form action="" method="post"  modelAttribute ="tranche">
		  <input type="text" hidden="hidden" name="idbareme" required="required" value="${bareme.baremeId }"/>
		  <div class="panel-body">
		    <div id="bareme-form">
		    <input type="text" hidden="hidden" name="action" required="required" value="a-t"/>
		    		<div class="form-group c4 ">
		    			<label>Debut:</label>
		    			<input type="text" pattern="([1-9])[0-9]*.([0-9])*" placeholder="1500.0" class="form-control" name="debut" required="required"/>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Fin:</label>
		    			<input type="text" pattern="([1-9])[0-9]*.([0-9])*" placeholder="1500.0" class="form-control" name="fin" required="required"/>
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>Taux:</label>
		    			<input type="text"  class="form-control" name="taux" required="required" placeholder="05.40" pattern="([0-9])[0-9].[0-9]*">
		    		</div>
		    		<div class="form-group c4 ">
		    			<label>formule:</label>
		    			<textarea class="form-control" name="formule"></textarea>
		    		</div>
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
		    <h3 class="panel-title">Ajouter un bareme | 
		    <a href="<c:url value="/admin/gerer-baremes/les-compagnies/voir/${compagnie.compagnieId }" />" >
		    	${compagnie.nom }
		    </a>
		    </h3>
		    
		  </div>
		  
		  		 <form action="" method="post" modelAttribute ="bareme"  modelAttribute ="tranche">
		  
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
		  <fieldset>
		  	<legend>La compagnie : </legend>
		  	<div class="form-group col-md-4">
		  		<select name="_compagnie" id="select-compagnie" class="form-control" required="required">
		  			<option value>Compagnie</option>
		  			<c:forEach items="${compagnies }" var="c">
		  				<option value="${c.compagnieId }">${c.nom }</option>
		  			</c:forEach>
		  			<option value="add-compagnie">Ajouter une compagnie</option>
		  		</select>
		  	</div>
		  </fieldset>
		  
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
		    				<option value="obligatoire">obligatoire</option>
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
<script type="text/javascript">
jQuery(document).ready(function($) {
	$('#select-compagnie').change(function(event) {
		/* Act on the event */
		var val = $(this).val();
		if(val == 'add-compagnie'){
			var url = getRacine()+'/admin/gerer-baremes/les-compagnies';
			window.location.replace(url);
			//alert(url);
		}
	});
});

</script>