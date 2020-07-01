<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="inner bg-light lter">
<br><br>

	<span id="top"></span>
	<div id="listProcessRead"></div>
		
	<div id="tacheList"></div>
</div>

<div class="row form-horizontal" id="foo"></div>

<script>
this.$("#listProcessRead").load("<%=request.getContextPath()%>/prc/listProcessReader?default_refprocess=3");
restore();
document.location.href="#top";

</script>

