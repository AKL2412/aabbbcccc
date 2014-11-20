<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
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
						  <li class="active">Barèmes</li>
						 <li   >
						 <a href="<c:url value="/societe/${slug }/gerer-salaries/avances-salarie/${salarie.salarieId }" /> ">
						  Avances
						  </a>
						 </li>
						 <li><a href="<c:url value="/societe/${slug }/gerer-salaries/commissions-salarie/${salarie.salarieId }" /> ">commissions</a></li>
						 <li><a href="<c:url value="/societe/${slug }/gerer-salaries/primes-salarie/${salarie.salarieId }" /> ">Primes</a></li>
						<li><a href="<c:url value="/societe/${slug }/gerer-salaries/etat-cotisation-salarie/${salarie.salarieId }" /> ">Etat cotisation</a></li>
						</ol>
					</div>
					
				</div>
				
			</div>
 
 </div>
 <br>
<div class="rows">
<c:if test="${!salarie.baremeAjour() }">

	 <div class="panel panel-danger">
 	<div class="panel-heading">
 		<h3>
 		<i class="fa fa-warning"></i>
 		Affecter les barèmes obligatoires
 		</h3>
 	</div>
 	<div class="panel-body">
 	<table class="table table-striped table-bordered table-hover">
 		<thead>
          <tr>
            <th>Nom de barèmes</th>
            <th>Compagnie</th>
            <th>Code</th>
            <th></th>
         </tr>
       </thead>
      <tbody>
        <c:forEach items="${baremesO }" var="b">
        
 		<c:if test="${! salarie.possederBareme(b.societebaremeId) }">
 			<tr>
	 			<td> ${b.bareme.nom }</td>
	 			<td>${b.bareme.compagnie.nom }</td>
	 			<td> <input class="form-control" type="text" id="codesalariebareme-${b.societebaremeId }" placeholder="Le code du salarie"></td>
	 			<td>
	 				<a class="btn btn-success supprimer-object" input="codesalariebareme-${b.societebaremeId }" action="update" object="salariebareme" objectId="0" salarie="${salarie.salarieId }"
	 				bareme="${b.societebaremeId }">Affecter</a>
	 			</td>
 		</tr>
 		</c:if>
 		</c:forEach>
      </tbody>
    </table>
 	</div>
 </div>
 
 
</c:if>
 
  <div class="panel panel-info">
 	<div class="panel-heading">
 	<i class="fa fa-cubes"></i>
 		Les Barèmes de  ${salarie.etatcivile.prenom}  <strong>${salarie.etatcivile.nom}</strong>
 		
 		<a class="btn btn-primary btn-xs ajout-bareme" slug="${salarie.societe.slug }" salarie="${salarie.salarieId }" style="float: right">
 			Affecter un barème au salarie 
 		</a>
 		
 	</div>
 	<div class="panel-body">
 		<c:if test="${fn:length(salarie.salariebaremes)>0 }">
 			<div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                        	<th>Nom du barème</th>
                                        	<th>Compagnie</th>
                                        	<th>Caractère du barème</th>
                                        	<th>Code</th>
                                        	<th></th>
                                        	
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${salarie.salariebaremes }" var="sb">
 											<tr>
 												<td>
 													<a href="#" class="voir-boite-modale" url="<c:url value="/societe/${salarie.societe.slug }/gerer-bareme/voir-detail-un-bareme/${sb.societebareme.bareme.baremeId }" />" >
 													${sb.societebareme.bareme.nom }
 													</a>
 												</td>
 												<td>${sb.societebareme.bareme.compagnie.nom }</td>
 												<td>${sb.societebareme.bareme.caractere }</td>
 												<td>${sb.salarieId }</td>
 												<td>
 												<a class="btn btn-danger btn-xs supprimer-object" action="delete" object="salariebareme" objectId="${sb.salariebaremeId }" >
 													<i class="fa fa-trash"></i>
 													Supprimer
 												</a>
 												</td>
 											</tr>
 										</c:forEach>
                                    </tbody>
                                  </table>
                                 </div>
 		
 		</c:if>
 	</div>
 </div>
 </div>
    <script>
    $(document).ready(function() {
        $('#dataTables').dataTable();

        $.each($('a.ajout-bareme'), function(index, val) {
   		 var btn = $(val);
   		 btn.click(function(event) {
   		 	var btn = $(this);
   		 	var id = btn.attr('salarie');
   		 	var main = boxAlert();
   		 	var url = getRacine()+'/societe/'+btn.attr('slug')+'/gerer-salaries/ajout-bareme-optionnel/'+id;
   		 	//alert(url);
   		 	//return true;
   		 	$.ajax({
   		 		url: url,
   		 		type: 'GET',
   		 		dataType: 'html',
   		 		data: {},
   		 	})
   		 	.done(function(data) {
   		 		main.html(data);
   		 	})
   		 	.fail(function() {
   		 		console.log("error");
   		 	}).always(function() {console.log("complete");});
   		 	
   		 	
   		 });
   	});
    });
    </script>