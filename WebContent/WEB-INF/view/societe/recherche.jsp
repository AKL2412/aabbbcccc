<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <div class="row">
 	<div class="container">
 	
 		<div class="col-md-4">
 	Recherche : ${q }
 	</div>
 	<div class="col-md-8">
 		<form method="get" action="<c:url value="/societe/${scte.slug }/recherche"/>">
          <div class="form-group ">
              <input type="text"  name="q" class="form-control" placeholder="Search salarié...">
                                
            </div>
        </form>
 	</div>
 	
 	</div>
 	
 </div>
 <div class="row">
 	<div class="container">
 	<c:forEach items="${result }" var="s">
 		<div class="unSalarie">
 			<a href="<c:url value="/societe/${slug }/gerer-salaries/consulter-salarie/${s.salarieId }" /> ">
 				${s.etatcivile.prenom } <b>${s.etatcivile.nom }</b>
 			</a>
 		</div>
 	</c:forEach>
 	</div>
 </div>