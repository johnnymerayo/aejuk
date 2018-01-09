<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<header class="app-header navbar">
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none mr-auto" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <a class="navbar-brand" href="#"></a>
    
   
<!--     <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button">
      <span class="navbar-toggler-icon"></span>
    </button>  -->
    
<!-- 
    <ul class="nav navbar-nav d-md-down-none">
      <li class="nav-item px-3">
        <a class="nav-link" href="#">Dashboard</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link" href="#">Users</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link" href="#">Settings</a>
      </li>
    </ul>
     -->
    
    <ul class="nav navbar-nav ml-auto">
     <!--  <li class="nav-item d-md-down-none">
        <a class="nav-link" href="#"><i class="icon-bell"></i><span class="badge badge-pill badge-danger">5</span></a>
      </li>
      <li class="nav-item d-md-down-none">
        <a class="nav-link" href="#"><i class="icon-list"></i></a>
      </li>
      <li class="nav-item d-md-down-none">
        <a class="nav-link" href="#"><i class="icon-location-pin"></i></a>
      </li> -->
      <sec:authorize access="isAuthenticated()">
	
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
          <sec:authentication property="principal.username" /> 
        </a>
        
        <div class="dropdown-menu dropdown-menu-right">
       
          <div class="dropdown-header text-center">
            <strong>Settings</strong>
          </div>
         
          <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Profile</a>
          <a class="dropdown-item" href="/logout"><i class="fa fa-lock"></i> Logout</a>
        </div>
      </li>
      
     
	</sec:authorize>
	
	<li class="nav-item dropdown"></li>
    </ul>
    
   <!--  <button class="navbar-toggler aside-menu-toggler" type="button">
      <span class="navbar-toggler-icon"></span>
    </button> -->

  </header>
