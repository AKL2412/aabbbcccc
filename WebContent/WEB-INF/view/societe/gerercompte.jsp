<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${ compte.role.num == 2 }">
		
		<c:if test="${fn:length(societe.utilisateurs) > 0  }">
		<table  class="table table-bordered table-striped table-condensed">
				<thead>
					<tr>
						<th>Numero</th>
						<th>Login du compte</th>
						<th colspan="2">Statut</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${scte.utilisateurs }" var="c" varStatus="stat">
					
					<tr>
					<td>${stat.index + 1 }</td>
						<td>${c.login }</td>
						<td>${c.role.detail }</td>
						<td> 
							<c:if test="${ c.role.num != 2 }">
								<a class="btn btn-danger btn-xs supprimer-object" object="utilisateur" objectId="${c.utilisateurId }"> 
								<i class="fa-trash-o fa"></i> supprimer
							</a>
							</c:if>
							
						</td>
					</tr>
					</c:forEach>
					</tbody>
					</table>
		</c:if>
		
		<div class="add-compte">
			
			<div class="formulaire">
			<div>${message }</div>
				<form
				modelAttribute="utilisateur" 
				 action="<c:url value="/societe/${societe.slug}/gerer-societe/comptes/ajouter"/> " method="post">
					<fieldset>
						<legend>Ajouter un nouveau compte</legend>
						<div class="input s3">
						<label>Login : <img id="login-veri" src="<c:url value="/sources/img/loaderf.gif"/>" width="15"/></label>
						<input type="text" required="required" id="login" placeholder="Login" name="login"/>
						
					</div>
					<div class="input c3">
						<label>Mot de passe :</label>
						<input type="password" required="required" placeholder="Mot de passe" name="motdepasse"/>
						
					</div>
					<div class="input c3">
						<label>Confirmation mot de passe :</label>
						<input type="password" required="required" placeholder="Conformation de mot de passe" name="_motdepasse"/>
						
					</div>
					<div class="valider">
					
						<input type="submit" value="Enregistrer" class="btn btn-primary" >
						<input type="reset" value = "Annuler" class="btn btn-primary">
					</div>
					</fieldset>
				</form>
			</div>
		</div>
	</c:when>
	<c:otherwise>
	un compte ajouter
	</c:otherwise>

</c:choose>
<script>
jQuery(document).ready(function($) {
	$('#login-veri').hide();
	$('.valider input').attr('disabled','disabled');
	$('#login').blur(function(e){
		var text = $(this).val();
		if(text != ''){
			$('#login-veri').show();
			$('.valider input').removeAttr('disabled');
			$.post('/GestPaie/verifier-login', {login:text}, function(data, textStatus, xhr) {
				
				if(data == 'ok'){
					$('#login').css('border','1px solid green');
					$('.valider input').removeAttr('disabled');
					$('#login-veri').hide();
					}else{
						$('.valider input').attr('disabled','disabled');
						$('#login').css('border','1px solid red');
						$('#login-veri').hide();
						}
				
			});
			}

		});
});
</script>