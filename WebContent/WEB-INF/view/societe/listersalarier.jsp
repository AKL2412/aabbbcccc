<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

  
 <div class="row">

                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Les salariés
                            <a class="btn btn-default btn-xs" style="float: right" href="<c:url value="/societe/${scte.slug }/gerer-salaries/ajouter"/>">
												<i class="fa fa-plus-square"></i> Ajouter un salarié
											</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                        	<th></th>
                                            <th>Nom et prénoms</th>
                                            <th>Matricule</th>
                                            <th>CIN</th>
                                            <th>CNSS</th>
                                            <th>Date naissance</th>
                                            <th>Service</th>
                                            <th>Département</th>
                                            <th>Contrat</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${scte.salaries }" var="s">
 											<tr>
 												<td>
 													<img width="20" style="border-radius:5px" src="<c:url value="/documents/${s.profil() }"/>" />
 							
 												</td>
 												<td> 
 													<a href="<c:url value="/societe/${slug }/gerer-salaries/consulter-salarie/${s.salarieId }" /> "> 
 														${s.etatcivile.nom } ${s.etatcivile.prenom }
 													</a>
 												</td>
 												<td>
 													${s.etatcivile.matricule }
 												</td>
 												<td>
 													${s.immatriculation.cin }
 												</td>
 												<td>
 													${s.immatriculation.cnss }
 												</td>
 												<td>
 													${s.immatriculation.datenaissance }
 												</td>
 												<td>
 													${s.poste.affectation.service }
 												</td>
 												<td>
 													${s.poste.affectation.departement }
 												</td>
 												<td>
 													${s.contrat.nature }
 												</td>
 											</tr>
 										</c:forEach>
                                    </tbody>
                                  </table>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
 
      
            <script>
    $(document).ready(function() {
        $('#dataTables').dataTable();
    });
    </script>