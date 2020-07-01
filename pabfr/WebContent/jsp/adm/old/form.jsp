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


$( "#datepicker1" ).click(function() {
	   $( "#datepicker1" ).datepicker(
	    		{
	    			  firstDay: 1,
	    			  dateFormat: "dd/mm/yy",
	    			  monthNames: [ <s:text name="label.month_names"/> ],
	    			  dayNamesMin: [ <s:text name="label.week_names"/> ]
	    		}
	    );
	$( "#datepicker1" ).datepicker("show");
});
</script>


          <div class="row form-horizontal">
              <div class="col-lg-12">
              		<br>
                    <p class="lead"><s:text name="process_page.button.add_task_title"/></p>
					<hr>
<s:form name="pForm3" action="#">
			<input type="hidden" id="idphase" name="idphase" value="<s:property value='idphase' />">
			<input type="hidden" id="status"  name="status" value="to_be_started" />
			<input type="hidden" id="visibilite"  name="visibilite" value="yes" />
					
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
                        <label class="control-label col-lg-4"><s:text name="process_page.task_edateprev"/> * </label>
                        <div class="col-lg-8"><input type="text" id="datepicker1" name="dfinprev" placeholder="JJ/MM/YYYY"></div>
                      </div>
                      
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4"><s:text name="process_page.description"/></label>
                        <div class="col-lg-8">
                          <textarea id="tache.description" class="form-control" name="tache.description" ></textarea>
                        </div>
                      </div><!-- /.form-group -->
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4"></label>
                        <div class="col-lg-8">
                          <p class=" col-lg-4 text-muted"><s:text name="label.required_field"/></p>
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







<script>
</script>