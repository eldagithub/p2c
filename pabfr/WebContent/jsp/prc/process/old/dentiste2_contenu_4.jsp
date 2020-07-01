<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"  %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/prc/process.css" type="text/css"	media="all" />


			<table class="tb_dents_actes">
					<s:iterator begin="4" end="4" status="chapeau">
							<s:iterator begin="0" end="7" status="status3">
							<tr class="th_titre_colonnes">
								<td class="td_titre_lignes"><s:property value="%{#status3.index+11+30}"/></td>
									<s:iterator value="actesunitList" status="status4">
										<td class="td_checkbox">
											<input onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#status3.index+11+30}"/>, <s:property value="idacte"/>);" 
											type="checkbox" id="dent<s:property value="%{#status3.index+11+30}"/>-<s:property value="idacte"/>">
										</td>
							 		</s:iterator>
						 	</tr>
							</s:iterator>
					<tr class="tr_separator"></tr>
					</s:iterator>
			</table>







						
				
<script type="text/javascript">
	restore();
	<s:iterator value="etapeList" status="status10">
	dentChecked(<s:property value='dent' />, <s:property value='idacte' />);</s:iterator>
	restore();
</script>
