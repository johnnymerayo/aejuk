<%@tag description="Extended checkbox tag to allow for sophisticated errors" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/pages/include.jsp" %>

<%@attribute name="addOptions" required="true" type="java.lang.String"%>
<%@attribute name="labelsFromResourceBundle" required="false" type="java.lang.Boolean"%>
<%@attribute name="delims" required="false" type="java.lang.Boolean"%>
<%@attribute name="isValueKeyInput" required="false" type="java.lang.Boolean"%>
<%@attribute name="isIdValueKeyInput" required="false" type="java.lang.Boolean"%>


<c:set value="addOptions" var="typeCheckRadio"/>

<spring:bind path="${path}">
 <%@ include file="/WEB-INF/tags/checkRadio_body.jsp" %>
</spring:bind>



