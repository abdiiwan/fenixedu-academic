<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>
<%@page import="org.apache.struts.action.ActionMessages"%>

<html:xhtml />

<h2><bean:message key="label.internship.candidacy.title" bundle="INTERNSHIP_RESOURCES" /></h2>


<html:messages id="message" property="<%= ActionMessages.GLOBAL_MESSAGE %>" message="true" bundle="INTERNSHIP_RESOURCES">
    <p>
        <span class="error0"><!-- Error messages go here --><bean:write name="message" /></span>
    </p>
</html:messages>

<h3>NOTA:</h3>

<ul>
<li>
    <strong>Em meados de FEVEREIRO</strong>, ser�o afixadas as condi��es dos est�gios obtidos pela
	IAESTE Portugal e que, nessa altura, caso um dos est�gios me interesse, <strong>devo fazer
	a minha inscri��o.</strong>
</li>
<li>
    Sou obrigado a participar, ou fazer-me representar na reuni�o de atribui��o de est�gios a
	realizar em Mar�o.
</li>
<li>
    Caso n�o obtenha um est�gio nessa altura, devo entrar novamente em contacto com a IAESTE <strong>a
	partir do m�s de ABRIL</strong>, para continuar a ser considerado como candidato para novos
	est�gios que apare�am da� em diante.
</li>
</ul>

<p>Fa�a "Submeter" para concluir o processo de candidatura:</p>

<logic:present name="candidacy">
	<fr:form action="/internship.do">
		<input type="hidden" name="method" />
		<fr:edit id="confirm" name="candidacy" visible="false" />
		<html:submit onclick="this.form.method.value='backToCandidacy';">
			<bean:message bundle="COMMON_RESOURCES" key="button.back" />
		</html:submit>
		<html:submit onclick="this.form.method.value='confirmCandidacyRules'; this.disabled=true;">
			<bean:message bundle="COMMON_RESOURCES" key="button.submit" />
		</html:submit>
	</fr:form>
</logic:present>