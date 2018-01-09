<%@ include file="/WEB-INF/views/pages/include.jsp" %>

<!-- Common fields -->
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="min" required="false" type="java.lang.String"%>
<%@attribute name="max" required="false" type="java.lang.String"%>
<%@attribute name="step" required="false" type="java.lang.String"%>
<%@attribute name="minlength" required="false" type="java.lang.String"%>
<%@attribute name="maxlength" required="false" type="java.lang.String"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="tabindex" required="false" type="java.lang.String"%>
<%@attribute name="readonly" required="false" type="java.lang.Boolean"%>
<%@attribute name="disabled" required="false" type="java.lang.Boolean"%>
<%@attribute name="date" required="false" type="java.lang.Boolean"%>
<%@attribute name="withTime" required="false" type="java.lang.Boolean"%>
<%@attribute name="dateMaxDate" required="false" type="java.lang.String"%>
<%@attribute name="dateMinDate" required="false" type="java.lang.String"%>
<%@attribute name="gridClass" required="false" type="java.lang.String"%>
<%@attribute name="type" required="false" type="java.lang.String"%>
<%@attribute name="addHidden" required="false" type="java.lang.Boolean"%>
<%@attribute name="isArabic" required="false" type="java.lang.Boolean"%>
<%@attribute name="isNumeric" required="false" type="java.lang.Boolean"%>
<%@attribute name="isDecimal" required="false" type="java.lang.Boolean"%>
<%@attribute name="emptyLabel" required="false" type="java.lang.Boolean"%>
<%@attribute name="errorPath" required="false" type="java.lang.String"%>
<%@attribute name="disableCopyPaste" required="false" type="java.lang.Boolean"%>
<%@attribute name="placeholder" required="false" type="java.lang.String"%>
<%@attribute name="gridId" required="false" type="java.lang.String"%>
<%@attribute name="isIdenticalTo" required="false" type="java.lang.String"%>
<%@attribute name="isIdenticalToMsg" required="false" type="java.lang.String"%>
<%@attribute name="UKPhone" required="false" type="java.lang.Boolean"%>
<%@attribute name="value" required="false" type="java.lang.String"%>
<%@attribute name="tags" required="false" type="java.lang.Boolean"%>
<%@attribute name="prependText" required="false" type="java.lang.String"%>
<%@attribute name="prependIcon" required="false" type="java.lang.String"%>
<%@attribute name="appendText" required="false" type="java.lang.String"%>
<%@attribute name="appendIcon" required="false" type="java.lang.String"%>



<%-- 
	PARAMETERS:
	
		"path": [required] - "name": [required] 
		
		"id": Add a particular id. If it is empty id="${path}"
		"label": Add a particular label from resources file. If it is empty label=${path}
		"emptyLabel": Hide label
		"disabled": If true, disable the input
		"required": If true, add a * to the label
		"tabindex": Set tabindex order
		"cssClass": Add a particular class
		"gridClass": Set the class for the element position
		"addHidden": Add a hidden tag to send the value to the controller
		"min": Set the min
		"max": Set the max
		"step": Set the step
		"minlength": Set the minlength
		"maxlength": Set the maxlength
		"readonly": If true, set the input as readonly		
		"date": If true, add date features 
		"dateMaxDate": The maximum selectable date 
						Multiple types supported:
							Date: A date object containing the maximum date.
							Number: A number of days from today. For example 2 represents two days from today and -1 represents yesterday.
							String: A string in the format defined by the dateFormat option, or a relative date. Relative dates must contain value and period pairs; valid periods are "y" for years, "m" for months, "w" for weeks, and "d" for days. For example, "+1m +7d" represents one month and seven days from today.
		"dateMinDate": The minimun selectable date
						Multiple types supported:
							Date: A date object containing the minimum date.
							Number: A number of days from today. For example 2 represents two days from today and -1 represents yesterday.
							String: A string in the format defined by the dateFormat option, or a relative date. Relative dates must contain value and period pairs; valid periods are "y" for years, "m" for months, "w" for weeks, and "d" for days. For example, "+1m +7d" represents one month and seven days from today.
		"type": Set the type property 
		"isArabic": If true, show text from left to right
		"isNumeric": If true, only numeric characters are valid: 0123456789
		"isDecimal": If true, only numeric characters and dot are valid: .0123456789 
		"disableCopyPaste": If true, disable cut copy paste
		"placeholder": Set placeholder text
		"gridId": Set the id for the grid
		"prependText": Prepend a text to the input
		"prependIcon":Prepend a icon to the input
		"appendText": append a text to the input
		"appendIcon": append a icon to the input
		"putStartOn": id of the date field where you want to set the start date for the user to choose. Useful when you have two dates on a form and one of them can't be a previous day than the other.
		"withTime": if true, enables the user to choose time apart from the date.

	USAGE:
	
		<kms:input label="personalDetails.familyNameAra" path="${param.prePath}personaldetails.familyNameAra"
	 		isArabic="true" maxlength="100" disabled="${param.disabled}" gridClass="pure-u-1-4"/>		
	
		<kms:input id="dateOfbirth" label="personalDetails.dateOfbirth" path="${param.prePath}personaldetails.dateOfBirth" 
			date="true" dateYearRange="-60:+00" dateMaxDate="-1d" disabled="${param.disabled}" readonly="true"  gridClass="pure-u-1-4"/>
	
	
			<kms:inputName label="editLoginDetails.password" name="accessPassword" required="true" type="password" errorPath="${errorPassword}" gridClass="pure-u-1"/>
  --%>


<c:if test="${empty id and not empty path}">
	<c:set var="id" value="${fn:replace(path, '.', '_')}"/>
</c:if>


<c:if test="${empty id and not empty name}">
	<c:set var="id" value="${fn:replace(name, '.', '_')}"/>
</c:if>

<c:if test="${empty label}">
    <c:set var="label" value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" />
</c:if>

	
	<c:if test="${not empty gridClass}">
		<div class="${gridClass}"  id="${empty gridId?'':gridId}">
	</c:if>



    <div class="form-group ${(status.error or not empty messageError or not empty errorPath ) ? 'has-error has-feedback' : '' }">
        

		<c:if test="${empty emptyLabel or not emptyLabel}">
        	<label class="control-label" for="${path}">
        		${label}
        		<%-- <fmt:message key="${label}" /> --%>
        		<c:if test="${required}">&nbsp;<span class="required"><fmt:message key="mandatory.fieldMandatory" /></span>
        		</c:if>
        		
				<span id="${id}Error" class="errorform control-label"></span>
        	</label>
        </c:if>
        
        <div class="controls">
       		 <c:if test="${date }">
       			  <div class="input-group date" id="${id}" data-date="${path}" data-date-format="d MM yyyy"> 
       		 </c:if>
       		        		 		
				<c:if test="${addHidden}">   		
					<form:hidden path="${path}" />
				</c:if>
			
				
				<c:if test="${not empty prependText or not empty prependIcon or not empty appendText or not empty appendIcon }">
					 <div class="input-group">
				</c:if>		
					
					
				 <c:if test="${not empty prependText or not empty prependIcon}">
					 <span class="input-group-addon">
						<c:if test="${not empty prependIcon}">
							<i class="${prependIcon}"></i>
						</c:if>		
						<c:if test="${not empty prependText}">
							<fmt:message key="${prependText}" />	
						</c:if>					
					</span>
				</c:if>	 
										
				<c:if test="${type eq 'spinner' }">
					 <c:set value="number" var="type" />
					 
					 <c:if test="${ empty cssClass }">
						 <c:set value="input-sm" var="cssClass" />					 
					 </c:if>
										 
					 <c:set value="${cssClass} spinner" var="cssClass" />	
										 
				</c:if>		
							
			<c:if test="${not empty path }">				
				<form:input path="${path}" id="${id}"  
						min="${min!=null?min:'' }"
						max="${max!=null?max:'' }"
						step="${step!=null?step:'' }"
						minlength="${minlength!=null?minlength:'0' }"
						maxlength="${maxlength!=null?maxlength:'' }"
						tabindex="${empty tabindex?'':tabindex }"
						readonly="${readonly?true:false}" 
						required="${setRequired}"									
						disabled="${empty disabled?false:disabled }"
						type="${empty type?'text':type }" 
						cssClass="form-control  ${empty cssClass ? 'input-lg' : cssClass}"
						placeholder	="${empty placeholder ? '' : placeholder}"		
						
						/>	
				</c:if>			
						
				
			<c:if test="${not empty name }">		
					<input name="${name}" id="${id}"				  
						min="${min!=null?min:'' }"
						max="${max!=null?max:'' }"
						step="${step!=null?step:'' }"
						minlength="${minlength!=null?minlength:'0' }"
						maxlength="${maxlength!=null?maxlength:'' }"
						tabindex="${empty tabindex?'':tabindex }"
						${setValue}
						${readonly?readonly:''} 		
						${required?'required':''}					
						${disabled?'disabled':''}	
						type="${empty type?'text':type }" 
						class="form-control  ${empty cssClass ? 'input-lg' : cssClass}"
						placeholder	="${empty placeholder ? '' : placeholder}"	
						
					/>		
				</c:if>		
				
				<c:if test="${not empty appendText or not empty appendIcon}">
					 <span class="input-group-addon">
					 	<c:if test="${not empty appendText}">
							<i class="${appendIcon}"></i>
						</c:if>	
						<c:if test="${not empty appendText}">
							<fmt:message key="${appendText}" />		
						</c:if>				
					</span>
				</c:if>	
				
				<c:if test="${not empty prependText or not empty prependIcon or not empty appendText or not empty appendIcon }">
					  </div>
				</c:if>		
				
				
				 <c:if test="${status.error}">
					<span class="glyphicon glyphicon-remove form-control-feedback"></span>
				</c:if>
 					 	
       		           
            <c:if test="${date }">
           			 <span class="input-group-addon"><i class="fas fa-calendar"></i></span>
        		</div>
            </c:if> 
          
            <c:if test="${status.error}">
                <span class="control-label">${status.errorMessage}</span>
            </c:if>
        </div>
    </div>
    
     <c:if test="${date && not disabled}">
     	<c:set var="format" value="dd MM yyyy"/>
     	<c:set var="maxView" value="4"/>
      	<c:set var="minView" value="2"/>	
     	<c:if test="${withTime}">
      		<c:set var="format" value="dd MM yyyy hh:ii"/>
      		<c:set var="maxView" value="3"/>
      		<c:set var="minView" value="0"/>
     	</c:if>
		<script>
		$(document).ready(function() {	
		
			$('#<c:out value="${id}"/>').datetimepicker({
				autoclose: true,
				language: 'en',
				format: "<c:out value="${format}"/>",
				maxView: "<c:out value="${maxView}"/>",
				minView: "<c:out value="${minView}"/>",		
				disabled: true,
	 		  	<c:if  test="${not empty dateMaxDate}">   		
					 endDate: "<c:out value="${dateMaxDate}"/>",	
				</c:if>
				<c:if  test="${not empty dateMinDate}">   		
					 startDate: "<c:out value="${dateMinDate}"/>",	
				</c:if>
			}).on('changeDate', function(e) {
                <c:if  test="${not empty putStartOn}">
                	$('#<c:out value="${putStartOn}"/>').val('');
	   				$('#<c:out value="${putStartOn}"/>').datetimepicker('setStartDate', e.date);
	   				var otherName = $('#<c:out value="${putStartOn}"/>').attr('name');
	   				$(this).closest("form").bootstrapValidator('revalidateField', otherName);
                </c:if>
                // Get the field name 
                var field = $(this).attr('name');  
                $(this).closest("form").bootstrapValidator('revalidateField', field);
            });
			
			});
		</script>
	</c:if>
	<c:if test="${not empty gridClass}">
	    </div>
	</c:if>
	

	
	<c:if test="${isDecimal}">
		<script>
		
		$(document).ready(function() {	
		
		 $('#<c:out value="${id}"/>').keypress(function (e) {
		     //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && e.which != 46 &&  (e.which < 48 || e.which > 57)) {
		        //display error message
		        $('#<c:out value="${id}"/>Error').html("Digits Only").show().fadeOut("slow");
		      	return false;
		    }
		 });
		
		});
		</script>
	</c:if>
	
	<c:if test="${disableCopyPaste}">
		<script>		
			$(document).ready(function() {	
			
				$('#<c:out value="${id}"/>').bind("cut copy paste",function(e) {
		 		e.preventDefault();
				});
						
			});
		</script>
	</c:if>
	
	
	<c:if test="${tags}">
	 <script>
		        $(document).ready(function() { 
		        	$("#${id}").select2({	
		        		maximumInputLength: "${maxlength!=null?maxlength:'' }",	 
			            tags:[],
	         			tokenSeparators: [",", " "],
	         			formatNoMatches: function() {
					        return '';
					    },
					    dropdownCssClass: 'hidden',		        
	        	   	}).change(function(e) {
	        	   	 		// Get the field name 
			                var field = $(this).attr('name'); 		  
			                               
			                $(this).closest("form").bootstrapValidator('revalidateField', field);			               
			            }); 
		           });
		    </script>   
	</c:if> 
	
	