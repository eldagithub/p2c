<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>

function validateForm()
{
		this.$("#taskforms").load('<%=request.getContextPath()%>/prc/taskDelete?id=' + document.getElementById("taskforms_id").value
				+ '&idphase=' + document.getElementById("idphase").value
		);
		document.getElementById("phaseList").style.display="block";	 	
		document.getElementById("tacheList").style.display="block";
		document.getElementById("gedList").style.display="block";
		
}
</script>
	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br><p class="lead"><s:text name="process_page.button.delete_task_confirmation"/> ?
	        	<br><br>
	        	<!--  : <br><i><s:property value="tache.getNom()" /></i> ?--></p>
		</div>
		
<s:form name="postForm"  action="#"  method="post"  >
	<input type="hidden" id="taskforms_id" name="id" value="<s:property value="tache.id" />">
	<input type="hidden" id="idphase" name="idphase" value="<s:property value="tache.idphase" />">
 
</s:form>
<br><br>
    	<div class="col-lg-12">
            <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick="javascript:rollback();">
	                      </div>
	                      <div class="col-lg-1 ">
                         &nbsp;<input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
                       </div>
             </div>
		</div>
	</div>

<br><br><br><br><br><br><br><br><br>
<script>
	document.location.href="#top";
</script>
