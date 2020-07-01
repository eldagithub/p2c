<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
function validateForm(){
	var x=NonVide(document.getElementById("datepicker1").value);
	var y=NonVide(document.getElementById("nom").value);
	var z=CheckDate(document.getElementById("datepicker1").value);

	if(z ==1){
		if (x && y){
			$("#tacheList").load('<%=request.getContextPath()%>/prc/taskAdd?idphase=' + document.getElementById("idphase").value 
					+ '&status=' + document.getElementById("status").value 
					+ '&visibilite=' + document.getElementById("visibilite").value 
					+ '&nom=' + escape(document.getElementById("nom").value) 
					+ '&idresponsable=' + document.getElementById("idresponsable").options[idresponsable.selectedIndex].value 
					+ '&dfinprev=' + document.getElementById("datepicker1").value 
					+ '&tache.description=' + escape(document.getElementById("tache.description").value)
			);
			document.getElementById("phaseList").style.display="block";	 	
			document.getElementById("task_forms").innerHTML="";
		}else{
			alert('<s:text name="label.unvalidated_form"/>');
		}
	}
}


</script>


<div class="inner bg-light lter">
          <div class="row form-horizontal">
              <div class="col-lg-12">
              		<br>
                    <p class="lead"><s:text name="process_page.button.add_task_title"/></p>
					<hr>
					<s:form name="pForm3" action="#">
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="process_page.task_name"/></label>
                        <div class="col-lg-8">
                        	<input id="nom" name="nom" type="text" class="form-control">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="process_page.task_responsible"/></label>
                        <div class="col-lg-8">
							<select id="idresponsable"  name="idresponsable" size="5" class="form-control" >
								<s:if test="ctList.size() > 0">
									<s:iterator value="ctList" status="ctStatus">
										<s:if test="nom!='elmos'">
										<option value="<s:property value='id' />"
											<s:if test=" #ctStatus.first == true ">selected</s:if>>
											<s:property value='nom' /> <s:property value='prenom' /> 
										</option>
										</s:if>
									</s:iterator>
								</s:if>
							</select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4"><s:text name="process_page.description"/></label>
                        <div class="col-lg-8">
                          <textarea id="tache.description" class="form-control" name="tache.description" ></textarea>
                        </div>
                      </div><!-- /.form-group -->
					</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>
</div>





             
<script type="text/javascript">
	restore();
</script>




