<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<%@ page import="ServidorApresentacao.Action.sop.utils.SessionConstants" %>
<logic:present name="publico.infoClasses" scope="session">
<bean:define id="exePeriod" name="<%= SessionConstants.INFO_EXECUTION_PERIOD_KEY %>" property="name"/>
<bean:define id="exeYear" name="<%= SessionConstants.INFO_EXECUTION_PERIOD_KEY %>" property="infoExecutionYear"/>	
<bean:define id="exeYearName" name="exeYear" property="year"/>	
		
<table align="center">
		<tr>
			<th class="listClasses-header">
				<bean:message key="property.name"/>
			</th>
			<th class="listClasses-header">
				<bean:message key="property.context.semester"/>
			</td>
			<th class="listClasses-header">
				<bean:message key="property.context.curricular.year"/> 
			</th>
		</tr>		
	<logic:iterate id="classview" name="publico.infoClasses" scope="session">
		<tr>
			<td class="listClasses">
		
			<html:link page="<%= "/viewClassTimeTable.do?ePName=" + pageContext.findAttribute("exePeriod") + "&amp;eYName=" +pageContext.findAttribute("exeYearName") %>" paramId="className" paramName="classview" paramProperty="nome">
			<jsp:getProperty name="classview" property="nome"/>
			</html:link>
			</td>
			<td class="listClasses">
			<bean:write name="classview" property="infoExecutionPeriod.name"/>
			</td>
			<td class="listClasses">
			<jsp:getProperty name="classview" property="anoCurricular"/>
			</td>
		</tr>	
	</logic:iterate>
</table>
</logic:present>
<logic:notPresent name="publico.infoClasses" scope="session">
<table align="center" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<span class="error"><bean:message key="message.public.notfound.classes"/></span>
				</td>
			</tr>
</table>
</logic:notPresent>
