<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<br><br>
<div class="row">
	<div class="col-lg-1"></div>
	<div class="col-lg-11">
	       <p class="text-muted">Etes-vous sur de vouloir supprimer le document numéro "<%= request.getParameter("ged.id") %>" ?</p><br>
	</div>
</div>
<div class="col-lg-12">
	<div class="form-group">
		<div class="col-lg-5 "></div>
		<div class="col-lg-1 ">
			&nbsp;<input type="submit" value="<s:text name="button.label.validate"/>"  onclick="javascript: loadDelGed(<%= request.getParameter("ged.id") %>, <%= request.getParameter("ged.idprocess") %>);" class="btn btn-primary">
		</div>
		<div class="col-lg-1 ">
			&nbsp;<input type="submit" value="<s:text name="button.label.cancel"/>" onclick="javascript: cancel();" class="btn btn-metis-5 btn-flat">
		</div>
	</div>
</div>
<br><br>
<script>
	function    loadDelGed(id, idprocess)
	{
		$("#gedList").load("<%=request.getContextPath()%>/ged/delete?ged.id="+id+"&ged.idprocess="+idprocess);
		$("#taskforms").load("<%=request.getContextPath()%>/jsp/blanc.jsp");
	}
	
	function cancel(){
		$("#taskforms").load("<%=request.getContextPath()%>/jsp/blanc.jsp");
	}
</script>



</body>
</html>
