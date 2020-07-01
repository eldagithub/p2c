<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function    processDel(id)
{
	this.$("#page_content").load('<%=request.getContextPath()%>/prc/processDelete?id=' + id);
	pausecomp(200);
	this.$("#page_content").load('<%=request.getContextPath()%>/prc/home');
}
</script>

<div class="inner bg-light lter">
<br>

	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br><p class="lead"><s:text name="process_page.button.delete_process_confirmation"/> n° <%= request.getParameter("id") %><i><s:property value="process.nom" /></i> ?</p>
		</div>
		
		<s:form name="processForm"  action="/prc/processDelete"  method="post"  >
			<input type="hidden" name="id" value='<%= request.getParameter("id") %>' />	 
		</s:form>

    	<div class="col-lg-12">
            <div class="form-group">
                      <div class="col-lg-5 "></div>
                      <div class="col-lg-2 ">
                      <br><br>
                         &nbsp;<input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:processDel(<%= request.getParameter("id") %>);">
                       </div>
             </div>
		</div>
	</div>

<br><br><br><br><br><br><br><br><br><br>	
</div>


<script type="text/javascript">
	restore();
</script>
