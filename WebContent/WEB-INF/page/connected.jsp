<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${role == 'ROLE_ADMIN' }">
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