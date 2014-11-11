<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${salarie != null }">
		 <div class="row">
 	<div class="c1 image">
			<div class="col-md-2">
				<img width="100" class="img-thumbnail" src="<c:url value="/documents/${salarie.profil() }"/>" />
				</div>
				<div class="col-md-8">
				
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
						   <li class="active">Congés</li>
						  <li><a href="<c:url value="/societe/${slug }/gerer-salaries/bareme-salarie/${salarie.salarieId }" /> ">Barèmes</a></li>
						 
						</ol>
					</div>
					
				</div>
				
			</div>
 
 </div>
 <div class="row">
 	<div class="alert alert-success col-md-4 col-md-offset-4 text-center">
 		Nombre de jour restant : ${salarie.nbrejour }
 	</div>
 </div>
 <div class="row">
 	<div class="container">
 		<div class="panel panel-default">
 		<div class="panel-heading">
 			<i class="fa fa-calendar"></i>
 			Définir un congé
 		</div>
 		<div class="panel-body">
 			<c:choose>
 				<c:when test="${salarie.nbrejour > 0  }">
 					
 					
 					<form method="post" role="form"
 					modelAttribute = "conge"
 					>
 						<div class="form-group col-md-6">
 							<label>La date de debut de congé:</label>
 							<input type="text" required="required" id="dateDedebut" class="form-control" name="datedebut" total="${salarie.nbrejour }" dateDebut="${ salarie.dateDeConges()}"/>
 						</div>
 						<div class="form-group col-md-6">
 							<label>La date de fin de congé:</label>
 							<input type="text" required="required" id="dateDefin" class="form-control" name="datefin"/>
<%--  							<img alt="wait.." src="<c:url value="/sources/img/loaderf.gif" /> "> --%>
 						</div>
 						<div class="form-group col-md-12">
 							<label>Détails du congé:</label>
 							<textarea class="form-control" name="details"></textarea>
 						</div>
 						<input type="text" hidden="hidden" required="required" id="jourtotal" name="jourtotal"/>
 						<div>
 							<input type="submit" id="btn-valider" value="Enregistrer" class="btn btn-primary">
 						</div>
 					</form>
 				</c:when>
 				<c:otherwise>
 					<div class="alert alert-danger">
 						le salarié ${salarie.etatcivile.nom } ne dispose actuellement pas de jours de congés 
 					</div>
 				</c:otherwise>
 			</c:choose>
 		</div>
 	</div>
 	</div>
 </div>
 <div class="row">
 	<div class="container">
 		<div class="panel panel-success">
 		<div class="panel-heading">
 			<i class="fa fa-calendar-o"></i>
 			Les congés pris par ${salarie.etatcivile.prenom } ${salarie.etatcivile.nom }
 		</div>
 		<div class="panel-body">
 			<table class="table table-striped table-condensed table-bordered">
 				<thead>
 					<tr>
 						<th>Date de debut</th>
 						<th>Date de fin</th>
 						<th>Nombre de jours</th>
 						<th>Détails</th>
 					</tr>
 				</thead>
 				<tbody>
 					<c:forEach items="${salarie.conges }" var="c">
 						<tr>
 							<td>${c.datedebut }</td>
 							<td>${c.datefin }</td>
 							<td>${c.jourtotal }</td>
 							<td>${c.details }</td>
 						</tr>
 					</c:forEach>
 				</tbody>
 			</table>
 		</div>
 	</div>
 	</div>
 </div>
	</c:when>
	<c:otherwise>
		<div class="alert alert-danger">
			Erreur 
		</div>
	</c:otherwise>
</c:choose>

<script src=" <c:url value="/sources/js/jquery-ui.js"/>"></script>
<script src=" <c:url value="/sources/js/conges.js"/>"></script>
