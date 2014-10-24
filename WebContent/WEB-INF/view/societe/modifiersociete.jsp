
<form class="form-bloc" enctype="multipart/form-data" modelAttribute="societe" action="" method="post">
<div class="titre">${societe.intituleSociete }</div>


<div class="input c1">
	<label>Intitulé de la Société : </label>
	<input type="text" placeholder="nom de la société" value="${societe.intituleSociete }" name="intituleSociete"/>
</div>
<div class="input c2">
	<label>ID fiscale : </label>
	<input type="text" placeholder="IDentifiant fiscale de la société"  value="${societe.idfiscale }"  name="idfiscale"/>
</div>
<div class="input c2">
	<label>CNSS : </label>
	<input type="text" placeholder="CNSS de la société" value="${societe.cnss }"  name="cnss"/>
</div>

<div class="input c3">
	<label>Code Tribunal : </label>
	<input type="text" placeholder="RC + Code Tribunal de la société" value="${societe.rcCodeTribunal }" name="rcCodeTribunal"/>
</div>
<div class="input c3">
	<label>FAX : </label>
	<input type="text" placeholder="Le fax de la société" value="${societe.fax }"  name="fax"/>
</div>
<div class="input c3">
	<label>Email : </label>
	<input type="text" placeholder="Adresse email de la société" value="${societe.email }"  name="email"/>
</div>
<div class="input c4">
	<label>Téléphone : </label>
	<input type="text" placeholder="N°telephonex de la société" value="${societe.telephone }" name="telephone"/>
</div>
<div class="input c4">
	<label>CIMR : </label>
	<input type="text" placeholder="N° CIMR de la société" value="${societe.cimr }" name="cimr"/>
</div>
<div class="input c4">
	<label>Mutuelle : </label>
	<input type="text" placeholder="N° Mutuelle de la société" value="${societe.mutuelle }" name="mutuelle"/>
</div>
<div class="input c4">
	<label>Patente : </label>
	<input type="text" placeholder="Patente de la société" value="${societe.patente }"  name="patente"/>
</div>
<div class="input s3">
	<label>Adresse : </label>
	<input type="text" placeholder="Adresse de la société" value="${societe.adresse }" name="adresse"/>
</div>
<div class="input c4">
	<label>Changer le Logo (Image) : </label>
	<input type="file"  name="file"/>
</div>

<div class="submit">
<input type="submit" class="btn" value="Enregistrer" />
<input type="reset" class="btn" value="annuler" />
</div>
</form>