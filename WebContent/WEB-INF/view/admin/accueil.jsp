<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!--  <i class="fa fa-home"></i> -->
<!--   <i class="fa fa-trash"></i> -->
<!--    <i class="fa fa-close"></i> -->
<!--     <i class="fa fa-remove"></i> -->
<div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-book fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${fn:length(societes) }</div>
                                    <div>Sociétés(s)</div>
                                </div>
                            </div>
                        </div>
                        <a  href="<c:url value="/admin/gerer-societes/lister"/>">
                            <div class="panel-footer">
                                <span class="pull-left">Voir Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-life-bouy fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">${fn:length(baremes) }</div>
                                    <div>Barème(s)</div>
                                </div>
                            </div>
                        </div>
                        <a  href="<c:url value="/admin/gerer-baremes/consulter"/>">
                            <div class="panel-footer">
                                <span class="pull-left">Voir Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                
                
                
               </div>