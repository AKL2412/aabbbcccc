<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${salarie != null }">
	
	 <c:if test="${message }">
 <div class="message">
 <i class="fi-x"></i>
	
</div>
 </c:if>

<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Modification </h3>
  </div>

<form role="form" enctype="multipart/form-data"
modelAttribute="etatcivil" 
modelAttribute="immatriculation" 
modelAttribute="coordonneebancaire" 
modelAttribute="paie"
modelAttribute="poste"
modelAttribute="affectation"
action="" method="post">

<div class="panel-body">
<fieldset>
<legend>Etat civil :</legend>
<input type="number" value="${etatcivil.etatcivileId }" name="etatcivileId" hidden="hidden">
<div class="input c2">
	<label>Nom : </label>
	<input type="text" value="${etatcivil.nom }" placeholder="nom du salarié" name="nom"/>
</div>
<div class="input c2">
	<label>Prenom: </label>
	<input type="text"  value="${etatcivil.prenom }" placeholder="prenom du salarié" name="prenom"/>
</div>
<div class="input c3">
	<label>Matricule : </label>
	<input type="text"  value="${etatcivil.matricule }" placeholder="matricule du salarié" name="matricule"/>
</div>
<div class="input c3">
	<label>Situation familiale : </label>
	<input type="text"  value="${etatcivil.situationfamiliale }" placeholder="situation familiale du salarié" name="situationfamiliale"/>
</div>
<div class="input c3">
	<label>Sexe : </label>

	<select name="civilite">
		<option value="homme">Homme</option>
		<option value="femme">Femme</option>
	</select>
</div>

</fieldset>
<br>
<fieldset>
<legend>Immatriculation :</legend>
<input type="number" value="${immatriculation.immatriculationId }" name="immatriculationId" hidden="hidden">
<div class="input c4">
	<label>CIN : </label>
	<input type="text" placeholder="cin du salarié" name="cin" value="${immatriculation.cin }"/>
</div>

<div class="input c4">
	<label>CNSS : </label>
	<input type="text" placeholder="cnss du salarié" name="cnss" value="${immatriculation.cnss }"/>
</div>
<div class="input c4">
	<label>Pays: </label>
	<input type="text" placeholder="pays du salarié" name="pays" value="${immatriculation.pays }"/>
</div>
<div class="input c4">
	<label>Date de naissance: </label>
	<input type="date" placeholder="date denaissance du salarié" value="${immatriculation.datenaissance }" name="_datenaissance"/>
</div>

<div class="input c2">
	<label>Email : </label>
	<input type="text" placeholder="email du salarié" name="mail" value="${immatriculation.mail }"/>
</div>
<div class="input c2">
	<label>ville: </label>
	<input type="text" placeholder="ville du salarié" name="ville" value="${immatriculation.ville }"/>
</div>
<div class="input s3">
	<label>Adresse: </label>
	<input type="text" placeholder="adresse du salarié" name="adresse" value="${immatriculation.adresse }"/>
</div>
<!-- <div class="input c4"> -->
<!-- 	<label>Photo: </label> -->
<!-- 	<input type="file"  name="file" placeholder="file"/> -->
<!-- </div> -->
</fieldset>
<br>
<fieldset>
<legend>Coordonnées bancaires :</legend>

<input type="number" value="${coordonneebancaire.coordoneebancaireId }" name="coordoneebancaireId" hidden="hidden">
<div class="input c2">
	<label>Banque: </label>
	<input type="text" placeholder="banque du salarié" name="banque" value="${coordonneebancaire.banque }"/>
</div>

<div class="input c2">
	<label>Agence : </label>
	<input type="text" placeholder="agence bancaire" name="agence" value="${coordonneebancaire.agence }"/>
</div>


<div class="input c2">
	<label>Compte : </label>
	<input type="text" placeholder="compte du salarié" name="compte" value="${coordonneebancaire.compte }"/>
</div>
<div class="input c2">
	<label>Libelle compte: </label>
	<input type="text" placeholder="libelle de compte du salarié" name="libellecompte" value="${coordonneebancaire.libellecompte }"/>
</div>
</fieldset>
<br>
<fieldset>
<legend>Poste :</legend>
<input type="number" value="${poste.posteId }" name="posteId" hidden="hidden">
<div class="input c2">
	<label>Date d'embauche : </label>
	<input type="date"  name="_dateembauche" value="${poste.dateembauche }"/>
</div>
<fieldset>
<legend>Affectation : </legend>
<input type="number" value="${affectation.affectationId }" name="affectationId" hidden="hidden">
<div class="input c2">
	<label>Département : </label>
	<input type="text" placeholder="departement" name="departement" value="${affectation.departement }"/>
</div>
<div class="input c2">
	<label> service: </label>
	<input type="text" placeholder="service du salarié" name="service" value="${affectation.service }"/>
</div>

</fieldset>
</fieldset>
<br>
<fieldset>
	<legend>Contrat : </legend>
	<input type="number" value="${contrat.contratId }" name="contratId" hidden="hidden">
	<div class="input c3">
		<label>Date de debut : </label>
		<input type="date"  name="_datedebut" value="${contrat.datedebut }"/>
	</div>
	<div class="input c3">
		<label>Date de fin : </label>
		<input type="date"  name="_datedefin" value="${contrat.datedefin }"/>
	</div>
	<div class="input c3">
		<label>Date de fin de la periode d'éssai : </label>
		<input type="date"  name="_datedefinperiodeessai" value="${contrat.datedefinperiodeessai }"/>
	</div>
	<div class="input c2">
		<label>Intitulé de l'emploi : </label>
		<input type="text"  placeholder="Intitulé de l'emploi" name="intituleemploi" value="${contrat.intituleemploi }"/>
	</div>
	<div class="input c2">
		<label>Nature du contrat: </label>
		<input type="text"  placeholder="Nature du contrat" name="nature" value="${contrat.nature }"/>
	</div>
	
	<div class="input c2">
	<label> Salaire brute: </label>
	<input type="number" placeholder="salaire brute du salarié" name="salairebrute"  value="${contrat.salairebrute }"/>
</div>
<div class="input c2">
	<label> Salaire de base: </label>
	<input type="number" placeholder="salaire de base du salarié" name="salairedebase"  value="${contrat.salairedebase }"/>
</div>

</fieldset>
<br>
<fieldset>
<legend>La paie :</legend>

<div class="input c1">
	<label>Mode de payement : </label>
	<input type="text" placeholder="mode de payement" name="modepayement" value="${paie.modepayement}"/>
</div>
<!-- <div class="input c3"> -->
<!-- 	<label> Salaire brute: </label> -->
<!-- 	<input type="number" placeholder="salaire brute du salarié" name="salairebrute"/> -->
<!-- </div> -->
<!-- <div class="input c3"> -->
<!-- 	<label> Salaire de base: </label> -->
<!-- 	<input type="number" placeholder="salaire de base du salarié" name="salairedebase"/> -->
<!-- </div> -->
</fieldset>

</div>
<div class="panel-footer">
 
<input type="submit" class="btn btn-primary" value="Enregistrer" />
<input type="reset" class="btn btn-danger" value="annuler" />

</div>

</form>
	 
</div>
	</c:when>
	<c:otherwise>
		Erreur
	</c:otherwise>
</c:choose>