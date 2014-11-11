<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row boitemessage">
	<div class="container">
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
	
	</div>
	</div>
</div>