<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="montantPaiements == null">0</s:if>
<s:else><s:property value="montantPaiements"/></s:else>

<script type="text/javascript">
	restore();
</script>











