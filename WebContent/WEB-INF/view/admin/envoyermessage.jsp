<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <div class="row">
 	<div class="container">
 		<div class="boitemessage-send col-md-8 col-md-offset-2" >
 			<div class="row">
 			<c:if test="${message != null }">
 				<div class="alert alert-info">
 					${message }
 				</div>
 			</c:if>
 			<form role="form" method="post" modelAttribute = "message" enctype="multipart/form-data">
 				<div class="panel panel-default">
 				
 				<div class="panel-heading">
 					<h3>
 						<i class="fa fa-envelope"></i>
 						Envoi de message
 					</h3>
 				</div>
 				<div class="panel-body" id="box-contenu">
 					<div id="unMessage" class="contenuMessage">
 					<div class="form-group col-md-12">
 						<label>Objet : </label>
 						<input type="text" required="required" name="objet" class="form-control" placeholder="Objet du message">
 					</div>
 					<div class="form-group col-md-12">
 						<label>Société : </label>
 						<select required="required" name="societe" class="form-control">
 							<option value>Le destinataire</option>
 							<c:forEach var="s" items="${societes }">
 								<option value="${s.slug }">${s.intituleSociete }</option>
 							</c:forEach>
 						</select>
 					</div>
 					<div class="form-group col-md-12">
 						<label>Message : </label>
 						<textarea name="message" rows="7" class="form-control" required="required"></textarea>
 					</div>
 					<div class="form-group col-md-12">
 						<label>Joindre un fichier: </label>
 						<input id="inputFile" type="file" class="form-control"  name="file"/>
 					</div>
 				</div>

 				
 				
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

				
 				
 <script src="<c:url value="/sources/js/sendmessage.js"/>" ></script>