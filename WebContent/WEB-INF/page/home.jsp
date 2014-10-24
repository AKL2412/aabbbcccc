<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Home</h1>
<a href="<c:url value="/authentification"/>">login</</a>

<form method="post" enctype="multipart/form-data">


<input type="file"  name="file" id="inputFileImg" />
<input type="text"  name="societe" placeholder="societe"/>
<input type="text"  name="salarie" placeholder="salarie"/>
<select name="typedoc">
	<option value="cv">cv</option>
	<option value="motivation">motivation</option>
	<option value="paie">paie</option>
</select>
		<input type="submit" value="Valider" class="btn" id="_valider">
		<input type="reset" value="Annuler" class="btn">

	
</form>
</body>
</html>