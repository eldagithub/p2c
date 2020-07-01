<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.fr.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker3.min.css">
<script>
function validateForm(){
	var x=NonVide(document.getElementById("datepicker_form_seance").value);
	var y=NonVide(document.getElementById("taskform_nom").value);

	if (y){
		if(x){
			var z=CheckDate(document.getElementById("datepicker_form_seance").value);
			if(z ==1){
				$("#tacheList").load('<%=request.getContextPath()%>/prc/taskAdd?idphase=' + document.getElementById("taskforms_idphase").value 
						+ '&status=to_be_started' 
						+ '&visibilite=' + document.getElementById("visibilite").value 
						+ '&nom=' + escape(document.getElementById("taskform_nom").value) 
						+ '&idresponsable=' + document.getElementById("idresponsable").options[idresponsable.selectedIndex].value 
						+ '&dstartprev=' + document.getElementById("datepicker_form_seance").value 
						+ '&tache.description=' + escape(document.getElementById("tache.description").value)
						+ '&tache.montant=' + escape(document.getElementById("taskform_montantTache").value)
						+ '&tache.idref=' + escape(document.getElementById("taskforms_idref").value)
						+ '&tache.type=' + document.getElementById("typeTache").options[typeTache.selectedIndex].value 
				);
				document.getElementById("phaseList").style.display="block";	 	
				document.getElementById("tacheList").style.display="block";
				document.getElementById("taskforms").innerHTML="";
			}
		}else{
			$("#tacheList").load('<%=request.getContextPath()%>/prc/taskAdd?idphase=' + document.getElementById("taskforms_idphase").value 
					+ '&status=to_be_started' 
					+ '&visibilite=' + document.getElementById("visibilite").value 
					+ '&nom=' + escape(document.getElementById("taskform_nom").value) 
					+ '&idresponsable=' + document.getElementById("idresponsable").options[idresponsable.selectedIndex].value 
					+ '&dstartprev=' + document.getElementById("datepicker_form_seance").value 
					+ '&tache.description=' + escape(document.getElementById("tache.description").value)
					+ '&tache.montant=' + escape(document.getElementById("taskform_montantTache").value)
					+ '&tache.idref=' + escape(document.getElementById("taskforms_idref").value)
					+ '&tache.type=' + document.getElementById("typeTache").options[typeTache.selectedIndex].value 
			);
			document.getElementById("phaseList").style.display="block";	 	
			document.getElementById("tacheList").style.display="block";
			document.getElementById("taskforms").innerHTML="";
		}

	}else{
		alert('<s:text name="label.unvalidated_form"/>');
	}
}



$('.datepicker_form_seance').datepicker({
    language: "fr",
    weekStart: "1",
    format:"dd/mm/yyyy"
});

function typeChanged(item){
	if (item.value=="etape"){
		document.getElementById("divMontant").style.display = "none";
	}else{
		document.getElementById("divMontant").style.display = "block";
	}
}
</script>


          <div class="row form-horizontal">
              <div class="col-lg-12">
              		<br>
                    <p class="lead"><s:text name="process_page.button.add_task_title"/></p>
					<hr>
<s:form name="pForm3" action="#">
			<input type="hidden" id="taskforms_idphase" name="idphase" value="<s:property value='idphase' />">
			<input type="hidden" id="taskforms_idref" name="taskforms_idref" value="<s:property value='idref' />">
			<input type="hidden" id="status"  name="status" value="to_be_started" />
			<input type="hidden" id="visibilite"  name="visibilite" value="yes" />
					
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="process_page.task_name"/></label>
                        <div class="col-lg-8">
                        	<input id="taskform_nom" name="taskform_nom" type="text" class="form-control">
                        </div>
                      </div>
						<div class="form-group">
						  <label class="control-label col-lg-4">Type de l'étape</label>
						  <div class="col-lg-8">
							<select id="typeTache"  name="typeTache" size="1" class="form-control" onchange="typeChanged(this)">
								<option value="etape" selected >Etape de traitement</option>
								<option value="facture" >Facture</option>
								<option value="devis" >Devis</option>
								<option value="paiement" >Paiement</option>
							</select>
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
                      <div class="form-group" id="divMontant" style="display:none;">
                        <label class="control-label col-lg-4">Montant</label>
                        <div class="col-lg-8">
                        	<input id="taskform_montantTache" name="taskform_montantTache" type="text" class="form-control" placeholder="0">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="process_page.task_edateprev"/> * </label>
                        <div class="col-lg-8"><input type="text" id="datepicker_form_seance" name="dfinprev" placeholder="JJ/MM/YYYY" class="form-control datepicker_form_seance"></div>
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
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick="javascript:rollback();">
	                      </div>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>








<script type="text/javascript">
	restore();
</script>


