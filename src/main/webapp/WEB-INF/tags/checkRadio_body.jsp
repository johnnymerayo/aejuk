
<%@ include file="/WEB-INF/views/pages/include.jsp" %>





<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="addHidden" required="false" type="java.lang.Boolean"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="disabled" required="false" type="java.lang.Boolean"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="tabindex" required="false" type="java.lang.String"%>
<%@attribute name="gridClass" required="false" type="java.lang.String"%>
<%@attribute name="gridId" required="false" type="java.lang.String"%>
<%@attribute name="emptyLabel" required="false" type="java.lang.Boolean"%>
<%@attribute name="inline" required="false" type="java.lang.Boolean"%>
<%@attribute name="isTypeRadio" required="false" type="java.lang.Boolean"%>
<%@attribute name="customColor" required="false" type="java.lang.String"%>
<%@attribute name="cssClassP" required="false" type="java.lang.String"%>
<%@attribute name="checkFooter" required="false" type="java.lang.String"%>
<%@attribute name="onchange" required="false" type="java.lang.String"%>

<%-- 
	PARAMETERS:

		"path": [required] 
		"items": [required] List of items to fill the check
		"itemLabel": [required] Property with the label
		"itemValue": [required] Property with the value
		
		"id": Add a particular id. If it is empty id="${path}"
		"cssClass": Add a particular class
		"label": Add a particular label from resources file. If it is empty label=${path}
		"labelClass": Add a particular class to the label
		"emptyLabel": Hide label
		"disabled": If true, disable the check
		"required": If true, add a * to the label 
		"tabindex": Set tabindex order
		"gridClass": Set the class for the element position
		"onchange": Add an onchange event
		"internazionalize": The tag will search the itemLabel+Eng or itemLabel+Ara in order to internazionalize the label
		"addHidden": Add a hidden tag to send the value to the controller
		"gridId": Set the id for the grid
		"inline": If true, display inline
		"isTypeRadio": If true, set radios instead of checks
		"customColor": Posible values, green, yellow and [blue]


	USAGE:
	
		<kms:check label="complaint.complaintType" itemLabel="type" itemValue="idComplaintType" labelClass="blue" 
		items="${complaintTypes}" path="complaintTypesForView" internazionalize="true" required="true" gridClass="pure-u-1-a"/>	
			
 --%>
 
 
<%-- 
	PARAMETERS:

		"path": [required] 
		"addOptions": [required] List of items to fill the select
		
		"id": Add a particular id. If it is empty id="${path}"
		"cssClass": Add a particular class
		"label": Add a particular label from resources file. If it is empty label=${path}
		"emptyLabel": Hide label
		"disabled": If true, disable the select
		"required": If true, add a * to the label
		"tabindex": Set tabindex order
		"gridClass": Set the class for the element position
		"onchange": Add an onchange event
		"addHidden": Add a hidden tag to send the value to the controller
		"labelsFromResourceBundle":If true, get the labels from the resource bundle
		"delims": Set the delims. Default delims are ":,;|"
		"isValueKeyInput": If true, the parameter "addOptions" is key_value type
		"isIdValueKeyInput" If true, the parameter "addOptions" is id_key_value type
		"cssClassP": Add a particular class to each check <li class="${cssClassP}">...</li>
		"checkFooter": Add a message from the resource bundle as footer after the check.
		"inline": If true, display inline
		"isTypeRadio": If true, set radios instead of checks
		"customColor": Posible values, green, yellow and [blue]

	USAGE:	
		
		<kms:checkCustom id="agreement${param.postId}" path="${param.prePath}agreement" addOptions="true_common.termsAndConditionsHeader" isValueKeyInput="true"
		cssClassP="blue" cssClass="conditions" required="true" disabled="${param.disabled}" addHidden="false" emptyLabel="true"
		labelsFromResourceBundle="true" checkFooter="bankDetails.agreementText"  />	
		
	NOTE: Look selectCustom for examples of use of "addOptions", "delims", "isValueKeyInput", "isIdValueKeyInput"
		

 --%>
 
 
 
 
<c:if test="${empty id}">
	<c:set var="id" value="${fn:replace(path, '.', '_')}"/>
</c:if>

<c:if test="${empty label}">
    <c:set var="label" value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" />
</c:if>


	<c:if test="${not empty gridClass}">
		<div class="${gridClass}"  id="${empty gridId?'':gridId}">
	</c:if>


    <div class="form-group ${status.error ? 'has-error has-feedback' : '' }">
        

		<c:if test="${empty emptyLabel or not emptyLabel}">
        	<label class="control-label" for="${path}">
        	${label}
        		<%-- <fmt:message key="${label}" /> --%>
        		<c:if test="${required}">&nbsp;<span class="required"><fmt:message key="mandatory.fieldMandatory" /></span>
        		</c:if>
        		
				<span id="${id}Error" class="errorform"></span>
        	</label>
        </c:if>
        
        <div class="controls">
       		        		 		
				<c:if test="${addHidden}">   		
					<form:hidden path="${path}" />
				</c:if>


				<c:set var="typeRadioCheck" value="checkbox"/>
				<c:if test="${isTypeRadio}">			
					<c:set var="typeRadioCheck" value="radio"/>
				</c:if>	
				
				
					<div id="${id}"  class="${empty cssClass ? '' : cssClass}">	  
				<c:if test="${typeCheckRadio eq 'items'}">			
						
					<c:forEach var="var" items="${items}" varStatus="status">  
				
							<c:set var="itemLabelInt" value="${itemLabel}"/>
							
							<c:if test="${internazionalize}">
								<c:if test="${langEng}">
									<c:set var="itemLabelInt" value="${itemLabel}Eng"/>
								</c:if>
								<c:if test="${langAra}">					
									<c:set var="itemLabelInt" value="${itemLabel}Ara"/>							
								</c:if>
							</c:if>
						
														
						<c:if test="${not inline}">						
							<div class="${typeRadioCheck}">
						</c:if>
						
							 <label  class="switch switch-3d switch-primary">
							 
							 		<c:if test="${isTypeRadio}">			
											<form:radiobutton id="${id}_${status.count }"  cssClass="switch-input ${cssClassP} ${inline?'radio-inline':''}" path="${path}" value="${var[itemValue]}"  disabled="${empty disabled?false:disabled }" 
											data-bv-notempty="${required}" minlength="0"  onchange="${empty onchange?'':onchange }" tabindex="${empty tabindex?'':tabindex }"/>
									</c:if>	
													
									<c:if test="${not isTypeRadio}">
											<form:checkbox id="${id}_${status.count }" cssClass="switch-input ${cssClassP} ${inline?'checkbox-inline':''}" path="${path}" value="${var[itemValue]}"  disabled="${empty disabled?false:disabled }" 
											data-bv-notempty="${required }" minlength="0"  onchange="${empty onchange?'':onchange }" tabindex="${empty tabindex?'':tabindex }" />
									</c:if>	
											   
							     
							     
           <span class="switch-label"></span>
           <span class="switch-handle"></span>
							  </label>
						
							     <c:out value="${var[itemLabelInt]}"/>
							     
						<c:if test="${not inline}">			
							</div>
						</c:if>	
							
					</c:forEach>				
				</c:if>	
				
				
				<c:if test="${typeCheckRadio eq 'addOptions'}">						
		  			<c:if test="${not empty addOptions}">		
						<c:if test="${empty delims}">
							<c:set var="delims" value=":,;|"/>
						</c:if>
						
							<c:forTokens items="${addOptions}" delims="${delims}" var="currentName"	varStatus="status">
							
								<c:if test="${isValueKeyInput}">				
									<c:forTokens items="${currentName}" delims="_" var="currentValue"	varStatus="stat">
										<c:set var="idCheck" value=""/>
										<c:if test="${stat.count eq 1 }">
											<c:set var="value" value="${currentValue}"/>
										</c:if>
										<c:if test="${stat.count eq 2 }">
											<c:set var="key" value="${currentValue}"/>
										</c:if>
									</c:forTokens>					
								</c:if>
								<c:if test="${isIdValueKeyInput}">				
									<c:forTokens items="${currentName}" delims="_" var="currentValue"	varStatus="stat">
										<c:if test="${stat.count eq 1 }">
											<c:set var="idCheck" value="${currentValue}"/>
										</c:if>
										<c:if test="${stat.count eq 2 }">
											<c:set var="value" value="${currentValue}"/>
										</c:if>
										<c:if test="${stat.count eq 3 }">
											<c:set var="key" value="${currentValue}"/>
										</c:if>
									</c:forTokens>					
								</c:if>
								<c:if test="${not isValueKeyInput and not isIdValueKeyInput }">
									<c:set var="idCheck" value=""/>
									<c:set var="value" value="${status.count}"/>
									<c:set var="key" value="${currentName}"/>				
								</c:if>
								
								
								<c:choose>
									<c:when test="${labelsFromResourceBundle}">
										<fmt:message key="${key}" var="msgLabel"/>
									</c:when>
									<c:otherwise>
										<c:set var="msgLabel" value="${key}"/>
									</c:otherwise>
								</c:choose>			
								
								
								<c:if test="${not inline}">						
									<div class="${typeRadioCheck}">
								</c:if>
								
									 <label class="switch switch-3d switch-primary">
									 
									 		<c:if test="${isTypeRadio}">			
																					
													<form:radiobutton id="${not empty idCheck?idCheck:value}" cssClass="switch-input ${cssClassP} ${inline?'radio-inline':''}"  path="${path}" value="${value}"  disabled="${empty disabled?false:disabled }"  
													 data-bv-notempty="${required}" minlength="0"	onchange="${empty onchange?'':onchange }" tabindex="${empty tabindex?'':tabindex }"/>
											
											</c:if>	
															
											<c:if test="${not isTypeRadio}">
												
													<form:checkbox id="${not empty idCheck?idCheck:value}" cssClass="switch-input ${cssClassP} ${inline?'checkbox-inline':''}"  path="${path}" value="${value}"  disabled="${empty disabled?false:disabled }"  
													 data-bv-notempty="${required}" minlength="0"	onchange="${empty onchange?'':onchange }" tabindex="${empty tabindex?'':tabindex }"/>
											
											</c:if>	
										   
																				
																				
									           <span class="switch-label"></span>
									           <span class="switch-handle"></span>
									  </label>
								
											${msgLabel} 
								<c:if test="${not inline}">			
									</div>
								</c:if>	
								
																	
							</c:forTokens>		
					</c:if>	
				</c:if>
					
				<c:if test="${not empty checkFooter}">
					<p> <fmt:message key="${checkFooter}"/></p>
				</c:if>						
											
							
	  			</div>
			
				
			 <c:if test="${status.error}">
				<span class="glyphicon glyphicon-remove form-control-feedback"></span>
			</c:if>

            <c:if test="${status.error}">
                <span class="control-label">${status.errorMessage}</span>
            </c:if>
        </div>
    </div>
<c:if test="${not empty gridClass}">
    </div>
</c:if>  



<c:if test="${empty customColor}">
    <c:set value="blue" var="customColor"  />
</c:if>  







<!-- 

<script>
$(document).ready(function(){
  $("input[id^='<c:out value="${id}"/>']" ).iCheck({
    checkboxClass: 'icheckbox_flat-${customColor}',
    radioClass: 'iradio_flat-${customColor}'
  }).on('ifChanged', function(e) {
                // Get the field name 
                alert("aaaa");
                var field = $(this).attr('name');      
                $(this).closest("form").bootstrapValidator('revalidateField', field);
            });
});
</script> -->


