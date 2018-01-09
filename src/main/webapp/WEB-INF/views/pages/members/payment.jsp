<%@ include file="/WEB-INF/views/pages/include.jsp" %>


 
    <form:form method="POST" action="/member/${payment.member.id}/payment" modelAttribute="payment">
    
 <div class="card">
  <div class="card-header">
   Member: ${payment.member.name}  ${payment.member.surname}  (${payment.member.id})
  </div>
  <div class="card-body">
   
        <form:hidden path="id"/>
        <form:hidden path="member.id"/>
        
        <div class="row">
	        <aej:input path="year" gridClass="col-md-2"/>
	     
        </div>  
        
        <div class="row">
	        <aej:input path="jan" gridClass="col-md-1"/>
	        <aej:input path="feb" gridClass="col-md-1"/>
	        <aej:input path="mar" gridClass="col-md-1"/>
	        <aej:input path="apr" gridClass="col-md-1"/>
	        <aej:input path="may" gridClass="col-md-1"/>
	        <aej:input path="jun" gridClass="col-md-1"/>
	        <aej:input path="jul" gridClass="col-md-1"/>
	        <aej:input path="aug" gridClass="col-md-1"/>
	        <aej:input path="sep" gridClass="col-md-1"/>
	        <aej:input path="oct" gridClass="col-md-1"/>
	        <aej:input path="nov" gridClass="col-md-1"/>
	        <aej:input path="dec" gridClass="col-md-1"/>
	     
        </div>
          
   
  </div>
  <div class="card-footer">
        <input type="submit" class="btn btn-primary" value="Submit"/>
  </div>
</div>
 </form:form>