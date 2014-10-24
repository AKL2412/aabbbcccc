<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${societe != null }">
			<div class="consultation-societe">
		
			<div class="icon">
				<div class="lien">
					<a href="<c:url value="/admin/gerer-societes/modifier/${societe.slug }" />">Modifier</a>
					<a href="#">Supprimer</a>
					<a href="<c:url value="/admin/gerer-societes/${societe.slug }/exercices" />">Exercices</a>
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
				
				<div class="input c2">
	<label>ID fiscale : </label>
	<input type="text" disabled="disabled" placeholder="IDentifiant fiscale de la société"  value="${societe.idfiscale }"  name="idfiscale"/>
</div>
<div class="input c2">
	<label>CNSS : </label>
	<input type="text" disabled="disabled" placeholder="CNSS de la société" value="${societe.cnss }"  name="cnss"/>
</div>

<div class="input c3">
	<label>Code Tribunal : </label>
	<input type="text" disabled="disabled" placeholder="RC + Code Tribunal de la société" value="${societe.rcCodeTribunal }" name="rcCodeTribunal"/>
</div>
<div class="input c3">
	<label>FAX : </label>
	<input type="text" disabled="disabled" placeholder="Le fax de la société" value="${societe.fax }"  name="fax"/>
</div>
<div class="input c3">
	<label>Email : </label>
	<input type="text" disabled="disabled" placeholder="Adresse email de la société" value="${societe.email }"  name="email"/>
</div>
<div class="input c4">
	<label>Téléphone : </label>
	<input type="text" disabled="disabled" placeholder="N°telephonex de la société" value="${societe.telephone }" name="telephone"/>
</div>
<div class="input c4">
	<label>CIMR : </label>
	<input type="text" disabled="disabled" placeholder="N° CIMR de la société" value="${societe.cimr }" name="cimr"/>
</div>
<div class="input c4">
	<label>Mutuelle : </label>
	<input type="text" disabled="disabled" placeholder="N° Mutuelle de la société" value="${societe.mutuelle }" name="mutuelle"/>
</div>
<div class="input c4">
	<label>Patente : </label>
	<input type="text" disabled="disabled" placeholder="Patente de la société" value="${societe.patente }"  name="patente"/>
</div>
<div class="input c1">
	<label>Adresse : </label>
	<input type="text" disabled="disabled" placeholder="Adresse de la société" value="${societe.adresse }" name="adresse"/>
</div>

				
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<h1>Lien Incorrect : ${slug }</h1>
	</c:otherwise>
</c:choose>

