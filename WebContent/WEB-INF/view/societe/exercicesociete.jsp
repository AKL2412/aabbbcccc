<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<div class="consultation-societe">
		
			<div class="icon">
				<div class="lien">
				<a  href="<c:url value="/societe/${scte.slug }/gerer-societe" />">Détails</a>
					<a href="<c:url value="/societe/${scte.slug }/gerer-societe/modifier" />">Modifier</a>
					
					<a class="active" href="<c:url value="/societe/${slug }/gerer-societe/exercices" />">Exercices</a>
					<a  href="<c:url value="/societe/${slug }/gerer-salaries/lister"/>">Salariés</a>
					<a  href="<c:url value="/societe/${scte.slug }/gerer-bareme/information" />">Barèmes</a>
				</div>
				<div class="nom">
					${societe.intituleSociete }
				</div>
				<div class="image">
					<img src="<c:url value="/documents/${societe.lienLogo() }"/>"/>
				</div>
				
			</div>
			<div class="detail">
				<div class="add-exo">
				<div class="buttons">
					<input class="btn-primary" id="ajouter-exo" value="Ajouter un nouvel exercice" type="button">
					</div>
					<form action="" method="post" class="form-blocd" modelAttribute="exercice">
					<c:if test="${message != null}">
						<div class=" alert alert-info">
							<i class="fi-x"></i>
								${message }
							</div>
					</c:if>
						<div class="input c1">
							<label>intitulé de l'exercice : </label>
							<input required="required" type="text"  placeholder="intitulé de l'exercice"   name="intituleExercice"/>
						</div>
						<div class="input c2">
							<label>Date de debut d'exercice: </label>
							<input required="required" type="date"   name="_dateDebut"/>
						</div>
						<div class="input c2">
							<label>Date de fin d'exercice : </label>
							<input required="required" type="date"    name="_dateFin"/>
						</div>
						<div class="submit">
							<input type="submit" class="btn btn-default" value="Enregistrer">
							<input type="reset" class="btn btn-default" value="Annuler">
						</div>
					</form>
					
				</div>
				<c:if test="${fn:length(scte.exercices) > 0  }">
				<div class="les-exos">
				<table  class="table table-bordered table-striped table-condensed">
				<thead>
					<tr>
<!-- 						<th></th> -->
						<th>Intitulé de l'exercice</th>
						<th>Debut d'exercice</th>
						<th> Fin d'exercice</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${scte.exercices }" var="exo" varStatus="stat">
					
					<tr>
<%-- 					<td>${exo.exerciceId }</td> --%>
						<td>
							${exo.intituleExercice }
							<c:if test="${exo.encours }">
								<span class="badge">
									Actuel
								</span>
							</c:if>
						</td>
						<td>${exo.dateDebut }</td>
						<td>${exo.dateFin }</td>
					</tr>
					</c:forEach>
					</tbody>
					</table>
				</div>
				</c:if>
				
			</div>
		</div>

<script>
jQuery(document).ready(function($) {
	$('.add-exo').attr('etat','non');
	$('#ajouter-exo').click(function(e){
		if($('.add-exo').attr('etat') == 'non'){
			$('.add-exo').animate({height: 230}, 500);
			$('.add-exo').attr('etat','ok');
		}else{
			$('.add-exo').animate({height: 30}, 200);
			$('.add-exo').attr('etat','non');
			}
		
		});
});
</script>

