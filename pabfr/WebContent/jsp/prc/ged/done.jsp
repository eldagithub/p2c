<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<body class="body_popup">


<div class="p_t_cadre">
	<div class="p_t_cadre_titre" style="padding-left:10px;">L'opération a été prise en compte.<s:property value="ged.idprocess" /></div>
<br><br>
	<div style="padding-left:130px;padding-top:0px;" >
		<div class="p_p_cadre_annuler" onclick="javascript: parent.gedRead(<s:property value="ged.idprocess" />);">Terminer</div>
	</div>
</div>


<script>
	parent.$("#gedList").load("<%=request.getContextPath()%>/ged/gedList?ged.idprocess=<s:property value="ged.idprocess" />");
	//window.location.hash = '#taskforms';

	parent.TINY.box.hide();
</script>


</body>
</html>
