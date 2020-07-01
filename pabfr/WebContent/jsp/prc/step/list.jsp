<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="tache.id != null">
	<s:if test="etapeList.size() > 0">
		<s:iterator value="etapeList" status="etapeStatus">
			<s:property value='acte'  /> | <s:if test="nom.length() > 40" ><s:property escape="false"  value="%{nom.substring(0,40)}" />... </s:if>
													<s:else><s:property escape="false" value='nom'  /></s:else><br>
		</s:iterator> 
	</s:if>
</s:if>


<script type="text/javascript">
	restore();
</script>











