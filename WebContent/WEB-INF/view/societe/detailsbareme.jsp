<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${societe != null }">
			<div class="consultation-societe">
		
			<div class="icon">
				<div class="lien">
					
					<a href="<c:url value="/societe/${scte.slug }/gerer-societe" />">Détails</a>
					<a href="<c:url value="/societe/${scte.slug }/gerer-societe/modifier" />">Modifier</a>
					<a href="<c:url value="/societe/${scte.slug }/gerer-societe/exercices" />">Exercices</a>
					<a  href="<c:url value="/societe/${scte.slug }/gerer-salaries/lister"/>">Salariés</a>
					<a class="active" href="<c:url value="/societe/${scte.slug }/gerer-bareme/information" />">Barèmes</a>
				</div>
				<div class="nom">
					${societe.intituleSociete }
				</div>
				<div class="image">
					<img src="<c:url value="/documents/${societe.lienLogo() }"/>"/>
				</div>
				
			</div>
			<div class="detail">
				
				<div class="panel panel-default">
					<div class="panel-heading">Les barèmes obligatoires : [${fn:length(scte.baremeObligatoires()) }]</div>
					<div class="panel-body">
						<c:if test="${fn:length(scte.baremeObligatoires()) > 0 }">
						<div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                        	<th>Nom du barème</th>
                                        	<th>Compagnie</th>
                                        	<th>Caractère du barème</th>
                                        	
                                        	
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${scte.baremeObligatoires() }" var="sb">
 											<tr>
 												<td>${sb.bareme.nom }</td>
 												<td>${sb.bareme.compagnie.nom }</td>
 												<td>${sb.bareme.caractere }</td>
 												
 											</tr>
 										</c:forEach>
                                    </tbody>
                                  </table>
                                 </div>
						</c:if>
					</div>
				
				</div>
				
				<div class="panel panel-success">
					<div class="panel-heading">Les barèmes propres : [${fn:length(scte.baremePropres()) }]</div>
					<div class="panel-body">
						<c:if test="${fn:length(scte.baremePropres()) > 0 }">
						<div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                        	<th>Nom du barème</th>
                                        	<th>Compagnie</th>
                                        	<th>Caractère du barème</th>
                                        	
                                        	
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${scte.baremePropres() }" var="sb">
 											<tr>
 												<td>${sb.bareme.nom }</td>
 												<td>${sb.bareme.compagnie.nom }</td>
 												<td>${sb.bareme.caractere }</td>
 												
 											</tr>
 										</c:forEach>
                                    </tbody>
                                  </table>
                                 </div>
						</c:if>
					</div>
				
				</div>
				
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<h1>Lien Incorrect : ${slug }</h1>
	</c:otherwise>
</c:choose>

