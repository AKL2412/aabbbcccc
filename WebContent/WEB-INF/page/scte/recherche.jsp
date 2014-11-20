<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/layout/societe-layout.jsp">
	<jsp:param name="title" value="Recherche : ${q } (${fn:length(result) })"/>
	<jsp:param name="content" value="recherche"></jsp:param>
</jsp:include>