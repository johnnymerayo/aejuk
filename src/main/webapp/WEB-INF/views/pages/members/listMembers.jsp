<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
<!--

//-->
$(document).ready(function() {
    $('#listMembers').DataTable();
} );
</script>


<div class="animated fadeIn">
  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-header">
          <i class="fa fa-align-justify"></i> Members List
          
          <div class="float-right">
            <a href="/member/new" class="btn  btn-outline-primary">New Member</a>
          </div>
          
        </div>
        <div class="card-body">
			<table id="listMembers" class="table table-striped table-responsive" >
		        <thead>
		            <tr>
		                <th>Name</th>
		                <th>Surname</th>
		                <th>Sex</th>
		                <th>Phone</th>
		                <th>City</th>
		                <th>Status</th>
		                <th>View</th>
		            </tr>
		        </thead>
		        <tfoot>
		            <tr>
		                <th>Name</th>
		                <th>Surname</th>
		                <th>Sex</th>
		                <th>Phone</th>
		                <th>City</th>
		                <th>Status</th>
		            </tr>
		        </tfoot>
		        <tbody>
		        
		        <c:forEach items="${listMembers }" var="member">
		        
		            <tr>
		                <td>${member.name }</td>
		                <td>${member.surname }</td>
		                <td>${member.sex }</td>
		                <td>${member.phone }</td>
		                <td>${member.city }</td>
		                <td>${member.status.name }</td>
		                <td><a href="/member/${member.id }" >View</a></td>
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



