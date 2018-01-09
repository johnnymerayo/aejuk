<%@ include file="/WEB-INF/views/pages/include.jsp" %>

<form:form method="POST" action="/member" modelAttribute="member">
    
 <div class="card">
  <div class="card-header">
   Member: ${member.name}  ${member.surname}  (${member.id})
  </div>
  <div class="card-body">
   
        <form:hidden path="id"/>
        
        <div class="row">
	        <aej:input path="name" required="false" gridClass="col-md-6"/>
	        <aej:input path="surname" required="true" gridClass="col-md-6"/>
       </div>
       
        <div class="row">
	        <aej:input path="dateOfBirth" date="true" label="Date of Birth" gridClass="col-md-6"/>
	     	 <aej:checkRadioCustom addOptions="M_Male,F_Female" isValueKeyInput="true" path="sex" inline="true" isTypeRadio="true" gridClass="col-md-4"/>
       </div>
       
       
        <div class="row">
        	<div class="col-md-4">
        		<div class="row">
        	 		<aej:textarea path="address" rows="5" gridClass="col-md-12"/>
        		</div>
        		<div class="row">
        		</div>
        	</div>
        	
        	<div class="col-md-8">
	        	<div class="row">
	        	 	<aej:input path="phone" gridClass="col-md-6"/>
	       			 <aej:input path="mobile" gridClass="col-md-6"/>
        		</div>
        		
	        	<div class="row">
			       <aej:select itemValue="id" items="${areas}" path="area.id" itemLabel="name" emptyOptionBlank="true" label="Area" required="true" gridClass="col-md-4"/>
	
			        <aej:input path="city" gridClass="col-md-4"/>
			        <aej:input path="postCode" gridClass="col-md-4"/>
        		</div>
        	</div>
        
        </div>
        
        <div class="row">
	        <aej:input path="creationDate" date="true" addHidden="true" label="Date of Registration" disabled="true" gridClass="col-md-4"/>
	     	 <aej:checkRadioCustom addOptions="1_Paid" isValueKeyInput="true" path="registrationFeePaid" label="Registration Fee"  gridClass="col-md-4"/>
	        <aej:select itemValue="id" items="${memberStatus}" path="status.id" itemLabel="name" emptyOptionBlank="true" label="Status" required="true" gridClass="col-md-4"/>
        
       </div>
       
        <div class="row">
       	 <aej:textarea path="notes" rows="3" gridClass="col-md-6"/>
        </div>
       
            
  </div>
  <div class="card-footer">
        <input type="submit" class="btn btn-primary" value="Submit"/>
  </div>
</div>
 </form:form>
 
 
 
 
 
 
       
  
    
        
      
<script type="text/javascript">
<!--

//-->
$(document).ready(function() {
    $('#listPayments').DataTable();
} );
</script>


<div class="animated fadeIn">
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-header">
          <i class="fa fa-align-justify"></i> Payments List
            <div class="float-right">
            <a href="/member/${member.id }/payment/new" class="btn  btn-outline-primary">New Payment</a>
          </div>
          
        </div>
        <div class="card-body">
			<table id="listPayments" class="table table-sm table-striped" >
		        <thead>
		            <tr>
		                <th>Year</th>
		                <th>Jan</th>
		                <th>Feb</th>
		                <th>Mar</th>
		                <th>Apr</th>
		                <th>May</th>
		                <th>Jun</th>
		                <th>Jul</th>
		                <th>Aug</th>
		                <th>Sep</th>
		                <th>Oct</th>
		                <th>Nov</th>
		                <th>Dec</th>
		                <th>Total</th>
		                <th>View</th>
		            </tr>
		        </thead>
		        <tfoot>
		            <tr>
		                <th>Year</th>
		                <th>Jan</th>
		                <th>Feb</th>
		                <th>Mar</th>
		                <th>Apr</th>
		                <th>May</th>
		                <th>Jun</th>
		                <th>Jul</th>
		                <th>Aug</th>
		                <th>Sep</th>
		                <th>Oct</th>
		                <th>Nov</th>
		                <th>Dec</th>
		                <th>Total</th>
		                <th>View</th>
		            </tr>
		        </tfoot>
		        <tbody>
		        
	 			<c:forEach items="${member.payments}" var="payment">
		        
		            <tr>
		                <td>${payment.year }</td>
		                <td>${payment.jan }</td>
		                <td>${payment.feb }</td>
		                <td>${payment.mar }</td>
		                <td>${payment.apr }</td>
		                <td>${payment.may }</td>
		                <td>${payment.jun }</td>
		                <td>${payment.jul }</td>
		                <td>${payment.aug }</td>
		                <td>${payment.sep }</td>
		                <td>${payment.oct }</td>
		                <td>${payment.nov }</td>
		                <td>${payment.dec }</td>
		                <td>${payment.total }</td>
		                <td><a href="/member/${member.id }/payment/${payment.id}" >View</a></td>
		            </tr>
		       
		        </c:forEach>
		          
		        </tbody>
		    </table>
       </div>
   		<!--/.card-body -->
     </div>
   	<!--/.card-->
   </div>
   <!--/.col-->
 
 </div>
 <!--/.row-->
</div>
<!--/ .animated .fadeIn -->


        
        
        
        