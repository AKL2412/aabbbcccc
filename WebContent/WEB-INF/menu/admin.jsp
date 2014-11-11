

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li class="<c:if test="${link == \"accueil\"}">active</c:if>">
                            <a  href="<c:url value="/admin/"/>"> <i class="fa fa-home"></i> Accueil</a>
                        </li>
                        <li class="<c:if test="${link == \"societe\"}">active</c:if>">
                            <a href="#"><i class="fa fa-book fa-fw"></i> Gérer sociétés <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
<%--                                 <li class="<c:if test="${link == \"societe\" && action == \"menu\"}"> active </c:if>"> --%>
<%--                                     <a href="<c:url value="/admin/gerer-societes"/>"> --%>
<!--                                     <i class="fa fa-th-large"></i> -->
<!--                                     Menu</a> -->
<!--                                 </li> -->
                                <li class="<c:if test="${link == \"societe\" && action == \"creer\"}">active</c:if>">
									<a  href="<c:url value="/admin/gerer-societes/creer"/>">
										<i class="fa fa-plus-circle"></i>	Créer
									</a>
								</li>
								<li class="<c:if test="${link == \"societe\" && action == \"lister\"}"> active </c:if>">
									<a  href="<c:url value="/admin/gerer-societes/lister"/>">
										<i class="fa fa-list-ol"></i>	Lister
									</a>
								</li>
								<c:if test="${link == \"societe\" && action == \"modifier\"}"> 
										<li class="active" >
											<a >
										
											<i class="fa fa-edit"></i> Modifier
											</a> 
										</li>
								</c:if> 
								 <c:if test="${link == \"societe\" && action == \"bareme\"}"> 
										<li class="active" >
											<a >
											
											<i class="fa fa-tasks"></i> Barèmes
											</a> 
										</li>
										 </c:if>
										 <c:if test="${link == \"societe\" && action == \"consulter\"}"> 
										<li class=" active " >
											<a><i class="fa fa-eye"></i> Consultation</a> 
										</li>
										</c:if>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        
								<li  class=" gdp-lien <c:if test="${link == \"bareme\"}"> active </c:if>">
									
									<a href="#"><i class="fa fa-life-bouy fa-fw"></i> Gérer barèmes <span class="fa arrow"></span></a>
									<ul class="nav nav-second-level">
										<li class="<c:if test="${link == \"societe\" && action == \"menu\"}"> active </c:if>">
		                                    <a href="<c:url value="/admin/gerer-baremes"/>">
		                                    <i class="fa fa-th-large"></i>
		                                    Menu</a>
		                                </li>
										<li class="<c:if test="${ action==\"creer\" && link == \"bareme\"}"> active </c:if>">
										<a href="<c:url value="/admin/gerer-baremes/creer"/>">
										 	<i class="fa fa-plus-square"></i> Créer</a>
										</li>
										<li class="<c:if test="${ action==\"compagnie\" && link == \"bareme\"}"> active </c:if>">
										<a href="<c:url value="/admin/gerer-baremes/les-compagnies"/>">
										 	<i class="fa fa-tag"></i> les compagnies</a>
										</li>
										<c:if test="${link == \"bareme\" && action == \"compagnieVoir\"}"> 
										<li class="active" >
											<a href="">
											
											<i class="fa fa-eye"></i> Voir compagnie
											</a> 
										</li>
										 </c:if>
										<c:if test="${link == \"bareme\" && action == \"tranche\"}"> 
										<li class="active" >
											<a >
											
											<i class="fa fa-plus-circle"></i> Ajout de tranche
											</a> 
										</li>
										 </c:if>
										<c:if test="${link == \"bareme\" && action == \"modifier\"}"> 
										<li class="active" >
										
											
											<a><i class="fa fa-edit"></i> Modifier
											</a> 
										</li>
										 </c:if>
										<li class="<c:if test="${ action==\"lister\" && link == \"bareme\"}"> active </c:if>">
										<a href="<c:url value="/admin/gerer-baremes/consulter"/>">
										
										<i class="fa fa-list-ul"></i>Lister
										</a>
										</li>
									</ul>
								</li>
								
								<li class="<c:if test="${link == \"cotisation\"}">active</c:if>">
                            <a href="#"><i class="fa fa-money fa-fw"></i> Gérer cotisation <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li class="<c:if test="${link == \"cotisation\" && action == \"menu\"}"> active </c:if>">
                                    <a href="<c:url value="/admin/gerer-societes"/>">
                                    <i class="fa fa-th-large"></i>
                                    Menu</a>
                                </li>
                                </ul>
                        

                       	 </li>
                       	 
                       	 <li class="<c:if test="${link == \"reception\"}">active</c:if>">
                            <a  href="<c:url value="/admin/boite-de-reception"/>"> <i class="fa fa-envelope-o"></i> Boite de reception</a>
                        </li>
                    </ul>
