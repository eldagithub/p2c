<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function validateForm()
{
		$("#taskforms").load('<%=request.getContextPath()%>/prc/taskUpdate?id=' + document.getElementById("taskforms_id").value
				+ '&idphase=' + document.getElementById("taskforms_idphase").value
				+ '&tache.nom=' + escape(document.getElementById("tache.nom").value)
				+ '&tache.description=' + escape(document.getElementById("tache.description").value)
		);
		document.getElementById("phaseList").style.display="block";	 	
		document.getElementById("tacheList").style.display="block";
		document.getElementById("taskforms").innerHTML="";
		document.getElementById("gedList").style.display="block";
}
</script>
	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br><p class="lead"><s:text name="process_page.task.rename_title"/></p>
			<hr>
		</div>

		<s:form name="pForm" methode="post" action="#">
			<input type="hidden" id="taskforms_id" name="id" value="<%= request.getParameter("id") %>">
			<input type="hidden" id="taskforms_idphase" name="idphase" value="<%= request.getParameter("idphase") %>">

		  	<div class="col-lg-12">
	            <div class="form-group">
	                        <label class="control-label col-lg-2"><s:text name="process_page.task_name"/></label>
	                        <div class="col-lg-8">
	                        	<input id="tache.nom" name="tache.nom" type="text" id="text1" class="form-control" value="<s:property escape="false" value='tache.nom'  />">
	                        </div>
	             </div>
	            <div class="form-group">
	                        <label class="control-label col-lg-2"><s:text name="process_page.description"/></label>
	                        <div class="col-lg-8">
                          		<textarea id="tache.description" class="form-control" name="tache.description" ><s:property escape="false" value='tache.description'  /></textarea>
	                        </div>
	             </div>
	        </div>
  		</s:form>
		<br><br>
    	<div class="col-lg-12">
            <div class="form-group">
                        <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick="javascript:rollback();">
	                      </div>
	                      <div class="col-lg-1 ">
                        &nbsp;<input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick="validateForm();">
                       </div>
             </div>
		</div>
		<br><br><br><br><br><br><br><br><br>	
</div>
<script>
	document.location.href="#top";
</script>