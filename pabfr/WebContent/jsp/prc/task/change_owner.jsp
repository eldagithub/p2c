<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function validateForm()
{
		$("#taskforms").load('<%=request.getContextPath()%>/prc/taskUpdate?id=' + document.getElementById("taskforms_id").value
				+ '&idphase=' + document.getElementById("taskforms_idphase").value
				+ '&idresponsable=' + document.getElementById("taskforms_idresponsable").options[taskforms_idresponsable.selectedIndex].value 
		);
		document.getElementById("phaseList").style.display="block";	 	
		document.getElementById("tacheList").style.display="block";
		document.getElementById("taskforms").innerHTML="";
		document.getElementById("gedList").style.display="block";
}
</script>
	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br><p class="lead"><s:text name="process_page.task.change_owner_title"/></p>
			<hr>
		</div>

		<s:form name="pForm" action="#">
			<input type="hidden" id="taskforms_id" name="id" value="<%= request.getParameter("id") %>">
			<input type="hidden" id="taskforms_idphase" name="idphase" value="<%= request.getParameter("idphase") %>">

		  	<div class="col-lg-12">
	            <div class="form-group">
	                        <label class="control-label col-lg-2"><s:text name="label.responsible"/></label>
	                        <div class="col-lg-8">
								<select id="taskforms_idresponsable"  name="taskforms_idresponsable" size="5" class="form-control" >
									<s:if test="ctList.size() > 0">
										<s:iterator value="ctList" status="ctStatus">
											<s:if test="nom!='elmos'">
												<option value="<s:property value='id' />"
													<s:if test="id==tache.idresponsable">selected</s:if>>
													<s:property value='nom' /> <s:property value='prenom' /> 
												</option>
											</s:if>
										</s:iterator>
									</s:if>
								</select>
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