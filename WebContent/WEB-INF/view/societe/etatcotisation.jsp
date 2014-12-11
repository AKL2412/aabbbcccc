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
						 <li><a href="<c:url value="/societe/${slug }/gerer-salaries/primes-salarie/${salarie.salarieId }" /> ">Primes</a></li>
						<li class="active">Etat cotisation</li>
						</ol>
					</div>
					
				</div>
				
			</div>
 
 </div>
 <div class="row">

 
 </div>
 </c:when>
 </c:choose>