<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <script type="text/javascript" src="<c:url value="/sources/js/consultersalarie.js"/> "></script>
<c:choose>
	<c:when test="${salarie!=null }">
		<div class="salarie-presentation">
			<span id="presente-scte" slug="${slug }" ></span>
			<div class="c1 image">
			<div class="col-md-2">
				<img width="100" class="img-thumbnail" src="<c:url value="/documents/${salarie.profil() }"/>" />
				</div>
				<div class="col-md-8">
				<br>
					<ol class="breadcrumb">
					  <li class="active">Consulter</li>
					  <li><a href="<c:url value="/societe/${slug }/gerer-salaries/modifier-salarie/${salarie.salarieId }" /> ">Modifier</a></li>
					  <li><a href="<c:url value="/societe/${slug }/gerer-salaries/supprimer-salarie/${salarie.salarieId }" /> ">Supprimer</a></li>
					   <li><a href="<c:url value="/societe/${slug }/gerer-salaries/conges-salarie/${salarie.salarieId }" /> ">Congés</a></li>
					</ol>
				</div>
				
			</div>
			
			<div class="col-lg-6 block" >
			
			<div class=" titre-bloc">Etat civil </div>
			<table class="table table-striped table-condensed">
				<tbody>
					<tr>
						<td> <strong>Nom</strong> </td>
						<td>${salarie.etatcivile.nom }</td>
					</tr>
					<tr>
						<td> <strong>Prenom</strong> </td>
						<td>${salarie.etatcivile.prenom }</td>
					</tr>
					<tr>
						<td> <strong>Matricule</strong> </td>
						<td>${salarie.etatcivile.matricule }</td>
					</tr>
					<tr>
						<td> <strong>Situation familiale</strong> </td>
						<td>${salarie.etatcivile.situationfamiliale }</td>
					</tr>
					<tr>
						<td> <strong>Nombre d'enfants</strong> </td>
						<td>${fn:length(salarie.etatcivile.enfants) } 
						<c:if test="${fn:length(salarie.etatcivile.enfants) > 0 }">
							<button 
							type="voirenfant" objectId="${salarie.etatcivile.etatcivileId }"
							style="float:right" class="modifier-block btn btn-xs btn-info">
								voir
							</button>
						</c:if> 
					</td>
					</tr>
				</tbody>
			</table>
			
			<div class="modifier-block">
					<button 
					type="ajoutenfant" objectId="${salarie.etatcivile.etatcivileId }"  class=" modifier-block btn btn-xs btn-success">
					<span class="glyphicon glyphicon-plus"></span>
					Ajouter un enfant
					</button>
				</div>
			</div>
			
		<div class="col-lg-6 block" >
			<div class=" titre-bloc">Immatriculation </div>
			<table class="table table-striped table-condensed">
				<tbody>
					<tr>
						<td> <strong>CIN</strong> </td>
						<td>${salarie.immatriculation.cin }</td>
					</tr>
					<tr>
						<td> <strong>CNSS</strong> </td>
						<td>${salarie.immatriculation.cnss }</td>
					</tr>
					<tr>
						<td> <strong>Date de naissance</strong> </td>
						<td>${salarie.immatriculation.datenaissance }</td>
					</tr>
					<tr>
						<td> <strong>Email</strong> </td>
						<td>${salarie.immatriculation.mail }</td>
					</tr>
					<tr>
						<td> <strong>Pays</strong> </td>
						<td>${salarie.immatriculation.pays }</td>
					</tr>
					<tr>
						<td> <strong>Adresse</strong> </td>
						<td>${salarie.immatriculation.adresse }</td>
					</tr>
				</tbody>
			</table>
			
			
				
				
			</div>
			
			<div class="col-lg-6 block" >
			<div class=" titre-bloc">Poste </div>
			<table class="table table-striped table-condensed">
				<tbody>
					<tr>
						<td> <strong>Date d'embauche</strong> </td>
						<td>${salarie.poste.dateembauche }</td>
					</tr>
					<tr>
						<td> <strong>Département</strong> </td>
						<td>${salarie.poste.affectation.departement }</td>
					</tr>
					<tr>
						<td> <strong>Service</strong> </td>
						<td>${salarie.poste.affectation.service }</td>
					</tr>
					
				</tbody>
			</table>
				
				
			</div>
			
			
			<div class="col-lg-6 block" >
			<div class=" titre-bloc">Coordonnées bancaire </div>
			<table class="table table-striped table-condensed">
				<tbody>
					<tr>
						<td> <strong>Banque</strong> </td>
						<td>${salarie.coordonneebancaire.banque }</td>
					</tr>
					<tr>
						<td> <strong>Agence</strong> </td>
						<td>${salarie.coordonneebancaire.agence }</td>
					</tr>
					<tr>
						<td> <strong>Libellé de compte</strong> </td>
						<td>${salarie.coordonneebancaire.libellecompte }</td>
					</tr>
					<tr>
						<td> <strong>Compte</strong> </td>
						<td>${salarie.coordonneebancaire.compte }</td>
					</tr>
				</tbody>
			</table>
			
				
				
			</div>
			
			
			
			<div class="col-lg-6 block" >
			<div class=" titre-bloc">Contrat </div>
			<table class="table table-striped table-condensed">
				<tbody>
					<tr>
						<td> <strong>nature</strong> </td>
						<td>${salarie.contrat.nature }</td>
					</tr>
					<tr>
						<td> <strong>Intitulé de l'emploi</strong> </td>
						<td>${salarie.contrat.intituleemploi }</td>
					</tr>
					<tr>
						<td> <strong>Date de debut</strong> </td>
						<td>${salarie.contrat.datedebut }</td>
					</tr>
					<tr>
						<td> <strong>Fin de contrat</strong> </td>
						<td>${salarie.contrat.datedefin }</td>
					</tr>
					<tr>
						<td> <strong>Fin de periode d'essai</strong> </td>
						<td>${salarie.contrat.datedefinperiodeessai }</td>
					</tr>
					<tr>
						<td> <strong>Salaire de base</strong> </td>
						<td>${salarie.contrat.salairedebase } DH</td>
					</tr>
					<tr>
						<td> <strong>Salaire brute</strong> </td>
						<td>${salarie.contrat.salairebrute } DH</td>
					</tr>
				</tbody>
			</table>
			</div>
			
			<div class="col-lg-6 block" >
			<div class=" titre-bloc">Paie </div>
			<table class="table table-striped table-condensed">
				<tbody>
					<tr>
						<td> <strong>Mode de payement</strong> </td>
						<td>${salarie.paie.modepayement }</td>
					</tr>
					<tr>
						<td> <strong>Salaire brute</strong> </td>
						<td>${salarie.paie.salairebrute }</td>
					</tr>
					<tr>
						<td> <strong>Salaire de base</strong> </td>
						<td>${salarie.paie.salairedebase }</td>
					</tr>
					
				</tbody>
			</table>
			</div>
			
			<div class="col-lg-6 block" type="document" objectId="00">
				<div class=" titre-bloc">Documents </div>
				
				<div class="c2 sblock">
					<div class=" titre-bloc">Attestation de travail </div>
				</div>
				<div class="c2 sblock">
					<div class=" titre-bloc">Contrat de travail </div>
				</div>
				
				
				
				
				<div class="modifier-block">
					<button class="btn btn-xs">
					<span class="glyphicon glyphicon-pencil"></span>
					</button>
				</div>
			</div>
			
			
		</div>
		
	</c:when>
	<c:otherwise>
		<div class="alert-error">
		Erreur
		</div>
	</c:otherwise>
</c:choose>