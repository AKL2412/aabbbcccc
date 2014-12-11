<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${param.title }</title>
<!-- jQuery Version 1.11.0 -->
    <script src=" <c:url value="/sources/js/jquery-1.11.0.js"/>"></script>
    <!-- jQuery Version 1.11.0 -->
    <script src=" <c:url value="/sources/js/jquery-ui.js"/>"></script>
    <script src=" <c:url value="/sources/js/app.js"/>"></script>
 <link rel="stylesheet" type="text/css" href="<c:url value="/sources/css/device/app.css"/> "> 
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/sources/css/bootstrap.css"/> " rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href=" <c:url value="/sources/css/plugins/metisMenu/metisMenu.min.css"/> " rel="stylesheet">

    <!-- Timeline CSS -->
    <link href=" <c:url value="/sources/css/plugins/timeline.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href=" <c:url value="/sources/css/sb-admin-2.css"/>" rel="stylesheet">
	
<!-- 	jquery ui css -->
<link href=" <c:url value="/sources/css/jquery-ui.min.css"/>" rel="stylesheet">
<link href=" <c:url value="/sources/css/jquery-ui.structure.min.css"/>" rel="stylesheet">
<link href=" <c:url value="/sources/css/jquery-ui.theme.min.css"/>" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href=" <c:url value="/sources/css/plugins/morris.css "/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href=" <c:url value="/sources/font-awesome-4.2.0/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
	<style type="text/css">
		li.active>a{
		background:#eee;
		}
		li.active ul li.active>a{
		color:rgba(0,0,0,0.7);
		font-weight:bold;
		}
	</style>
    

</head>

<body>
	

    <div id="wrapper">
    
    

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<c:url value="/" />" >GDP</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
           
               		<c:import url="/connected"></c:import>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                   <!--  menu -->
                   <c:if test="${param.menu != \"\" }">
						<jsp:include page="/WEB-INF/menu/${param.menu }.jsp"/>
					</c:if>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>


        <div id="page-wrapper">

			
            <div class="row" style="padding-top:10px">
                
                <c:if test="${param.content != \"\" }">
					<jsp:include page="/WEB-INF/view/${param.content }.jsp"/>
				</c:if>
                
            </div>
            <!-- /.row -->
            
            
        </div>
        <!-- /#page-wrapper -->


    </div>
    <!-- /#wrapper -->

    
<!-- <div id="alert-box"> -->
<!-- 	<div class="bg"></div> -->
<!-- 	<div class="alert-main"> -->
<!-- 		<div class="msg">chargement...</div> -->
<!-- 	</div> -->
<!-- </div> -->
    <!-- Bootstrap Core JavaScript -->
    <script src=" <c:url value="/sources/js/bootstrap.min.js"/>"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src=" <c:url value="/sources/js/plugins/metisMenu/metisMenu.min.js"/>"></script>

    <!-- Morris Charts JavaScript -->
    <!-- <script src=" <c:url value="/sources/js/plugins/morris/raphael.min.js"/>"></script>
    <script src=" <c:url value="/sources/js/plugins/morris/morris.min.js"/>"></script>
    <script src=" <c:url value="/sources/js/plugins/morris/morris-data.js"/>"></script> -->

    <!-- Custom Theme JavaScript -->
    <script src=" <c:url value="/sources/js/sb-admin-2.js"/>"></script>
    <!-- DataTables JavaScript -->
    <script src=" <c:url value="/sources/js/plugins/dataTables/jquery.dataTables.js"/>"></script>
    <script src=" <c:url value="/sources/js/plugins/dataTables/dataTables.bootstrap.js"/>"></script>


</body>

</html>
