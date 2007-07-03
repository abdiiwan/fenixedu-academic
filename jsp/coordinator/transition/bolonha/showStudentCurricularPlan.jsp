<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html:xhtml />
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>


<logic:present role="COORDINATOR">
	<h2><bean:message key="label.curricularPlan"
		bundle="APPLICATION_RESOURCES" /> - <bean:write name="registration" property="lastStudentCurricularPlan.degreeCurricularPlan.presentationName"/></h2>
		


	
	<logic:notEmpty name="registration" property="lastStudentCurricularPlan.credits">
		<div class="infoop2">
			<bean:message  key="label.coordinator.transition.bolonha.message.part1" bundle="APPLICATION_RESOURCES"/>
			<bean:message  key="label.coordinator.transition.bolonha.message.part2" bundle="APPLICATION_RESOURCES"/>
		</div>
		<br/>	
		<fr:view	name="registration" 
					property="lastStudentCurricularPlan.credits" 
					schema="student.Dismissal.view.dismissals.for.bolonha.transition">
			<fr:layout name="tabular">
				<fr:property name="classes" value="tstyle4 thlight thcenter" />
				<fr:property name="columnClasses" value=",inobullet ulmvert0,inobullet ulmvert0,," />
			</fr:layout>
		</fr:view>
	</logic:notEmpty>
	<logic:empty name="registration" property="lastStudentCurricularPlan.credits">
		<i><bean:message  key="label.transition.bolonha.noEquivalences"/></i>
	</logic:empty>
		

</logic:present>
