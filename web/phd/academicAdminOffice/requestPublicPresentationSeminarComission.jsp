<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%@page import="net.sourceforge.fenixedu.domain.phd.PhdIndividualProgramDocumentType"%><html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr" %>


<logic:present role="ACADEMIC_ADMINISTRATIVE_OFFICE">
<bean:define id="processId" name="process" property="externalId" />

<%-- ### Title #### --%>
<em><bean:message  key="label.phd.academicAdminOffice.breadcrumb" bundle="PHD_RESOURCES"/></em>
<h2><bean:message key="label.phd.request.public.presentation.seminar.comission" bundle="PHD_RESOURCES" /></h2>
<%-- ### End of Title ### --%>


<%--  ###  Return Links / Steps Information(for multistep forms)  ### --%>
<html:link action="<%= "/phdIndividualProgramProcess.do?method=viewProcess&processId=" + processId.toString() %>">
	<bean:message bundle="PHD_RESOURCES" key="label.back"/>
</html:link>
<br/><br/>
<%--  ### Return Links / Steps Information (for multistep forms)  ### --%>

<%--  ### Error Messages  ### --%>
<jsp:include page="/phd/errorsAndMessages.jsp" />
<%--  ### End of Error Messages  ### --%>


<%--  ### Context Information (e.g. Person Information, Registration Information)  ### --%>
<strong><bean:message  key="label.phd.process" bundle="PHD_RESOURCES"/></strong>
<fr:view schema="AcademicAdminOffice.PhdIndividualProgramProcess.view" name="process">
	<fr:layout name="tabular">
		<fr:property name="classes" value="tstyle2 thlight mtop15" />
	</fr:layout>
</fr:view>
<%--  ### End Of Context Information  ### --%>

<br/>

<%--  ### Operation Area (e.g. Create Candidacy)  ### --%>

<fr:form action="<%="/phdIndividualProgramProcess.do?method=requestPublicPresentationSeminarComission&processId=" + processId.toString() %>">
	<fr:edit id="requestPublicPresentationSeminarComissionBean" name="requestPublicPresentationSeminarComissionBean" visible="false" />
	
	<fr:edit id="requestPublicPresentationSeminarComissionBean-generateAlert" name="requestPublicPresentationSeminarComissionBean">
		<fr:schema bundle="PHD_RESOURCES" type="net.sourceforge.fenixedu.domain.phd.seminar.PublicPresentationSeminarProcessBean">
			<fr:slot name="generateAlert" layout="radio-postback">
				<fr:property name="destination" value="postback"/>
			</fr:slot> 
		</fr:schema>

		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle5 thlight thright mtop05" />
			<fr:property name="columnClasses" value=",,tdclear tderror1" />
		</fr:layout>
		
		<fr:destination name="cancel" path="<%= "/phdIndividualProgramProcess.do?method=viewProcess&processId=" + processId.toString() %>" />
		<fr:destination name="postback" path="<%= "/phdIndividualProgramProcess.do?method=prepareRequestPublicPresentationSeminarComissionPostback&processId=" + processId.toString() %>" />
		<fr:destination name="invalid" path="<%= "/phdIndividualProgramProcess.do?method=prepareRequestPublicPresentationSeminarComissionInvalid&processId=" + processId.toString() %>" />
	</fr:edit>
	
	<logic:equal name="requestPublicPresentationSeminarComissionBean" property="generateAlert" value="true">
		<fr:edit id="requestPublicPresentationSeminarComissionBean-remarks"
			name="requestPublicPresentationSeminarComissionBean"
			schema="PublicPresentationSeminarProcessBean.edit.remarks">
		
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle5 thlight thright mtop05" />
				<fr:property name="columnClasses" value=",,tdclear tderror1" />
			</fr:layout>
		</fr:edit>
	</logic:equal>

<html:submit bundle="HTMLALT_RESOURCES" altKey="submit.submit"><bean:message bundle="PHD_RESOURCES" key="label.submit"/></html:submit>
<html:cancel bundle="HTMLALT_RESOURCES" altKey="cancel.cancel"><bean:message bundle="PHD_RESOURCES" key="label.cancel"/></html:cancel>

</fr:form>

<%--  ### End of Operation Area  ### --%>



<%--  ### Buttons (e.g. Submit)  ### --%>

<%--  ### End of Buttons (e.g. Submit)  ### --%>


</logic:present>