<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${salarie != null }">
		congessalarier
	</c:when>
	<c:otherwise>
		<div class="alert alert-danger">
			Erreur 
		</div>
	</c:otherwise>
</c:choose>

