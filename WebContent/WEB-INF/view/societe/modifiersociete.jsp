
<form class="form-bloc" enctype="multipart/form-data" modelAttribute="societe" action="" method="post">
<div class="titre">${societe.intituleSociete }</div>

<div class="row">
<div class="input form-group col-md-12">
	<label>Intitulé de la Société : </label>
	<input type="text" placeholder="nom de la société" value="${societe.intituleSociete }" class="form-control" name="intituleSociete"/>
</div>
<div class="input form-group col-md-6">
	<label>ID fiscale : </label>
	<input type="text" placeholder="IDentifiant fiscale de la société"  value="${societe.idfiscale }"  class="form-control" name="idfiscale"/>
</div>
<div class="input form-group col-md-6">
	<label>CNSS : </label>
	<input type="text" placeholder="CNSS de la société" value="${societe.cnss }"  class="form-control" name="cnss"/>
</div>

<div class="input form-group col-md-4">
	<label>Code Tribunal : </label>
	<input type="text" placeholder="RC + Code Tribunal de la société" value="${societe.rcCodeTribunal }" class="form-control" name="rcCodeTribunal"/>
</div>
<div class="input form-group col-md-4">
	<label>FAX : </label>
	<input type="text" placeholder="Le fax de la société" value="${societe.fax }"  class="form-control" name="fax"/>
</div>
<div class="input form-group col-md-4">
	<label>Email : </label>
	<input type="text" placeholder="Adresse email de la société" value="${societe.email }"  class="form-control" name="email"/>
</div>
<div class="input form-group col-md-3">
	<label>Téléphone : </label>
	<input type="text" placeholder="N°telephonex de la société" value="${societe.telephone }" class="form-control" name="telephone"/>
</div>
<div class="input form-group col-md-3">
	<label>CIMR : </label>
	<input type="text" placeholder="N° CIMR de la société" value="${societe.cimr }" class="form-control" name="cimr"/>
</div>
<div class="input form-group col-md-3">
	<label>Mutuelle : </label>
	<input type="text" placeholder="N° Mutuelle de la société" value="${societe.mutuelle }" class="form-control" name="mutuelle"/>
</div>
<div class="input form-group col-md-3">
	<label>Patente : </label>
	<input type="text" placeholder="Patente de la société" value="${societe.patente }"  class="form-control" name="patente"/>
</div>
<div class="input form-group col-md-4">
	<label>Ville: </label>
	<input type="text"  class="form-control" name="ville" value="${societe.ville }"/>
</div>
<div class="input form-group col-md-5">
	<label>Changer le Logo (Image) : </label>
	<input type="file"  class="form-control" name="file"/>
</div>
<div class="input form-group col-md-12">
	<label>Adresse : </label>
	<textarea class="form-control" name="adresse">
		${societe.adresse }
	</textarea>
</div>
</div>

<div class="row">
	<div class="container">
		<input type="submit" class="btn btn-default" value="Enregistrer" />
<input type="reset" class="btn btn-default" value="annuler" />
	</div>
</div>
</form>