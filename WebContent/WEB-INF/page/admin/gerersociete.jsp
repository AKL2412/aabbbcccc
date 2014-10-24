<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cont" value="admin/accueil"/>
<c:set var="title" value="Gérer les sociétés"/>
<c:if test="${param != null }">
<c:if test="${fn:length(param.content)>0 }">			
				<c:set var="cont" value="${param.content}"/>	
</c:if>

<c:if test="${fn:length(param.title)>0 }">			
				<c:set var="title" value="${param.title}"/>	
</c:if>
</c:if>

<jsp:include page="/WEB-INF/layout/gp-layout.jsp">
	<jsp:param name="title" value="${title}"/>
	<jsp:param name="content" value="${cont }"/>
	
	<jsp:param name="menu" value="admin"/>
	<jsp:param name="menuRight" value="admin/gerersociete"/>
</jsp:include>




