<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <c:if test="${message }">
 <div class="message">
 <i class="fi-x"></i>
	<div>la soci�t� <strong>${compte.societe.intituleSociete }</strong> a �t� ajout� avec succ�s</div>
	<div class="c-mess">
		<label>Login :</label> ${compte.login }
	</div>
	<div class="c-mess">
		<label>Mot de passe :</label> ${pass }
	</div>
</div>
 </c:if>
<div class="panel panel-default">
	<div class="panel-heading">
	<i class="fa fa-plus-square "></i> Ajouter une soci�t�
	
	</div>
	<form role="form" enctype="multipart/form-data" modelAttribute="societe" action="" method="post">
		<div class="panel-body">
		
			<div class="form-group col-md-12 col-xs-12 col-sm-12">
				<label>Intitul� de la Soci�t� : </label>
				<input class="form-control" required="required" type="text" placeholder="nom de la soci�t�" name="intituleSociete"/>
			</div>
<div class="form-group col-md-6 col-xs-12 col-sm-6">
	<label>ID fiscale : </label>
	<input class="form-control" type="text" required="required" placeholder="IDentifiant fiscale de la soci�t�" name="idfiscale"/>
</div>
<div class="form-group col-md-6 col-xs-12 col-sm-6">
	<label>CNSS : </label>
	<input class="form-control" type="text" required="required" placeholder="CNSS de la soci�t�" name="cnss"/>
</div>

<div class="form-group col-md-3 col-xs-12 col-sm-3">
	<label>Code Tribunal : </label>
	<input class="form-control" type="text" required="required" placeholder="RC + Code Tribunal de la soci�t�" name="rcCodeTribunal"/>
</div>
<div class="form-group col-md-3 col-xs-12 col-sm-6">
	<label>FAX : </label>
	<input class="form-control" type="text" placeholder="Le fax de la soci�t�" name="fax"/>
</div>
<div class="form-group col-md-3 col-xs-12 col-sm-6">
	<label>Email : </label>
	<input class="form-control" type="text" required="required" placeholder="Adresse email de la soci�t�" name="email"/>
</div>
<div class="form-group col-md-3 col-xs-12 col-sm-6">
	<label>Ville : </label>
	<input class="form-control" type="text" required="required" placeholder="ville de la soci�t�" name="ville"/>
</div>
<div class="form-group col-md-3 col-xs-12 col-sm-6">
	<label>T�l�phone : </label>
	<input class="form-control" type="text" required="required" placeholder="N�telephonex de la soci�t�" name="telephone"/>
</div>
<div class="form-group col-md-3 col-xs-12 col-sm-3">
	<label>CIMR : </label>
	<input type="text" class="form-control" required="required" placeholder="N� CIMR de la soci�t�" name="cimr"/>
</div>
<div class="form-group col-md-3 col-xs-12 col-sm-3">
	<label>Mutuelle : </label>
	<input type="text" class="form-control" required="required" placeholder="N� Mutuelle de la soci�t�" name="mutuelle"/>
</div>
<div class="form-group col-md-3 col-xs-12 col-sm-3">
	<label>Patente : </label>
	<input class="form-control" type="text" required="required" placeholder="Patente de la soci�t�" name="patente"/>
</div>
<div class="form-group col-md-9 col-xs-12 col-sm-9">
	<label>Adresse : </label>
	<input class="form-control" type="text" required="required" placeholder="Adresse de la soci�t�" name="adresse"/>
</div>
<div class="form-group col-md-3 col-xs-12 col-sm-3">
	<label>Logo (Image) : </label>
	<input type="file" class="form-control" required="required" name="file"/>
</div>
		
		</div>
		<div class="panel-footer">
		<input type="submit" class="btn btn-primary" value="Enregistrer" />
		<input type="reset" class="btn btn-default" value="annuler" />
		</div>
	</form>
</div>