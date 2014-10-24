<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<div class="consultation-societe">
		
			<div class="icon">
				<div class="lien">
					<a href="<c:url value="/admin/gerer-societes/modifier/${societe.slug }" />">Modifier</a>
					<a href="#">Supprimer</a>
					<a class="active" href="<c:url value="/admin/gerer-societes/${societe.slug }/exercices" />">Exercices</a>
					<a href="#">Salariés</a>
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
					<form action="" method="post" class="form-blocd" modelAttribute="exercice">
					<c:if test="${message != null}">
						<div class="message">
							<i class="fi-x"></i>
								${message }
							</div>
					</c:if>
						<div class="input c1">
							<label>intitulé de l'exercice : </label>
							<input type="text"  placeholder="intitulé de l'exercice"   name="intituleExercice"/>
						</div>
						<div class="input c2">
							<label>Date de debut d'exercice: </label>
							<input type="date"   name="_dateDebut"/>
						</div>
						<div class="input c2">
							<label>Date de fin d'exercice : </label>
							<input type="date"    name="_dateFin"/>
						</div>
						<div class="submit">
							<input type="submit" value="Enregistrer">
							<input type="reset" value="Annule">
						</div>
					</form>
				</div>
			
				
			</div>
		</div>



