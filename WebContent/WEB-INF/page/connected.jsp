<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <c:set var="nbremsg" value="${fn:length(messages) }"/>
<c:choose>
	<c:when test="${role == 'ROLE_ADMIN' }">
	<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                     <c:if test="${nbremsg > 0 }">
                      	<span class="badge nombre-notification">${nbremsg }</span> 
                      	
                      </c:if> <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                    	<c:forEach var="mes" items="${messages }">
                    	<li>
                            <a href="<c:url value="/admin/boite-de-reception"/>?rubrique=boite-de-reception&message=${mes.messageId}">
                                <div>
                                    <strong>${mes.utilisateurByEmetteur.nom() }</strong>
                                    <span class="pull-right text-muted">
                                        <em>${mes.dateenvoi }</em>
                                    </span>
                                </div>
                                <div>
                                <c:if test="${mes.fichier }">
									<i class="fa fa-paperclip"></i>
								</c:if>
                                ${mes.objet }</div>
                            </a>
                        </li>
                    	</c:forEach>
                        
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="<c:url value="/admin/boite-de-reception"/>">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
	
		 <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<c:url value="/admin/gerer-mon-compte" />"><i class="fa fa-user fa-fw"></i> ${user.login } Profile</a>
                        </li>
                        <li><a href="<c:url value="/admin/gerer-mon-compte/modifier"/>"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/logout_user"/>"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
             </li>
	</c:when>
	<c:when test="${ role == 'ROLE_SOCIETE' }">
	
	<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                      
                      <c:if test="${nbremsg > 0 }">
                      	<span class="badge nombre-notification">${nbremsg }</span> 
                      	
                      </c:if>
                       <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <c:forEach var="mes" items="${messages }">
                    	<li>
                            <a href="<c:url value="/societe/${scte.slug }/boite-de-reception"/>?rubrique=boite-de-reception&message=${mes.messageId}">
                                <div>
                                    <strong>${mes.utilisateurByEmetteur.nom() }</strong>
                                    <span class="pull-right text-muted">
                                        <em>${mes.dateenvoi }</em>
                                    </span>
                                </div>
                                <div>
                                <c:if test="${mes.fichier }">
									<i class="fa fa-paperclip"></i>
								</c:if>
                                ${mes.objet }</div>
                            </a>
                        </li>
                    	</c:forEach>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="<c:url value="/societe/${scte.slug }/boite-de-reception"/>">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
<!--      Les notification des salaries -->
 <!-- /.dropdown -->
                <li class="dropdown">
                
	                <c:set var="salaries" value="${user.societe.salarieAnotifier() }"/>
	                <c:set var="totalNotif" value="${fn:length(salaries) }"/>
	                <c:if test="${user.societe.exoEncours() == null }">
	                <c:set var="totalNotif" value="${totalNotif+1 }"/>
	                </c:if>
	                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                    <c:if test="${totalNotif > 0 }">
	                    	<span class="badge nombre-notification">${totalNotif}</span>
	                    </c:if>
	                       
	                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
	                    </a>
	                    <ul class="dropdown-menu dropdown-alerts">
	                    	<c:forEach items="${salaries }" var="s">
	                    		<li>
	                            <a href="<c:url value="/societe/${user.societe.slug }/gerer-salaries/consulter-salarie/${s.salarieId }" />">
	                                <div>
	                                    <i class="fa fa-user fa-fw"></i> 
	                                    ${s.etatcivile.prenom } ${s.etatcivile.nom }<br>
	                                    <span class=" text-muted small">Fin de période d'éssai dans ${s.delaiFinEssai() } jour(s)</span>
	                                </div>
	                            </a>
	                        </li>
	                        <li class="divider"></li>
	                    	</c:forEach>
	                    	<c:if test="${user.societe.exoEncours() == null }">
	                    	 <li>
	                			<a class="text-center" href="<c:url value="/societe/${user.societe.slug }/gerer-societe/exercices" /> ">
	                               <i class="fa fa-warning"></i>
	                               Définir l'exercice en cours
	                            </a>
	                          </li>
	                		</c:if>
	                        <li>
	                            <a class="text-center" href="#">
	                                <strong>See All Alerts</strong>
	                                <i class="fa fa-angle-right"></i>
	                            </a>
	                        </li>
	                    </ul>
                    
                    
                </li>              
                
<!--           FIn de notification       -->
		<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                       <img width="30" src="<c:url value="/documents/${user.societe.lienLogo() }"/>" />  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<c:url value="/societe/${scte.slug }/gerer-societe/comptes"/>"><i class="fa fa-user fa-fw"></i> ${user.login } Profile</a>
                        </li>
                        <li><a href="<c:url value="/societe/${scte.slug }/parametres"/>"><i class="fa fa-gear fa-fw"></i> Paramètres</a>
                        </li>
                        <li>
                        	<a title="Envoyer à l'administrateur un barème" href="<c:url value="/societe/${scte.slug }/envoyer-message"/>">
                        		<i class="fa fa-paper-plane fa-fw"></i> Envoyer message
                        	</a>
                        </li>
                        <li>
                        	<a title="Les primes collectives" href="<c:url value="/societe/${scte.slug }/les-primes"/>">
                        		<i class="fa fa-trophy fa-fw"></i> Les primes
                        	</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/logout_user"/>"><i class="fa fa-sign-out fa-fw"></i> Se deconnecter</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
             </li>
	</c:when>
	<c:when test="${ role == 'ROLE_USER' }">
		<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<c:url value="/societe/${scte.slug }/gerer-societe/comptes"/>"><i class="fa fa-user fa-fw"></i> ${user.login } Profile</a>
                        </li>
                        <li><a href="<c:url value="/admin/gerer-mon-compte/modifier"/>"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<c:url value="/logout_user"/>"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
             </li>
	
	</c:when>
</c:choose>