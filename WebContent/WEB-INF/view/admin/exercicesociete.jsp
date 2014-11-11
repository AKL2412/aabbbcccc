<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

			<div class="consultation-societe">
		
			<div class="icon">
				<div class="lien">
					<a href="<c:url value="/admin/gerer-societes/modifier/${societe.slug }" />">Modifier</a>
					<a href="#">Supprimer</a>
					<a class="active" href="<c:url value="/admin/gerer-societes/${societe.slug }/baremes" />">Barèmes</a>
					<a href="#">Salariés</a>
				</div>
				<div class="nom">
					${societe.intituleSociete }
				</div>
				<div class="image">
					<img src="<c:url value="/documents/${societe.lienLogo() }"/>"/>
				</div>
				
			</div>
			<div class="detail">
				<div class="add-exo">
					<div class="buttons">
					<button class="btn btn-primary btn-xs" id="btn-add">Affecter un barème </button>
					</div>
					<div class="block-form">
					<form class="form-blocd" id="form-add-bareme">
					<input type="text" value="${societe.slug }" id="societe-slug" hidden="hidden"> 
					<c:if test="${message != null}">
						<div class="message">
							<i class="fi-x"></i>
								${message }
							</div>
					</c:if>
						<div class="form-group col-md-6">
							<label>Compagnie : </label>
							<select class="form-control" id="select-compagnie" required="required">
								<option value>Compagnie</option>
								<c:forEach items="${compagnies }" var="com">
									<option value="${com.compagnieId }">${com.nom } </option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-md-6">
							<label>Barèmes : </label>
							<select class="form-control" id="select-bareme" required="required">
								<option value>Barème</option>
							</select>
						</div>
						
						<div class="submit">
							<input type="submit" value="Affecter" class="btn btn-default">
						</div>
					</form>
					</div>
				</div>
			
				
				
				<c:if test="${fn:length(societe.societebaremes) > 0 }">
				
					<div class="table-responsive">
			
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                        <tr>
                                            <th>nom</th>
                                            <th>caractere</th>
                                            <th>type</th>
                                             <th>tranche</th>
                                             <th>description</th>
                                             <th>Compagnie</th>
                                             <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${societe.societebaremes }" var="c">
 											<tr>
 												<td>
 													<a href="<c:url value="/admin/gerer-baremes/voir/${c.bareme.baremeId}"/> ">
 														${c.bareme.nom }
 													</a>
 												</td>
 												<td>
 													${ c.bareme.caractere}
 												</td>
 												<td>
 													${c.bareme.type }
 												</td>
 												<td>
 													${c.bareme.tranche }
 												</td>
 												<td>
 													
 													<c:set var="limite" value="${c.bareme.description} "></c:set>
 												<c:if test="${fn:length(c.bareme.description) > 100 }">
 												<c:set var="limite" value="${fn:substring(c.bareme.description,0,100) }..."></c:set>
 												</c:if>
 												${limite }
 												
 												</td>
 												<td>${c.bareme.compagnie.nom }</td>
 												<td>
 													<a class="btn btn-danger btn-xs supprimer-object" action="delete" object="societebareme" objectId="${c.societebaremeId }">
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

<script type="text/javascript">
jQuery(document).ready(function($) {
	$('#dataTables').dataTable();
	$('.block-form').hide();
	$('#btn-add').click(function(event) {
		$('.block-form').toggle(200);
	});
	$('#select-compagnie').change(function(){
	var url = getRacine()+"/admin/gerer-societes/ajout-bareme";
	var datas = {
			action : 'getBareme',
			compagnieId:$(this).val(),
			slug:$('#societe-slug').val()}
	$.post(url, datas, function(data, textStatus, xhr) {
		//alert(data)
		$('#select-bareme').html(data);
	});
		});

	$('#form-add-bareme').submit(function(event) {
		/* Act on the event */
		event.preventDefault();

		var url = getRacine()+"/admin/gerer-societes/ajout-bareme";
		var datas = {
				action : 'addBareme',
				baremeId:$('#select-bareme').val(),
				slug:$('#societe-slug').val()
				}
		$.post(url, datas, function(data, textStatus, xhr) {
			//alert(data)
			notifier(data,true);
		});
		
	});
});
</script>

