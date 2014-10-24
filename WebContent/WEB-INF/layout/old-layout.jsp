<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>${param.title }</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/sources/css/device/app.css"/> ">
	<link rel="stylesheet" type="text/css" href="<c:url value="/sources/css/foundation-icons.css" /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value="/sources/css/bootstrap.css" /> ">
	<script type="text/javascript" src="<c:url value="/sources/js/jquery.min.js" /> "></script>
	<script type="text/javascript" src="<c:url value="/sources/js/app.js"/> "></script>
	<script type="text/javascript" src="<c:url value="/sources/js/bootstrap.js"/> "></script>
</head>
<body>

<div id="body">

<!-- <div id="alert-box"> -->
<!-- 	<div class="bg"></div> -->
<!-- 	<div class="alert-main"> -->
<!-- 		<img class="loding-image" src="/GestPaie/sources/img/loaderf.gif" /> -->
<!-- 	</div> -->
<!-- </div> -->
<div id="contenu-top">
<div id="link-selected"></div>
<div class="gp-menu-top">
		<div class="gp-widget">
			<i class="fi-list"></i>
			<div class="top-menu">
			</div>
		</div>
		<div class="sous-menu-top">
			 <ul class="no-style">
							<li class="active"><a href="#">Créer</a></li>
							<li><a href="#">Lister</a></li>
			</ul> 
		</div>

</div>
</div>
<div class="gp-menu-right-main-content">
	<div class="gp-menu-right ">
		<c:if test="${param.menu != \"\" }">
			<jsp:include page="/WEB-INF/menu/${param.menu }.jsp"/>
		</c:if>
	</div>
	<div class="gp-main-content">
		<c:if test="${param.content != \"\" }">
			<jsp:include page="/WEB-INF/view/${param.content }.jsp"/>
		</c:if>
	</div>
</div>

</div>
</body>
</html>