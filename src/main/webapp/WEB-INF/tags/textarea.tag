<%@tag description="Extended textarea tag to allow for sophisticated errors" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/pages/include.jsp" %>
<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="id" required="false" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="minlength" required="false" type="java.lang.String"%>
<%@attribute name="maxlength" required="false" type="java.lang.String"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="disabled" required="false" type="java.lang.Boolean"%>
<%@attribute name="tabindex" required="false" type="java.lang.String"%>
<%@attribute name="readonly" required="false" type="java.lang.Boolean"%>
<%@attribute name="gridClass" required="false" type="java.lang.String"%>
<%@attribute name="labelClass" required="false" type="java.lang.String"%>
<%@attribute name="isArabic" required="false" type="java.lang.Boolean"%>
<%@attribute name="rows" required="false" type="java.lang.String"%>
<%@attribute name="cols" required="false" type="java.lang.String"%>
<%@attribute name="wysiwyg" required="false" type="java.lang.Boolean"%>
<%@attribute name="emptyLabel" required="false" type="java.lang.Boolean"%>
<%@attribute name="gridId" required="false" type="java.lang.String"%>
<%@attribute name="errorPath" required="false" type="java.lang.String"%>

<%-- 
	PARAMETERS:
	
		"path": [required] 
		
		"id": Add a particular id. If it is empty id="${path}"
		"label": Add a particular label from resources file. If it is empty label=${path}
		"labelClass": Add a particular class for the label
		"emptyLabel": Hide label
		"disabled": If true, disable the textarea
		"required": If true, add a * to the label
		"tabindex": Set tabindex order
		"cssClass": Add a particular class
		"gridClass": Set the class for the element position
		"minlength": Set the minlength
		"maxlength": Set the maxlength
		"readonly": If true, set the textarea as readonly	
		"isArabic": If true, show text from left to right
		"rows": Set number of rows
		"cols": Set number of cols
		"wysiwyg": If true, enable enhanced wysiwyg
		"gridId": Set the id for the grid
		"errorPath": Set the name of the validation message. By default is "messageError".

	USAGE:
	
		<kms:textarea label="complaint.content" path="complaint" maxlength="2000" wysiwyg="true" 
		labelClass="blue" cssClass="textEmail" gridClass="pure-u-1"/>
	
 --%>
<c:if test="${empty id}">
	<c:set var="id" value="${fn:replace(path, '.', '_')}"/>
</c:if> 
 
 <c:if test="${empty label}">
	<c:set var="label"
		value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" />
</c:if>

<spring:bind path="${path}">

	<c:if test="${not empty gridClass}">
		<div class="${gridClass}"  id="${empty gridId?'':gridId}">
	</c:if>


    <div class="form-group ${(status.error or not empty errorPath ) ? 'has-error has-feedback' : '' }">
        

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
             
	         <c:if test="${readonly}">
				<c:set value="readonly" var="setReadonly" />
			</c:if>		
					
			<c:if test="${required}">
				<c:set value="required" var="setRequired" />
			</c:if>		
					
	                
			<form:textarea path="${path}" id="${id}" 	
					required="${setRequired}"	
					minlength="${minlength!=null?minlength:'0' }"
					maxlength="${maxlength!=null?maxlength:'' }"
					rows="${rows!=null?rows:'' }"
					cols="${cols!=null?cols:'' }"
					tabindex="${empty tabindex?'':tabindex }"
					readonly="${setReadonly}"					
					disabled="${empty disabled?false:disabled }"
					cssClass="form-control ${empty cssClass ? 'input-lg' : cssClass}"	
					dir="${isArabic ? 'rtl' : 'ltr'}"	 				
			/>			
				
            <c:if test="${status.error}">
                <span class="control-label">${status.errorMessage}</span>
            </c:if>
            
			<c:if test="${not empty errorPath}">
				<span id="${empty id?name:id}Error" class="control-label"><c:out value="${errorPath}"/></span>
			</c:if>
        </div>
    </div>     
	<c:if test="${not empty gridClass}">
	    </div>
	</c:if>
</spring:bind>



	<c:if test="${wysiwyg}">
				
		<script type="text/javascript">
			
		$(document).ready(function() {	
			tinyMCE.init({
		        // General options
		        mode : "exact",
		        elements : "${id}",
		      	// theme : "modern",
		      	skin : 'light',


		        plugins: [
                "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                "table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
     			],
				height : "450",
				
		      
		        toolbar1: "bold italic underline  | alignleft aligncenter alignright alignjustify  | cut copy paste  | styleselect formatselect fontselect fontsizeselect  | bullist numlist  | link unlink image media code | table ",
		       
		
		        menubar: false,
		       
	      
       			paste_auto_cleanup_on_paste : true,
       			paste_remove_styles : true,
       			paste_text_sticky : true,
       			setup: function(editor) {	            
		            editor.on('keyup', function(e) {
		                $(this).closest("form").bootstrapValidator('revalidateField', '${path}');
		            });
       			}
			});
			
			
		});
		</script>
		
	</c:if>
	
	
	
	
	
	
	
	
