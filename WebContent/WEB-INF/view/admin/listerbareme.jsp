<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="panel panel-default">
<div class="panel-heading">Liste de barèmes</div>
<div class="panel-body">
	<c:if test="${fn:length(baremes) > 0 }">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Nom de barème</th>
					<th>
						Nombre de tranches
					</th>
					<th colspan="3">
						
					</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${ baremes}" var="b">
					<tr>
						<td>${b.nom }</td>
						<td>${fn:length(b.tranches) }</td>
						<td>
							<a href="<c:url value="/admin/gerer-baremes/modifier/${b.baremeId}"/>" class="btn btn-success btn-sm" >
								<span class="glyphicon glyphicon-eye-open"></span> Détails
							</a>
						</td>
						<td>
							<a href="#" class="btn btn-info btn-sm" >
								<span class="fa fa-edit"></span> Modifier
							</a>
						</td>
						<td>
							<a href="#" class="btn danger btn-danger btn-sm" >
								<span class="glyphicon glyphicon-trash"></span> Supprimer
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		
		</table>
	
	</c:if>
</div>

</div>
