<%@ tag description="Extended input tag to allow for sophisticated errors" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/pages/include.jsp" %>
<%@ attribute name="path" required="true" type="java.lang.String"%>

 <spring:bind path="${path }">
 <%@ include file="/WEB-INF/tags/input_body.jsp" %>
 </spring:bind>
 
