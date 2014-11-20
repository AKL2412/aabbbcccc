<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<%-- <link rel="stylesheet" type="text/css" href="<c:url value="/sources/css/bootstrap.css" /> "> --%>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<!-- <title>Connexion</title> -->
<!-- <style type="text/css"> -->

<!-- </style> -->
<!-- </head> -->
<!-- <body> -->

<%-- <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}"> --%>
<!-- 		<div class="alert alert-danger "> -->
<!-- 			<strong> -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${fn:indexOf(SPRING_SECURITY_LAST_EXCEPTION.message, 'User is disabled') != -1}"> --%>
<%-- 					<c:out value="Compte désactivé, veuillez contacter l'administrateur"></c:out> --%>
<%-- 				</c:when> --%>
<%-- 				<c:when test="${fn:indexOf(SPRING_SECURITY_LAST_EXCEPTION.message, 'Maximum sessions of 1 for this principal exceeded') != -1}"> --%>
<%-- 					<c:out value="Votre compte est actuel connecté !!! "></c:out> --%>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise>  --%>
<%-- 					<c:out value="[Login / mot de passse] incorrect"></c:out> --%>
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose></strong><br> --%>
<!-- 			<i class="fi-alert" style="font-size: 30px"></i> -->
<!-- 			<br>			 -->
<!-- 		</div> -->
<%-- 	</c:if> --%>
<%--     <form class="form-signin" role="form" name='f' action="<c:url value="/j_spring_security_check"/>" method="post"> --%>
<!--         <h2 class="form-signin-heading">Please sign in</h2> -->
<!--         <input type="text" -->
<!-- 				name="j_username" class="form-control" value="" id="input-login-username" required autofocus placeholder="Login-nom utilisateur"> -->
<!--         <input type="password" class="form-control" required -->
<!--         name="j_password" id="input-login-pass" placeholder="Mot de passe" > -->
<!--         <label class="checkbox"> -->
<!--           <input type="checkbox" value="remember-me" name="j_remember_me"> Remember me -->
<!--         </label> -->
<!--         <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button> -->
<!--       </form>	 -->
<!-- </body> -->
<!-- </html> -->

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Authentification</title>

    <!-- Bootstrap Core CSS -->
    <link href="  <c:url value="/sources/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="  <c:url value="/sources/css/plugins/metisMenu/metisMenu.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="  <c:url value="/sources/css/sb-admin-2.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="  <c:url value="/sources/font-awesome-4.1.0/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
    	
        <div class="row">
       
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Authentifiez vous</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" name='f' action="<c:url value="/j_spring_security_check"/>" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Login" name="j_username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="j_password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input  name="j_remember_me" type="checkbox" value="Remember Me">Se souvenir de moi
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="Connecter"/>
                            </fieldset>
                        </form>
                        
                        <div class="row">
                        
                          <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                          <br>
		<div class="alert alert-danger col-md-12">
			<strong>
			<c:choose>
				<c:when test="${fn:indexOf(SPRING_SECURITY_LAST_EXCEPTION.message, 'User is disabled') != -1}">
					<c:out value="Compte désactivé, veuillez contacter l'administrateur"></c:out>
				</c:when>
				<c:when test="${fn:indexOf(SPRING_SECURITY_LAST_EXCEPTION.message, 'Maximum sessions of 1 for this principal exceeded') != -1}">
					<c:out value="Votre compte est actuel connecté !!! "></c:out>
				</c:when>
				<c:otherwise> 
					<c:out value="[Login / mot de passse] incorrect"></c:out>
				</c:otherwise>
			</c:choose></strong><br>
			<i class="fi-alert" style="font-size: 30px"></i>
			<br>			
		</div>
	</c:if>
                        
                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery Version 1.11.0 -->
    <script src=" <c:url value="/sources/js/jquery-1.11.0.js" />"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src=" <c:url value="/sources/js/bootstrap.min.js" />"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="s <c:url value="/sources/js/plugins/metisMenu/metisMenu.min.j" />"></script>

    <!-- Custom Theme JavaScript -->
    <script src=" <c:url value="/sources/js/sb-admin-2.js" />"></script>

</body>

</html>
