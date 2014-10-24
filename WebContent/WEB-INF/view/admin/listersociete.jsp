<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 > <i class="fa fa-book"></i> Les sociétés</h1>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                        	<th></th>
                                            <th>Intitulé de société</th>
                                            <th>E-mail</th>
                                            <th>Téléphone</th>
                                            <th>CNSS</th>
                                            <th>Patente</th>
                                            <th>Ville</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${societes }" var="s">
 											<tr>
 												<td>
 													<img width="20" style="border-radius:5px" src="<c:url value="/documents/${s.lienLogo() }"/>" />
 							
 												</td>
 												<td> 
 													<a href="<c:url value="/admin/gerer-societes/${s.slug }" /> "> 
 														${s.intituleSociete }
 													</a>
 												</td>
 												<td>
 													${s.email }
 												</td>
 												<td>
 													${s.telephone }
 												</td>
 												<td>
 													${s.cnss }
 												</td>
 												<td>
 													${s.patente }
 												</td>
 												<td>
 													${s.ville }
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