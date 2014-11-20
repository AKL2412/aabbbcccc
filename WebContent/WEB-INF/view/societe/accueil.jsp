<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
                <div class=" col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-user fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${fn:length(scte.salaries) }</div>
                                    <div>Salarié(s)!</div>
                                </div>
                            </div>
                        </div>
                        <a  href="<c:url value="/societe/${scte.slug }/gerer-salaries/lister"/>">
                            <div class="panel-footer">
                                <span class="pull-left">Voir Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                	<c:set var="salaries" value="${scte.salarieAnotifier() }"/>
                	<c:choose>
                	<c:when test="${fn:length(salaries) > 0}">
                		
                		<div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Notifications de fin de période d'éssai des salariés
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                            	<c:forEach items="${salaries }" var="s">
                            		<a href="<c:url value="/societe/${scte.slug }/gerer-salaries/consulter-salarie/${s.salarieId }" />" class="list-group-item">
	                                   <i class="fa fa-user fa-fw"></i> 
                                    ${s.etatcivile.prenom } ${s.etatcivile.nom }
                                    <span class="pull-right text-muted small">${s.delaiFinEssai() } jour(s)</span>
	                                </a>
                            	</c:forEach>
                                
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                	
                	</c:when>
                	<c:otherwise>
                		 <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-bell fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">0</div>
                                    <div>Pas de notifications pour fin de période d'éssai </div>
                                </div>
                            </div>
                        </div>
                        <a  href="<c:url value="/societe/${scte.slug }/gerer-salaries/lister"/>">
                            <div class="panel-footer">
                                <span class="pull-left">Voir Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                	</c:otherwise>
                	</c:choose>
                	
                </div>
                <c:if test="${scte.exoEncours() == null }">
                <div class="col-md-6">
                          <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Exercice en cours
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                            		<a class="list-group-item" href="<c:url value="/societe/${scte.slug }/gerer-societe/exercices" /> ">
                               <i class="fa fa-warning"></i>
                               Définir l'exercice ne cours
                            </a>
                            
                                
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                	
                </div>
                	</c:if>
                
                
</div>
               