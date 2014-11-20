<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <div class="row">
 	<h1><i class="fa fa-trophy"></i> <u>Les primes </u></h1>
 </div>
<c:choose>
  	<c:when test="${scte.exoEncours() == null }">
  		<div class="row">
  			 <div class="col-md-6 col-md-offset-3">
                          <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Exercice en cours
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                            		<a class="list-group-item" href="<c:url value="/societe/${scte.slug }/gerer-societe/exercices" /> ">
                               <i class="fa fa-warning"></i>
                               Définir l'exercice ne cours
                            </a>
                            
                                
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                	
                </div>
  		
  		</div>
  	</c:when>
  	<c:otherwise>
  		 <div class="row">
  		 <div class="container">
 	<div class="col-md-12">
 		<c:if test="${fn:length(scte.primesCollectives()) > 0 }">
 		
 			<div class="panel panel-success">
 			<div class="panel-heading">
 				<h3>
 				<i class="fa fa-trophy"></i>
 					Les primes
 					<span
 					style="float: right"
 					class="badge"
 					>${salarie.societe.exoEncours().intituleExercice }</span>
 				</h3>
 			</div>
 			<div class="panel-body">
 			<table class="table table-condensed table-striped">
 				<thead>
 					<tr>
 						<th>Nom</th>
 						<th>Montant</th>
 						<th>Motif</th>
 						<th>Type</th>
 						<th>Mois</th>
 				</thead>
 				<tbody>
 					<c:forEach items="${scte.primesCollectives() }" var="a">
 						<tr>
 							<td>${a.nom }</td>
 							<td>${a.montant }</td>
 							<td>${a.motif }</td>
 							<td>${a.type }</td>
 							<td>${a.mois() }</td>
 						</tr>
 					
 					</c:forEach>
 				</tbody>
 			</table>
 			</div>
 		</div>
 		</c:if>
 	</div>
 </div>
 </div>
  		<div class="row">
 	<div class="col-md-8 col-md-offset-2">
 		<div class="panel panel-default">
 			<div class="panel-heading">
 				<h3>
 				<i class="fa fa-trophy"></i>
 				Définir une nouvelle prime (Collective)
 				</h3>
 			</div>
 			<form role="form" method="post" modelAttribute = "prime">
	 			<div class="panel-body">
	 			<div class="form-group col-md-12">
	 					<label>Nom de la prime : </label>
	 					<input type="text" name="nom" required="required" class="form-control" placeholder="Nom de la prime">
	 				</div>
	 				<div class="form-group col-md-6">
	 					<label>Montant : </label>
	 					<input type="number" name="montant" required="required" class="form-control">
	 				</div>
	 				
	 				<div class="form-group col-md-6">
	 					<label>Motif : </label>
	 					<textarea rows="4" name="motif" required="required" class="form-control"></textarea>
	 				</div>
	 				
	 				<div class="form-group col-md-12">
	 					<div class="row">
	 						<h1>Les mois </h1>
	 					</div>
	 						<c:set var="index" value="${mois.keySet() }"/>
	 					
	 						<c:forEach var="m" items="${index }">
	 							
	 							<div class="form-group col-md-3">
	 							<label for="mois${m }"> ${mois.get(m) }</label>
	 							<input  type="checkbox" name="mois${m }" value="${m }" id="mois${m }">
	 							</div>
	 						</c:forEach>
	 					
	 				</div>
	 			
	 			</div>
	 			<div class="panel-footer">
		 			<input type="submit" class="btn btn-primary" value="Sauvegarder">
		 			<input type="reset" class="btn btn-default" value="Annuler">
	 			</div>
 			</form>
 		</div>
 	</div>
 
 </div>
 
  		
  		
  	</c:otherwise>
  
  </c:choose>