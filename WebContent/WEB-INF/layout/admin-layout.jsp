<jsp:include page="/WEB-INF/layout/gp-layout.jsp">
	<jsp:param name="title" value="${param.title}"/>
	<jsp:param name="content" value="admin/${param.content}"></jsp:param>
	<jsp:param name="menu" value="admin"/>
	<jsp:param name="menuRight" value=""/>
</jsp:include>