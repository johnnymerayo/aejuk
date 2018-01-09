<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Association for Eritrean Jerbeti in UK">
	<meta name="author" content="Jonathan Merayo">
	<meta name="keyword" content="Eritreanm,Jerbeti">
	 
	<link rel="shortcut icon" href="/static/images/favicon.png">
	  
	<title><tiles:getAsString name="title" /></title>
	
	<!-- Required meta tags -->
	
	<!-- Bootstrap -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	<!-- End Bootstrap -->
	
	
	<!-- Datatables -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
	 
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<!-- End Datatables -->
	
	
	<!-- Select2 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
	<!-- End Select2 -->
	
	
	<!-- iCheck 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/flat/_all.css" integrity="sha256-h+F2ilGZpQMtb+E8DmEXx/fAEzYBnexAP+fK2Hhjy+s=" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/flat/blue.css" integrity="sha256-XM7s+h73EWY2tzW4pk09cZAcxLcVmOjUrEGEssRT9q0=" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/icheck.js" integrity="sha256-LnexpAH6Dc12CjL5nVvF6kwco3N4Cs+Ahtm0fmnyGhg=" crossorigin="anonymous"></script>
	-->
	
	<!--End iCheck -->
	
	<!-- Datetime picker -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/smalot-bootstrap-datetimepicker/2.4.4/css/bootstrap-datetimepicker.css" integrity="sha256-/VhyvXdXS5+YGVlp6xd8oKPZYeI3dT++2J3XFUgt2Ug=" crossorigin="anonymous" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/smalot-bootstrap-datetimepicker/2.4.4/js/bootstrap-datetimepicker.js" integrity="sha256-Wi3VciocoTI77pvuTQwkhPX8NAno2na3kDcN9DvYRrM=" crossorigin="anonymous"></script>
	<!-- End Datetime picker -->
  
	<!-- Icons -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.2/js/all.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
	
	<!-- Main styles for this application -->
	<link href="<c:url value='/static/css/core-ui.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<!-- Styles required by this views -->
</head>

<!-- BODY options, add following classes to body to change options

// Header options
1. '.header-fixed'					- Fixed Header

// Brand options
1. '.brand-minimized'       - Minimized brand (Only symbol)

// Sidebar options
1. '.sidebar-fixed'					- Fixed Sidebar
2. '.sidebar-hidden'				- Hidden Sidebar
3. '.sidebar-off-canvas'		- Off Canvas Sidebar
4. '.sidebar-minimized'			- Minimized Sidebar (Only icons)
5. '.sidebar-compact'			  - Compact Sidebar

// Aside options
1. '.aside-menu-fixed'			- Fixed Aside Menu
2. '.aside-menu-hidden'			- Hidden Aside Menu
3. '.aside-menu-off-canvas'	- Off Canvas Aside Menu

// Breadcrumb options
1. '.breadcrumb-fixed'			- Fixed Breadcrumb

// Footer options
1. '.footer-fixed'					- Fixed footer

-->

<body class="app header-fixed  sidebar-fixed">

	<tiles:insertAttribute name="header" />

	<div class="app-body">
    
	<tiles:insertAttribute name="sidebar" />

    <!-- Main content -->
    <main class="main">
   
   		<br/>
		
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if> 

		<c:if test="${param.error != null}"> 
			<div class="alert alert-danger" role="alert">Invalid username and password.</div>
		</c:if>

     	<div class="container-fluid">
			<tiles:insertAttribute name="body" />
		</div>
      <!-- /.conainer-fluid -->
    </main>

  </div>

 <tiles:insertAttribute name="footer" />

 <!-- CoreUI main scripts -->
 <script src="/static/js/core-ui.js"></script>

 <!-- Plugins and scripts required by this views -->

 <!-- Custom scripts required by this view -->
 <script src="/static/js/app.js"></script>

</body>
</html>