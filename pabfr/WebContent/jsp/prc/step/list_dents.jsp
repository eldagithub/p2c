<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="tache.id != null">
	<s:if test="etapeList.size() > 0">
		<s:iterator value="etapeList" status="etapeStatus">
			<s:if test="dent != 0" ><s:property value='dent' /></s:if><br>
		</s:iterator> 
	</s:if>
</s:if>


<script type="text/javascript">
	restore();
</script>











