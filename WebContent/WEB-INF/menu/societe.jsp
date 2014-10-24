<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search salarié...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li class="<c:if test="${link == \"accueil\"}"> active </c:if>">
									<a href="<c:url value="/societe/${scte.slug }/"/>" class="skel-layers-ignoreHref">
											<img width="30" src="<c:url value="/documents/${scte.lienLogo() }"/>" />
											Accueil
									</a>
							</li>
							<li class=" gdp-lien <c:if test="${link == \"salarie\"}"> active </c:if>">
									
									<a href="#" >  <i class="fa fa-user fa-fw"></i> Gérer salariés <span class="fa arrow"></span></a>
									<ul class="nav nav-second-level">
<%-- 										<li class="<c:if test="${link == \"cotisation\" && action == \"menu\"}"> active </c:if>"> --%>
<%--                                     <a href="<c:url value="/societe/${scte.slug }/gerer-les-salaries"/>"> --%>
<!--                                     <i class="fa fa-th-large"></i> -->
<!--                                     Menu</a> -->
<!--                                 </li> -->
										<li class="<c:if test="${link == \"salarie\" && action == \"ajouter\"}"> active </c:if>">
											<a  href="<c:url value="/societe/${scte.slug }/gerer-salaries/ajouter"/>">
												<i class="fa fa-plus-square"></i> Ajouter
											</a>
										</li>
										<li class="<c:if test="${link == \"salarie\" && action == \"lister\"}"> active </c:if>">
											<a  href="<c:url value="/societe/${scte.slug }/gerer-salaries/lister"/>">
												<i class="fa fa-list"></i>  Lister
											</a>
										</li>
										 <c:if test="${link == \"salarie\" && action == \"consulter\"}"> 
										<li class="active" >
											<a >
											
											<i class="fa fa-eye"></i> Consultation
											</a> 
										</li>
										 </c:if>
										 <c:if test="${link == \"salarie\" && action == \"conges\"}"> 
										<li class="active" >
											<a >
											
											<i class="fa fa-calendar"></i> Congés
											</a> 
										</li>
										 </c:if>
										 <c:if test="${link == \"salarie\" && action == \"modifier\"}">
										<li class="  active" >
											<a>
										
											<i class="fa fa-edit"></i> Modifier</a> 
										</li>
										</c:if>
									</ul>
								</li>
                        	<li class="<c:if test="${link == \"cotisation\"}">active</c:if>">
                            <a href="#"><i class="fa fa-money fa-fw"></i> Gérer cotisation <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
<%--                                 <li class="<c:if test="${link == \"cotisation\" && action == \"menu\"}"> active </c:if>"> --%>
<%--                                     <a href="<c:url value="/admin/gerer-societes"/>"> --%>
<!--                                     <i class="fa fa-th-large"></i> -->
<!--                                     Menu</a> -->
<!--                                 </li> -->
                                 <li class="<c:if test="${link == \"cotisation\" && action == \"cnss\"}"> active </c:if>">
                                <a  href="<c:url value="/societe/${scte.slug }/gerer-cotisation/cnss"/>" >
                                
												<i class="fa fa-cube"></i>  CNSS
								</a>
								</li>
								<li class="<c:if test="${link == \"cotisation\" && action == \"patronale\"}"> active </c:if>">
                                <a  href="<c:url value="/societe/${scte.slug }/gerer-cotisation/patronale"/>" >
                                
												<i class="fa fa-paper-plane"></i>  Patronale
								</a>
								</li>
								
								<li class="<c:if test="${link == \"cotisation\" && action == \"autre-cotisation\"}"> active </c:if>">
                                <a  href="<c:url value="/societe/${scte.slug }/gerer-cotisation/autre-cotisation"/>" >
                                
												<i class="fa fa-paper-plane-o"></i>  Autre cotisation
								</a>
								</li>
								<li class="<c:if test="${link == \"cotisation\" && action == \"etat-cotisation\"}"> active </c:if>">
                                <a  href="<c:url value="/societe/${scte.slug }/gerer-cotisation/etat-cotisation"/>" >
                                
												<i class="fa fa-stethoscope"></i> Etat de cotisation
								</a>
								</li>
								
                                
                                </ul>
                        

                       	 </li>
                       	
						<li class="gdp-lien <c:if test="${link == \"bareme\"}"> active </c:if>">
									<a href="#" id="about-link" class="skel-layers-ignoreHref">
									<i class="fa fa-cubes"></i>	gérer barèmes <span class="fa arrow"></span>
									</a>
									<ul class="nav nav-second-level">
									<li class="<c:if test="${ action==\"creer\" && link == \"bareme\"}"> active </c:if>">
										<a href="<c:url value="/admin/gerer-baremes/creer"/>">
										<i class="fa fa-plus-circle"></i> Créer
										 </a>
									</li>
									<c:if test="${action==\"envoyer\" && link == \"bareme\" }">
										<li class="active ">
										<a href="">
										<i class="fa fa-paper-plane"></i> Envoyer barème
										 </a>
									</li>
									</c:if>
										<li class="<c:if test="${link == \"societe\" && action == \"visualiser\"}"> active </c:if>" >
											<a href="<c:url value="/societe/${scte.slug }/gerer-societe" />">
										
											<i class="fa fa-eye"></i> Informations
											</a> 
										</li>
							</ul>
							</li>
						
						
								<li class="gdp-lien <c:if test="${link == \"societe\"}"> active </c:if>">
									<a href="#" id="about-link" class="skel-layers-ignoreHref">
									<i class="fa fa-bookmark"></i>	gérer Société <span class="fa arrow"></span>
									</a>
									<ul class="nav nav-second-level">
									
										<li class="<c:if test="${link == \"societe\" && action == \"visualiser\"}"> active </c:if>" >
											<a href="<c:url value="/societe/${scte.slug }/gerer-societe" />">
										
											<i class="fa fa-eye"></i> Informations
											</a> 
										</li>
										
										 <c:if test="${link == \"societe\" && action == \"modifier\"}"> 
										<li class="active" >
											<a >
										
											<i class="fa fa-edit"></i> Modifier
											</a> 
										</li>
										 </c:if>
										<li class=" <c:if test="${link == \"societe\" && action == \"compte\"}"> active </c:if>" >
										<a href="<c:url value="/societe/${scte.slug }/gerer-societe/comptes"/> ">
										
											<i class="fa fa-cogs"></i> Gérer compte</a></li>
										<c:if test="${link == \"societe\" && action == \"excercice\"}"> 
										<li class="active" >
											<a >
										
											Exercices
											</a> 
										</li>
										 </c:if>
									</ul>
								</li>
</ul>
<!--  
<ul class="no-style menu">
								<li class="logo onlylarge">
									<a href="<c:url value="/societe/${scte.slug }/"/>">

</a>
								</li>
								
								<li class=" gdp-lien <c:if test="${link == \"salarie\"}"> active </c:if>">
									<a href="<c:url value="/societe/${scte.slug }/gerer-les-salaries"/>" >
										Gérer salariés
									</a>
									<ul>
										<li class="<c:if test="${link == \"salarie\" && action == \"ajouter\"}"> active </c:if>">
											<a  href="<c:url value="/societe/${scte.slug }/gerer-salaries/ajouter"/>">
												Ajouter
											</a>
										</li>
										<li class="<c:if test="${link == \"salarie\" && action == \"lister\"}"> active </c:if>">
											<a  href="<c:url value="/societe/${scte.slug }/gerer-salaries/lister"/>">
												Lister
											</a>
										</li>
										 <c:if test="${link == \"salarie\" && action == \"consulter\"}"> 
										<li class="active" >
											<a >
											
											Consultation
											</a> 
										</li>
										 </c:if>
										 <c:if test="${link == \"salarie\" && action == \"modifier\"}">
										<li class="  active" >
											<a>
										
											Modifier</a> 
										</li>
										</c:if>
									</ul>
								</li>
								<li class=" gdp-lien <c:if test="${link == \"bareme\"}"> active </c:if>">
									<a href="<c:url value="/admin/gerer-baremes"/>" id="sct-link" class="skel-layers-ignoreHref">
										Gérer barèmes
									</a>
									<ul>
										<li class="<c:if test="${ action==\"creer\" && link == \"bareme\"}"> active </c:if>">
										<a href="<c:url value="/admin/gerer-baremes/creer"/>">
										 Créer</a>
										</li>
										<li class="<c:if test="${ action==\"lister\" && link == \"bareme\"}"> active </c:if>">
										<a href="<c:url value="/admin/gerer-baremes/consulter"/>">
										
										Lister
										</a>
										</li>
									</ul>
								</li>
								<li class="gdp-lien <c:if test="${link == \"cotisation\"}"> active </c:if>">
									<a href="#portfolio" id="portfolio-link" class="skel-layers-ignoreHref">
								
									Gérer Cotisation
									</a>
								</li>
								<li class="gdp-lien <c:if test="${link == \"societe\"}"> active </c:if>">
									<a href="<c:url value="/societe/${scte.slug }/gerer-societe" />" id="about-link" class="skel-layers-ignoreHref">
										gérer Société
									</a>
									<ul>
									<c:if test="${link == \"societe\" && action == \"visualiser\"}"> 
										<li class="active" >
											<a >
										
											Informations
											</a> 
										</li>
										 </c:if>
										 <c:if test="${link == \"societe\" && action == \"modifier\"}"> 
										<li class="active" >
											<a >
										
											Modifier
											</a> 
										</li>
										 </c:if>
										<li class=" <c:if test="${link == \"societe\" && action == \"compte\"}"> active </c:if>" >
										<a href="<c:url value="/societe/${scte.slug }/gerer-societe/comptes"/> ">
										
											Gérer compte</a></li>
										<c:if test="${link == \"societe\" && action == \"excercice\"}"> 
										<li class="active" >
											<a >
										
											Exercices
											</a> 
										</li>
										 </c:if>
										<li><a href="<c:url value="/logout_user"/>">
										
										déconnecter</a></li>
									</ul>
								</li>
								
							</ul>
							-->