
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


					<div class="card">
					
						<div class="card-header">
						  <strong>Login</strong>
                 			 <small>(Username and Password)</small>
						</div>
						<div class="card-body">
							

<%-- 		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if> --%>

		<c:if test="${param.error != null}"> 
			<div class="alert alert-danger" role="alert">Invalid username and password.</div>
		</c:if>
		<c:if test="${param.logout != null}">      
			<div class="alert alert-info" role="alert">	You have been logged out. </div>
		</c:if>
		
		
		<c:url value="/login" var="loginUrl"/>
		<form class="form-horizontal" role="form" action="${loginUrl}" method="post"> 

	
		  
		  <div class="form-group">
		    <label for="username">Username:</label>
		    <input type="text" class="form-control" id="username" name="username" required autofocus>
		  </div>
	
		<div class="form-group">
			<label for="password">Password</label>
			<input id="password" type="password" class="form-control" name="password" required data-eye>
		</div>

	

		<div class="form-group no-margin">
			<button type="submit" class="btn btn-primary btn-block">
				Login
			</button>
		</div>



		  <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

							 

		</form>
	
						</div>
					</div>
					
