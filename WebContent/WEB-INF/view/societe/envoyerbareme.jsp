<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <div class="row">
 	<div class="container">
 		<div class="boitemessage-send col-md-8 col-md-offset-2" >
 			<div class="row">
 			<form role="form" method="post" modelAttribute = "message">
 				<div class="panel panel-default">
 				
 				<div class="panel-heading">
 					<div class=" row" >
 					
 					<div class="form-group col-md-4" >
 						<select id="select-type" class="form-control" required="required" name="propbareme">
 							<option value>Type de message</option>
 							<option value="0">Un message</option>
 							<option value="1">Un barème</option>
 						</select>
 					</div>
 					<div class="label label-default" style="float: right">
 						<i class="fa fa-send-o"></i> Envoyer un message
 					</div>
 					
 					
 					</div>
 				</div>
 				<div class="panel-body" id="box-contenu">
 				

 				
 				
 				</div>
 				<div class="panel-footer">
 					
 					<button type="submit" class="btn btn-primary">
 					<i class="fa fa-send"></i> Envoyer
 					</button>
 				</div>
 				
 			</div>
 			</form>
 			</div>
 		</div>
 	</div>
 </div>
 <!--  					un Bareme  -->
 				<div id="unBareme" class="contenuMessage">
 					<div class="form-group col-md-12">
 						<label>Nom du barème : </label>
 						<input type="text" required="required" name="objet" class="form-control" placeholder="Nom du barèmee">
 					</div>
 					<div id="add-tranche">
 						
 					</div>
 					<div class="form-group col-md-12">
 						<label>Description du barème: </label>
 						<textarea name="description" rows="7" class="form-control" required="required"></textarea>
 					</div>
 				</div>
 				
<!--  				Un message -->
				<div id="unMessage" class="contenuMessage">
 					<div class="form-group col-md-12">
 						<label>Objet : </label>
 						<input type="text" required="required" name="objet" class="form-control" placeholder="Objet du message">
 					</div>
 					<div class="form-group col-md-12">
 						<label>Message : </label>
 						<textarea name="message" rows="7" class="form-control" required="required"></textarea>
 					</div>
 				</div>
 				
 <script src="<c:url value="/sources/js/sendmessage.js"/>" ></script>