<%@tag description="Extended select tag to allow for sophisticated errors" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/pages/include.jsp" %>
<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="disabled" required="false" type="java.lang.Boolean"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="emptyOptionBlank" required="false" type="java.lang.Boolean"%>
<%@attribute name="tabindex" required="false" type="java.lang.String"%>
<%@attribute name="items" required="true" type="java.util.Collection"%>
<%@attribute name="itemLabel" required="true" type="java.lang.String"%>
<%@attribute name="itemValue" required="true" type="java.lang.String"%>
<%@attribute name="gridClass" required="false" type="java.lang.String"%>
<%@attribute name="onchange" required="false" type="java.lang.String"%>
<%@attribute name="internazionalize" required="false" type="java.lang.Boolean"%>
<%@attribute name="addHidden" required="false" type="java.lang.Boolean"%>
<%@attribute name="search" required="false" type="java.lang.Boolean"%>
<%@attribute name="emptyLabel" required="false" type="java.lang.Boolean"%>
<%@attribute name="sort" required="false" type="java.lang.Boolean"%>
<%@attribute name="gridId" required="false" type="java.lang.String"%>
<%@attribute name="zeroKeyOption" required="false" type="java.lang.String"%>


<%-- 
	PARAMETERS:

		"path": [required] 
		"items": [required] List of items to fill the select
		"itemLabel": [required] Property with the label
		"itemValue": [required] Property with the value
		
		"id": Add a particular id. If it is empty id="${path}"
		"cssClass": Add a particular class
		"label": Add a particular label from resources file. If it is empty label=${path}
		"emptyLabel": Hide label
		"disabled": If true, disable the select
		"required": If true, add a * to the label
		"emptyOptionBlank": Add a --- Select --- option with value null 
		"tabindex": Set tabindex order
		"gridClass": Set the class for the element position
		"onchange": Add an onchange event
		"internazionalize": The tag will search the itemLabel+Eng or itemLabel+Ara in order to internazionalize the label
		"addHidden": Add a hidden tag to send the value to the controller
		"search": Add advanced search features
		"sort": If true, sort it alphabetically. Not works with firefox
		"gridId": Set the id for the grid
		"zeroKeyOption": If not empty it adds an option with value 0 and that label


	USAGE:
	
		<kms:select label="select.label" path="animals"	itemLabel="animalName" itemValue="idAnimal"	items="${animalsList}" />
	
 --%>
 

<c:if test="${empty label}">
    <c:set var="label" value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" />
</c:if>

<c:if test="${empty id}">
	<c:set var="id" value="${fn:replace(path, '.', '_')}"/>
</c:if>


<spring:bind path="${path}">
	<c:if test="${not empty gridClass}">
	  	<div class="${gridClass}"  id="${empty gridId?'':gridId}">
	</c:if>
    <div class="form-group ${status.error ? 'has-error' : '' }">

    
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
        
		
		      <script>
		        $(document).ready(function() { $("#${id}").select2({
		       		 <c:if test="${search}">
		        	        	minimumResultsForSearch: 10,    							
		        	   </c:if>
		        	   <c:if test="${!search}">
		        	        	minimumResultsForSearch: 10,    							
		        	   </c:if>
		        	   	}); 
		           });
		    </script>    
	
		
			<c:if test="${addHidden}">   		
					<form:hidden path="${path}" />
			</c:if>
			
			<c:if test="${required}">
				<c:set value="required" var="setRequired" />
			</c:if>		
		  
            <form:select  id="${id}" path="${path}" 
            cssClass="form-control ${empty cssClass ? 'input-lg' : cssClass}" 
            tabindex="${empty tabindex?'':tabindex }" disabled="${empty disabled?false:disabled }" 
            onchange="${empty onchange?'':onchange }"
             required="${setRequired}"		>
	                     
				<c:if test="${emptyOptionBlank}">
	           		<form:option value=""><fmt:message key="common.selectOption" /></form:option>
				</c:if>
				<c:if test="${not empty zeroKeyOption}">
	           		<option value="0"><fmt:message key="${zeroKeyOption}"/></option>
				</c:if>
				
				<c:if test="${not internazionalize}">
					<form:options items="${items}" itemLabel="${itemLabel}" itemValue="${itemValue}" />
				</c:if>   
				<c:if test="${internazionalize}">
					<c:if test="${langEng}">
						<form:options items="${items}" itemLabel="${itemLabel}Eng"  itemValue="${itemValue}" />
					</c:if>
					<c:if test="${langAra}">
						<form:options items="${items}" itemLabel="${itemLabel}Ara" itemValue="${itemValue}" />
					</c:if>
				</c:if>
	            
            </form:select>
            <c:if test="${status.error}">
                <span class="control-label">${status.errorMessage}</span>
            </c:if>
        </div>
    </div>   
	<c:if test="${not empty gridClass}">
	    </div>
	</c:if>  
		
	
</spring:bind>

	

	<c:if test="${sort}">
		<script>		
			$(document).ready(function() {	

				function sortAlphabetical(a, b) {   
				    return (a.innerHTML.toLowerCase() > b.innerHTML.toLowerCase()) ? 1 : -1;
				};

				$('#<c:out value="${empty id?name:id }"/> option').sort(sortAlphabetical).appendTo('#<c:out value="${empty id?name:id }"/>');			
						
			});
		</script>
	</c:if>








