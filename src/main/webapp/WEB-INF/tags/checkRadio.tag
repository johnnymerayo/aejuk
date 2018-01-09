<%@tag description="Extended checkbox tag to allow for sophisticated errors" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/pages/include.jsp" %>

<%@attribute name="items" required="true" type="java.util.Collection"%>
<%@attribute name="itemLabel" required="true" type="java.lang.String"%>
<%@attribute name="itemValue" required="true" type="java.lang.String"%>
<%@attribute name="labelClass" required="false" type="java.lang.String"%>
<%@attribute name="internazionalize" required="false" type="java.lang.Boolean"%>

<c:set value="items" var="typeCheckRadio"/>



<spring:bind path="${path}">
 <%@ include file="/WEB-INF/tags/checkRadio_body.jsp" %>
</spring:bind>