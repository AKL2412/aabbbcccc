<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <c:if test="${message }">
 <div class="message alert">
 <i class="fi-x"></i>
	
</div>
 </c:if>
<div class="panel panel-success">
	<div class="panel-heading"><h1> <i  class="fa fa-plus-circle"></i> Ajouter un salari�</div></h1>
	<form role="form" enctype="multipart/form-data"
modelAttribute="etatcivil" 
modelAttribute="immatriculation" 
modelAttribute="coordonneebancaire" 
modelAttribute="paie"
modelAttribute="poste"
modelAttribute="affectation"
action="" method="post" role="form">

	<div class="panel-body">
	
<!-- 	Etat civil -->
	<div class="panel panel-default">
	<div class="panel-heading"> <div class="badge">Etat civil </div> </div>
		
			<div class="panel-body">
				<div class="col-md-6 col-sm-6 col-xs-12 form-group">
					<label>Nom : </label>
					<input required="required" class="form-control" type="text" placeholder="nom du salari�" name="nom"/>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12 form-group">
					<label>Prenom: </label>
					<input type="text" required="required" class="form-control" placeholder="prenom du salari�" name="prenom"/>
				</div>
				<div class="col-md-4 col-sm-5 col-xs-12 form-group">
					<label>Matricule : </label>
					<input type="text" required="required" class="form-control" placeholder="matricule du salari�" name="matricule"/>
				</div>
				<div class="col-md-4 col-sm-5 col-xs-12 form-group">
					<label>Situation familiale : </label>
					<input type="text" required="required" class="form-control" placeholder="situation familiale du salari�" name="situationfamiliale"/>
				</div>
				<div class="col-md-4 col-sm-2 col-xs-12 form-group">
					<label>Sexe : </label>
				
					<select name="civilite" class="form-control" required="required">
					<option value>Sexe..</option>
						<option value="homme">Homme</option>
						<option value="femme">Femme</option>
					</select>
				</div>
				
		
			</div>
		</div>
<!-- 		Fin etat civil -->
<!-- 	Immatriculation -->
<div class="panel panel-default">
<div class="panel-heading"> <div class="badge">Immatriculation </div> </div>
	<div class="panel-body">	
				<div class=" col-md-3 col-ms-6 col-xs-12 form-group">
					<label>CIN : </label>
					<input type="text" required="required" class="form-control" placeholder="cin du salari�" name="cin"/>
				</div>
				
				<div class="col-md-3 col-ms-6 col-xs-12 form-group">
					<label>CNSS : </label>
					<input type="text" required="required" class="form-control" placeholder="cnss du salari�" name="cnss"/>
				</div>
				<div class="col-md-3 col-ms-6 col-xs-12 form-group">
					<label>Pays: </label>
					<input type="text" required="required" class="form-control" placeholder="pays du salari�" name="pays"/>
				</div>
				<div class="col-md-3 col-ms-6 col-xs-12 form-group">
					<label>Date de naissance: </label>
					<input type="date" required="required" class="form-control" placeholder="date denaissance du salari�" name="_datenaissance"/>
				</div>
				
				<div class="col-md-6 col-ms-6 col-xs-12 form-group">
					<label>Email : </label>
					<input type="text" required="required" class="form-control" placeholder="email du salari�" name="mail"/>
				</div>
				<div class="col-md-6 col-ms-6 col-xs-12 form-group">
					<label>ville: </label>
					<input type="text" required="required" class="form-control" placeholder="ville du salari�" name="ville"/>
				</div>
				<div class="col-md-8 col-ms-8 col-xs-12 form-group">
					<label>Adresse: </label>
					<input type="text" required="required" class="form-control" placeholder="adresse du salari�" name="adresse"/>
				</div>
				<div class="col-md-4 col-ms-4 col-xs-12 form-group">
					<label>Photo: </label>
					<input type="file" required="required" class="form-control" name="file" placeholder="file"/>
				</div>
		
			</div>
		</div>
	<!-- fin immatriculation -->
<!-- 	coordonn�es bancaire -->
<div class="panel panel-default">
	<div class="panel-heading"> <div class="badge">Coordonn�es bancaires </div> </div>
		
	<div class="panel-body">
			<div class="col-md-6 col-ms-6 col-xs-12 form-group">
				<label>Banque: </label>
				<input type="text" required="required" class="form-control" placeholder="banque du salari�" name="banque"/>
			</div>
			
			<div class="col-md-6 col-ms-6 col-xs-12 form-group">
				<label>Agence : </label>
				<input type="text" required="required" class="form-control" placeholder="agence bancaire" name="agence"/>
			</div>
			
			
			<div class="col-md-6 col-ms-6 col-xs-12 form-group">
				<label>Compte : </label>
				<input type="text" required="required" class="form-control" placeholder="compte du salari�" name="compte"/>
			</div>
			<div class="col-md-6 col-ms-6 col-xs-12 form-group">
				<label>Libelle compte: </label>
				<input type="text" required="required" class="form-control" placeholder="libelle de compte du salari�" name="libellecompte"/>
			</div>
		
			
	</div>
	
	</div>
<!-- fin coordonn�es bancaire -->
<!-- Poste -->
<div class="panel panel-default">
	<div class="panel-heading"> <div class="badge"> Poste</div> </div>
		
	<div class="panel-body">
		
			<br>
				<div class="panel panel-default">
				<div class="panel-heading"> <div class="badge">Affectation </div> </div>
					
						<div class="panel-body">
						
					<div class="col-md-6 col-ms-6 col-xs-12 form-group">
						<label>D�partement : </label>
						<input type="text" required="required" class="form-control" placeholder="departement" name="departement"/>
					</div>
					<div class="col-md-6 col-ms-6 col-xs-12 form-group">
						<label> service: </label>
						<input type="text" required="required" class="form-control" placeholder="service du salari�" name="service"/>
					</div>
					
						
					</div>
				
				</div>
				<div class="col-md-6 col-ms-6 col-xs-12 form-group">
			<label>Date d'embauche : </label>
			<input type="date" required="required" class="form-control"  name="_dateembauche"/>
		</div>
		
			
	</div>
	
	</div>
<!-- fin poste -->
<!-- contrat -->
<div class="panel panel-default">
	<div class="panel-heading"> <div class="badge">Contrat </div> </div>
		
	<div class="panel-body">
			
		<div class="col-md-4 cold-ms-4 col-xs-12 form-group">
		<label>Date de debut : </label>
				<input type="date" required="required" class="form-control"  name="_datedebut"/>
			</div>
			<div class="col-md-4 cold-ms-4 col-xs-12 form-group">
				<label>Date de fin : </label>
				<input type="date" required="required" class="form-control"  name="_datedefin"/>
			</div>
			<div class="col-md-4 cold-ms-4 col-xs-12 form-group">
				<label>Date de fin de la periode d'�ssai : </label>
				<input type="date" required="required" class="form-control" name="_datedefinperiodeessai"/>
			</div>
			<div class="col-md-6 cold-ms-6 col-xs-12 form-group">
				<label>Intitul� de l'emploi : </label>
				<input type="text" required="required" class="form-control" placeholder="Intitul� de l'emploi" name="intituleemploi"/>
			</div>
			<div class="col-md-6 cold-ms-6 col-xs-12 form-group">
				<label>Nature du contrat: </label>
				<input type="text" required="required" class="form-control"  placeholder="Nature du contrat" name="nature"/>
			</div>
			
	</div>
	
	</div>

<!-- fin contrat -->
<!-- La paie -->
<div class="panel panel-default">
	<div class="panel-heading"> <div class="badge"> La paie</div> </div>
		
			<div class="panel-body">
			
		<div class="col-md-4 cold-ms-4 col-xs-12 form-group">
	<label>Mode de payement : </label>
	<input type="text" required="required" class="form-control"  placeholder="mode de payement" name="modepayement"/>
</div>
<div class="col-md-4 cold-ms-4 col-xs-12 form-group">
	<label> Salaire brute: </label>
	<input type="number" required="required" class="form-control"  placeholder="salaire brute du salari�" name="salairebrute"/>
</div>
<div class="col-md-4 cold-ms-4 col-xs-12 form-group">
	<label> Salaire de base: </label>
	<input type="number" required="required" class="form-control"  placeholder="salaire de base du salari�" name="salairedebase"/>
</div>
			
		</div>
	
	</div>
<!-- fin La paie -->
	</div>
	<!--  
	<div class="panel panel-default">
	<div class="panel-heading"> <div class="badge"> </div> </div>
		
			<div class="panel-body">
			
		
			
		</div>
	
	</div>
	-->
	
	
	<div class="panel-footer">
	<input type="submit" class="btn btn-success" value="Enregistrer" />
<input type="reset" class="btn btn-warning" value="annuler" />
	</div>
	</form>
</div>

