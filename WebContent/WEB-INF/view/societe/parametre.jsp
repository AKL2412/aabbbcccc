<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <div class="row">
 <h1>${scte.intituleSociete}</h1>
 </div>
 <c:set var="exo" value="${scte.exoEncours() }"/>
 <c:choose>
 	
 	<c:when test="${exo == null }">
 		 <div class="row">
 
                <div class="col-md-6">
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
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-bell-o"></i>
				Délai de notification pour la période d'éssai 
			</div>
			<div class="panel-body">
				<c:if test="${scte.parametre.alertefinperiodeessai != null }">
					<div class="alert alert-success">
						Délai actuel : <span class="badge">${scte.parametre.alertefinperiodeessai}</span> Jour(s)
					</div>
				</c:if>
				<form role="form" method="post" action="<c:url value="/societe/${slug }/submit-delai-notification"/>">
					<div class="form-group">
						<label>Nouveau délai de notification :</label>
						<select required="required" class="form-control" name="delai" >
							<option value>Choisir un délai</option>
							<option value="7">Une semaine</option>
							<option value="14">Deux semaine</option>
							<option value="21">Trois semaine</option>
							<option value="30">Un mois</option>
						</select>
					</div>
					<input type="submit" class="btn btn-primary" value="Définir">
				</form>
				
			</div>
		</div>
	</div>
	
	
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-calendar"></i>
				Unité de travail
			</div>
			<div class="panel-body">
				<c:if test="${scte.parametre.unite != null && scte.parametre.nbreunite != null}">
					<div class="alert alert-success text-center">
						<h4> ${scte.parametre.nbreunite} ${scte.parametre.unite } / Mois </h4> 
					</div>
				</c:if>
				<form role="form" method="post" action="<c:url value="/societe/${slug }/submit-unite-de-travail"/>">
					<div class="form-group col-md-6">
						<label>Unité  :</label>
						<select required="required" class="form-control" name="unite" >
							<option value>Choisir unité</option>
							<option value="jours">Jours</option>
							<option value="heure">Heures</option>
						</select>
					</div>
					<div class="form-group col-md-6">
						<label>Nombre par mois  :</label>
						<input required="required" class="form-control" name="nbre" type="number"/>
					</div>
					<input type="submit" class="btn btn-primary" value="Définir">
				</form>
				
			</div>
		</div>
	</div>
 </div>
 
 <div class="row">
 <hr>
 	<c:choose>
 		<c:when test="${exo.ferier == null}">
 			<div class="alert alert-success text-center">
 				<h3>Veuillez renseigner les jours fériers de cet exercice</h3>
 				Exercice : ${exo.dateDebut } - ${exo.dateFin }
 			</div>
 			<div class="col-md-12 ">
 				<div id="calendrier-ferier">
 					<c:forEach var="annee" items="${calendrier.annees }">
 						<div class="annee">
 							<div class="titre">${annee.numero }</div>
 						<div class="contenu">
	 						<c:forEach var="mois" items="${annee.mois }">
	 							<div class="mois">
		 							<div class="titre">${mois.chaine }</div>
		 							<div class="contenu">
		 								<c:forEach var="jour" items="${mois.jours }">
		 								<c:set var="chainemois" value="${mois.numero }"/>
		 								<c:if test="${ mois.numero < 10}">
		 									<c:set var="chainemois" value="0${mois.numero }"/>
		 								</c:if>
		 									<div class="unJour" etat="vide" date="${annee.numero }-${chainemois }-${jour.day }">
		 										<span class="chaine">${jour.chaine }</span> 
		 										<span class="day">${jour.day }</span>
		 									</div>
		 								</c:forEach>
		 							</div>
		 								 
	 							</div>
	 						</c:forEach>
 						</div>
 						</div>
 					</c:forEach>
 					<div class="container-">
 						<button class="btn btn-warning" id="voir-jours" voir="ferier">
 							Voir les jours cochés
 						</button>
 						<button class="btn btn-success" action="update" object="exercice" objectId="${exo.exerciceId}" id="terminer">
 							Valider
 						</button>
 					</div>
 				</div>
 			</div>
 		</c:when>
 		<c:otherwise>
 			<div class="alert alert-success text-center">
 				<h3>les jours fériers de l'exercice : ${exo.intituleExercice } </h3>
 				Du ${exo.dateDebut } au  ${exo.dateFin } | ${fn:length(exo.ferier.tableferiers) } jour(s) férié(s)
 			</div>
 			<c:if test="${fn:length(exo.ferier.tableferiers) > 0 }">
 				<div class="les-jours-feries">
 					<c:forEach var="jour" items="${exo.ferier.tableferiers }">
 					
 					<div class=" col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                   ${jour }
                                
                            </div>
                        </div>
                         <a  href="#" class="supprimer-object" action="delete" object="tableferier" objectId="${jour.tableferierId }">
                            <div class="panel-footer bg-danger">
                                <span class="pull-left">Supprimer</span>
                                <span class="pull-right"><i class="fa fa-trash"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
 					
<!--  						<div class="panel panel-default col-md-3"> -->
<%--  							<div class="panel-heading">${jour }</div> --%>
<%--  							 <a  href="#" class="supprimer-object" action="delete" object="tableferier" objectId="${jour.tableferierId }"> --%>
<!--                             <div class="panel-footer"> -->
<!--                                 <span class="pull-left">Supprimer</span> -->
<!--                                 <span class="pull-right"><i class="fa fa-trash"></i></span> -->
<!--                                 <div class="clearfix"></div> -->
<!--                             </div> -->
<!--                         </a> -->
<!--  						</div> -->
 					</c:forEach>
 				</div>
 			
 			</c:if>
 		</c:otherwise>
 	</c:choose>
 
 </div>
 
 </c:otherwise>
 
 </c:choose>
 <script src=" <c:url value="/sources/js/ferier.js"/>"></script>