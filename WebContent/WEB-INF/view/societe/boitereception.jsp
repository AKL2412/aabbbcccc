<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row boitemessage">
	
	<div class="menu col-md-3">
		<ul class="">
			<li 
			<c:if test="${rubrique == 'boite-de-reception' }">
				class="active"
			</c:if>
			>
				<i class="fa fa-folder-open-o"></i> 
				<a href="<c:url value="/societe/${scte.slug }/boite-de-reception"/>?rubrique=boite-de-reception ">Boite de reception </a>
			</li>
			<li
				<c:if test="${rubrique == 'messages-non-lus' }">
				class="active"
			</c:if>
			>	
				<i class="fa fa-folder-o"></i> 
				<a href="<c:url value="/societe/${scte.slug }/boite-de-reception"/>?rubrique=messages-non-lus ">Non lus </a>
			</li>
			<li
			<c:if test="${rubrique == 'message-envoyes' }">
				class="active"
			</c:if>
			>
				<i class="fa fa-send-o"></i> 
				<a href="<c:url value="/societe/${scte.slug }/boite-de-reception"/>?rubrique=message-envoyes ">Messages envoyés </a>
			</li>
		</ul>
	</div>
	<div class="contenu col-md-9">

		<c:choose>
			<c:when test="${message != null }">
				<div class="row entete-message">
					<div class="col-md-12 text-center objet">
						${message.objet }
					</div>
					<div class="col-md-9 details">
						${message.inter(rubrique) }
					</div>
					<div class="col-md-3 details">
						Envoyé le : ${message.dateenvoi }
					</div>
				</div>
				<div class="row">
				<c:if test="${rubrique != 'message-envoyes' }">
					<a href="<c:url value="/societe/${scte.slug }/marquer-non-lu/${message.messageId}" />" class="btn btn-default btn-xs">Marquer comme non lu</a>
				</c:if>
				
					<div class="col-md-10 col-md-offset-1 contenu-message">
						${message.message }
					</div>
					
				</div>
				<c:if test="${message.fichier }">
						<div class="row fichier-telecharger">
							<div class="col-md-11 col-sm-10 nom-ficher">
							<i class="fa fa-file"></i>
								${message.nomfichier }
							</div>
							<div class="col-md-1 col-sm-2">
								<a href="<c:url value="${message.lien() }" />">
									<i class="fa fa-download fa-2x"></i>
									
								</a>
							</div>
							
							
						</div>
					</c:if>
			</c:when>
			<c:otherwise>
				<c:forEach var="mes" items="${data }">
						<c:set var="lu" value=""/>
						<c:if test="${!mes.lu && rubrique != 'message-envoyes'}">
							<c:set var="lu" value="non-lu"/>
						</c:if>
						<div class="unMessage row ${lu } " >
						
							<div class="objet col-md-6">
							<a  href="<c:url value="/societe/${scte.slug }/boite-de-reception"/>?rubrique=${rubrique}&message=${mes.messageId}" >
								<c:if test="${mes.fichier }">
									<i class="fa fa-paperclip"></i>
								</c:if>
								${mes.objet }
								</a>
							</div>
							<div class="inter col-md-4">
								${mes.inter(rubrique) }
							</div>
							<div class="dateenvoi col-md-2">
								${mes.dateenvoi }
							</div>
							
						</div>
					
				
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		
	</div>
	</div>
