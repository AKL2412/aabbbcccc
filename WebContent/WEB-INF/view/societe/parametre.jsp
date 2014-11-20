<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <div class="row">
 <h1>${scte.intituleSociete}</h1>
 </div>
  <div class="row">
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-bell-o"></i>
				D�lai de notification pour la p�riode d'�ssai 
			</div>
			<div class="panel-body">
				<c:if test="${scte.parametre.alertefinperiodeessai != null }">
					<div class="alert alert-success">
						D�lai actuel : <span class="badge">${scte.parametre.alertefinperiodeessai}</span> Jour(s)
					</div>
				</c:if>
				<form role="form" method="post" action="<c:url value="/societe/${slug }/submit-delai-notification"/>">
					<div class="form-group">
						<label>Nouveau d�lai de notification :</label>
						<select required="required" class="form-control" name="delai" >
							<option value>Choisir un d�lai</option>
							<option value="7">Une semaine</option>
							<option value="14">Deux semaine</option>
							<option value="21">Trois semaine</option>
							<option value="30">Un mois</option>
						</select>
					</div>
					<input type="submit" class="btn btn-primary" value="D�finir">
				</form>
				
			</div>
		</div>
	</div>
	
	
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-calendar"></i>
				Unit� de travail
			</div>
			<div class="panel-body">
				<c:if test="${scte.parametre.unite != null && scte.parametre.nbreunite != null}">
					<div class="alert alert-success text-center">
						<h3> ${scte.parametre.nbreunite} ${scte.parametre.unite } / Mois </h3> 
					</div>
				</c:if>
				<form role="form" method="post" action="<c:url value="/societe/${slug }/submit-unite-de-travail"/>">
					<div class="form-group col-md-6">
						<label>Unit�  :</label>
						<select required="required" class="form-control" name="unite" >
							<option value>Choisir unit�</option>
							<option value="jours">Jours</option>
							<option value="mois">Mois</option>
						</select>
					</div>
					<div class="form-group col-md-6">
						<label>Nombre par mois  :</label>
						<input required="required" class="form-control" name="nbre" type="number"/>
					</div>
					<input type="submit" class="btn btn-primary" value="D�finir">
				</form>
				
			</div>
		</div>
	</div>
 </div>