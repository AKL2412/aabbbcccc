<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <i class="fa fa-plus-circle"></i> Ajouter une compagnie
                         </div>
                         <form role="form" action="" method="post" modelAttribute="compagnie">
                         <div class="panel-body">
                           <div class="form-group col-md-5">
                           	<label>Le nom de la compagnie : </label>
                           	<input type="text" class="form-control" name="nom" required="required" placeholder="Le nom de la compagnie">
                           </div>
                            <div class="form-group col-md-7">
                           	<label>Description : </label>
                           	<textarea class="form-control" name="description"></textarea>
                           </div>
                         </div>
                         <div class="panel-footer">
                           <input type="submit" class="btn btn-primary" value="ajouter">
                         </div>
                         </form>
                        </div>
                        </div>
                        </div>   

<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-folder-o"></i> Les compagnies
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                            <th>Intitulé de compagnie</th>
                                            <th>Description</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${compagnies }" var="c">
 											<tr>
 												<td>
 													<a href="<c:url value="/admin/gerer-baremes/les-compagnies/voir/${c.compagnieId }" />">
 														${c.nom }
 													</a>
 												</td>
 												<td>
 												<c:set var="limite" value="${c.description} "></c:set>
 												<c:if test="${fn:length(c.description) > 100 }">
 												<c:set var="limite" value="${fn:substring(c.description,0,100) }..."></c:set>
 												</c:if>
 												${limite }
 												
 												</td>
 												<td>
 												<a class="btn btn-danger btn-xs supprimer-object" action="delete" object="compagnie" objectId="${c.compagnieId }">
 												<i class="fa fa-trash"></i>
 												Supprimer</a>
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