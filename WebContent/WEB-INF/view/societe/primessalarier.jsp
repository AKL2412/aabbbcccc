<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${salarie != null }">
		 <div class="row">
 	<div class="c1 image">
			<div class="col-md-2">
				<img width="150" class="img-thumbnail" src="<c:url value="/documents/${salarie.profil() }"/>" />
				</div>
				<div class="col-md-8">
				<div class="row">
						<h2>
						<u>${salarie.etatcivile.prenom } ${salarie.etatcivile.nom }</u>
						</h2>
					</div>
					<div class="row">
						<c:if test="${!salarie.baremeAjour() }">
							<div class="alert alert-danger">
								<i class="fa fa-warning"></i>
								Veuillez renseigner le code de ce salarie pour certains barèmes[OBLIGATOIRE]  : 
								<a href="<c:url value="/societe/${slug }/gerer-salaries/bareme-salarie/${salarie.salarieId }" /> ">
								<i class="fa fa-edit"></i>
								Renseigner code</a>
							</div>
						</c:if>
					</div>
			
					<div class="row">
						<ol class="breadcrumb">
						  
						  <li><a href="<c:url value="/societe/${slug }/gerer-salaries/consulter-salarie/${salarie.salarieId }" /> ">Consulter</a></li>
						  <li><a href="<c:url value="/societe/${slug }/gerer-salaries/modifier-salarie/${salarie.salarieId }" /> ">Modifier</a></li>
						  <li><a href="<c:url value="/societe/${slug }/gerer-salaries/supprimer-salarie/${salarie.salarieId }" /> ">Supprimer</a></li>
						    <li><a href="<c:url value="/societe/${slug }/gerer-salaries/conges-salarie/${salarie.salarieId }" /> ">Congés</a></li>
						  <li><a href="<c:url value="/societe/${slug }/gerer-salaries/bareme-salarie/${salarie.salarieId }" /> ">Barèmes</a></li>
						 <li   >
						 <a href="<c:url value="/societe/${slug }/gerer-salaries/avances-salarie/${salarie.salarieId }" /> ">
						  Avances
						  </a>
						 </li>
						 <li><a href="<c:url value="/societe/${slug }/gerer-salaries/commissions-salarie/${salarie.salarieId }" /> ">commissions</a></li>
						 <li class="active">Primes</li>
						<li><a href="<c:url value="/societe/${slug }/gerer-salaries/etat-cotisation-salarie/${salarie.salarieId }" /> ">Etat cotisation</a></li>
						</ol>
					</div>
					
				</div>
				
			</div>
 
 </div>
 <div class="row">
  <c:choose>
  	<c:when test="${salarie.societe.exoEncours() == null }">
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
 		<c:if test="${fn:length(salarie.primeExercice(salarie.societe.exoEncours())) > 0 }">
 		
 			<div class="panel panel-default">
 			<div class="panel-heading">
 				<h3>
 				<i class="fa fa-trophy"></i>
 					Les primes de : ${salarie.etatcivile.prenom } ${salarie.etatcivile.nom } 
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
 						<th>Affecté le</th>
 						<th colspan="2">Mois</th>
 				</thead>
 				<tbody>
 					<c:forEach items="${salarie.primeExercice(salarie.societe.exoEncours()) }" var="a">
 						<tr>
 							<td>${a.prime.nom }</td>
 							<td>${a.prime.montant }</td>
 							<td>${a.prime.motif }</td>
 							<td>${a.prime.type }</td>
 							<td>${a.date }</td>
 							<td>${a.prime.mois() }</td>
 							
 							<td>
 								<c:if test="${a.prime.type == 'collective' }">
 									<button class="btn btn-danger btn-xs supprimer-object" action="delete" object="primesalarie" objectId="${a.primesalarieId }">
 										Deposséder
 									</button>
 								</c:if>
 							</td>
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
  		<div class="container">
 	<div class="col-md-6">
 		<div class="panel panel-default">
 			<div class="panel-heading">
 				<h3>
 				<i class="fa fa-trophy"></i>
 				Définir une nouvelle prime (Individuelle)
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
	 					<label>Pour le mois de : </label>
	 					<select name="mois" required="required" class="form-control">
	 						<option value>Choisir le mois</option>
	 						<c:set var="index" value="${mois.keySet() }"/>
	 					
	 						<c:forEach var="m" items="${index }">
	 							<option value="${m }">
	 								<c:choose>
	 									<c:when test="${m == moisActuelle }"> Pour ce mois</c:when>
	 									<c:otherwise>${mois.get(m) }</c:otherwise>
	 								</c:choose>
	 								
	 							</option>
	 						</c:forEach>
	 					</select>
	 				</div>
	 				<div class="form-group col-md-12">
	 					<label>Motif : </label>
	 					<textarea rows="4" name="motif" required="required" class="form-control"></textarea>
	 				</div>
	 			
	 			</div>
	 			<div class="panel-footer">
		 			<input type="submit" class="btn btn-primary" value="Sauvegarder">
		 			<input type="reset" class="btn btn-default" value="Annuler">
	 			</div>
 			</form>
 		</div>
 	</div>
 	
 	
 	<div class="col-md-6">
 		<div class="panel panel-warning">
 			<div class="panel-heading">
 				<h3>
 				<i class="fa fa-trophy"></i>
 				Affecter une prime
 				</h3>
 			</div>
 			<form role="form" method="post" action="<c:url value="/societe/${salarie.societe.slug }/affectation-prime/${salarie.salarieId }" />">
	 			<div class="panel-body">
	 			
	 			<c:forEach items="${salarie.societe.primesCollectives() }" var="prime">
	 				<c:if test="${!salarie.possedePrime(prime) }">
	 					<div class="form-group col-md-6">
		 					<label for="prime${prime.primeId }">${prime.nom }</label>
		 					<input type="checkbox" name="prime${prime.primeId }" value="${prime.primeId }" id="prime${prime.primeId }">
	 					</div>
	 				</c:if>
	 			</c:forEach>
	 			
	 			</div>
	 			<div class="panel-footer">
		 			<input type="submit" class="btn btn-primary" value="Affecter">
		 			<input type="reset" class="btn btn-default" value="Annuler">
	 			</div>
 			</form>
 		</div>
 	</div>
 	
 </div>
 </div>

  		
  	</c:otherwise>
  
  </c:choose>
 </div>
 </c:when>

 </c:choose>