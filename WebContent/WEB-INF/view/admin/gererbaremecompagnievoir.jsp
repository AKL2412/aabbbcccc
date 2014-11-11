<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
	<c:when test="${compagnie != null }">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h1>${compagnie.nom }</h1>
			</div>
			<div class="panel-body text-justify">
				${compagnie.description }
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-cog"></i> Les barèmes [${fn:length(compagnie.baremes) }]
				
				<a class="btn btn-primary btn-xs" style="float: right" href="<c:url value="/admin/gerer-baremes/creer/${compagnie.compagnieId}" />" >
					Ajouter un nouveau barème
				</a>
			</div>
			<div class="panel-body">
			<c:if test="${fn:length(compagnie.baremes) > 0 }">
			<div class="table-responsive">
			
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                            <th>nom</th>
                                            <th>caractere</th>
                                            <th>type</th>
                                             <th>tranche</th>
                                             <th>description</th>
                                             <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${compagnie.baremes }" var="c">
 											<tr>
 												<td>
 													<a href="<c:url value="/admin/gerer-baremes/voir/${c.baremeId}"/> ">
 														${c.nom }
 													</a>
 												</td>
 												<td>
 													${ c.caractere}
 												</td>
 												<td>
 													${c.type }
 												</td>
 												<td>
 													${c.tranche }
 												</td>
 												<td>
 													
 													<c:set var="limite" value="${c.description} "></c:set>
 												<c:if test="${fn:length(c.description) > 100 }">
 												<c:set var="limite" value="${fn:substring(c.description,0,100) }..."></c:set>
 												</c:if>
 												${limite }
 												
 												</td>
 												<td>
 													<a class="btn btn-danger btn-xs supprimer-object" action="delete" object="bareme" objectId="${c.baremeId }">
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
	</c:when>
	<c:otherwise>
		
		<div class="alert alert-danger col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
			Erreur d'identifiant
		</div>
	</c:otherwise>

</c:choose>
        <script>
    $(document).ready(function() {
        $('#dataTables').dataTable();
    });
    </script>
