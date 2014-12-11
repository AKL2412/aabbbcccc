<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="t" value="${title }"/>
	<c:choose>
		<c:when test="${message != null }">
			<c:set var="t" value="${message.objet} | ${message.inter(rubique) }"/>
		</c:when>
		<c:otherwise>
			<c:if test="${nonlus > 0 }">
				<c:set var="t" value="${title } (${nonlus })"/>
			</c:if>
		</c:otherwise>
	</c:choose>

<jsp:include page="/WEB-INF/page/admin/gerersociete.jsp">
	<jsp:param name="title" value="${t }"/>
	<jsp:param name="content" value="admin/boite"></jsp:param>
</jsp:include>