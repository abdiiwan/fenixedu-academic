<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="ServidorApresentacao.Action.sop.utils.SessionConstants" %>


 <bean:define id="infoStudentCurricularPlan" name="<%= SessionConstants.INFO_STUDENT_CURRICULAR_PLAN %>" scope="session" />
  <tr>
  <td>
  <table width="90%"  border="1" align='left'>
 <tr>
  <td align="left" valign="top">
   A pedido do interessado,<b><bean:write name="infoStudentCurricularPlan" property="infoStudent.infoPerson.nome"/></b>
  , aluno do curso de  <bean:write name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.infoDegree.nome"/>,
  portador do Documento de Identifica��o n� <bean:write name="infoStudentCurricularPlan" property="infoStudent.infoPerson.numeroDocumentoIdentificacao"/>,
  emitido em <bean:write name="infoStudentCurricularPlan" property="infoStudent.infoPerson.dataEmissaoDocumentoIdentificacao"/>, morador na 
  <bean:write name="infoStudentCurricularPlan" property="infoStudent.infoPerson.morada"/>, &nbsp;<bean:write name="infoStudentCurricularPlan" property="infoStudent.infoPerson.codigoPostal"/>
  &nbsp; <bean:write name="infoStudentCurricularPlan" property="infoStudent.infoPerson.localidade"/>, telefone&nbsp;
  <bean:write name="infoStudentCurricularPlan" property="infoStudent.infoPerson.telefone"/>.
  
  </td>
 </tr>
 
 <tr>
  <td align="left" valign="top">
  Declaro que est� matriculado neste Instituto no ano lectivo.
  </td>
 </tr>
 
 <tr>
  <td align="left" valign="top">
  Esta declara��o destina-se a fins comprovativos.
  </td>
 </tr>
 
 <tr><td>&nbsp;</td></tr>
 <tr><td>&nbsp;</td></tr>
 <tr><td>&nbsp;</td></tr>
  
 <tr>
  <td align="right" valign="top">
  A Chefe de Sec��o
  </td>
 </tr>
 
 <tr><td>&nbsp;</td></tr>
 <tr><td>&nbsp;</td></tr>
 
 <tr>
  <td align="left" valign="top">
  Data:
  </td> 
  <td align="right" valign="top">
  (Josefina Miranda)
  </td>
 </tr>
 
</table>
</td>
</tr>
</table>


