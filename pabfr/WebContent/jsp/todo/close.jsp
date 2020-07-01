<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	this.$("#todo").load('<%=request.getContextPath()%>/todo/list');
	restore();
</script>

