<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<sj:head jquerytheme="vader"  jqueryui="true" locale="fr"/>
<script type="text/javascript">
   function pFormSubmit(status){
	   document.forms['pForm'].status.value=status;
	   document.forms['pForm'].submit();
   }
   $(function() {
       $(".columnme div div .ui-icon").click(function() {
           $(this).toggleClass("ui-icon-minusthick");
           $(this).parents(".columnme div").find(".portlet-content").toggle();
       });
   });
	$.subscribe('onupdate', function(event,data) {
	
	var order="";
	
	for (var i = 0; i < $("#sortable1").children().length; i++) {
		order=order+':'+$("#sortable1").children().eq(i).attr('id');
   }		
		//alert('all : ' + order  );
		
		taskOrder(order, <s:property value="phase.id" />);
	
	});

	function    taskOrder(order, idphase)
	{	
	 	this.$("#tacheList").load('<%=request.getContextPath()%>/prc/taskOrder?order='+order+"&phase.id=" + idphase);
	}
	function privatizeTask(idphase, id, what)
	{
			if(what=="Public"){
			 	this.$("#tacheList").load('<%=request.getContextPath()%>/prc/taskUpdate?idphase='+idphase+'&id='+id+'&tache.visibilite=yes');
			}else{
			 	this.$("#tacheList").load('<%=request.getContextPath()%>/prc/taskUpdate?idphase='+idphase+'&id='+id+'&tache.visibilite=no');
			}	
	 }
	function deleteTask(id)
	{
		document.getElementById("gedList").style.display="none";	 	
		document.getElementById("tacheList").style.display="none";
		document.getElementById("phaseList").style.display="none";	 	
		this.$("#taskforms").load('<%=request.getContextPath()%>/prc/taskToDelete?tache.id='+id);
	}
	function addTask(id, idref)
	{
		overlay();
		document.getElementById("gedList").style.display="none";	 	
		document.getElementById("tacheList").style.display="none";
		document.getElementById("phaseList").style.display="none";	 	
		this.$("#taskforms").load('<%=request.getContextPath()%>/prc/taskToAdd?idphase='+id+'&idref='+idref);
	}
	function addAct(id, idref)
	{
		overlay();
		document.getElementById("gedList").style.display="none";	 	
		document.getElementById("tacheList").style.display="none";
		document.getElementById("phaseList").style.display="none";	 	
		this.$("#taskforms").load('<%=request.getContextPath()%>/prc/acteToAdd?idphase='+id+'&idref='+idref);
	}
	function updateTask(idphase, idtache)
	{
		overlay();
		document.getElementById("gedList").style.display="none";	 	
		document.getElementById("tacheList").style.display="none";
		document.getElementById("phaseList").style.display="none";	 	
		this.$("#taskforms").load('<%=request.getContextPath()%>/prc/etapesToUpdate?idphase='+idphase+'&tache.id='+idtache+'&etape.idphase='+idphase+'&etape.idtache='+idtache);
	}
	function rollback(){
		document.getElementById("gedList").style.display="block";	 	
		document.getElementById("tacheList").style.display="block";
		document.getElementById("phaseList").style.display="block";	 	
		document.getElementById("taskforms").innerHTML="";	 	
	}
	function validatePhase(idphase, idprocess, status)
	{
		document.getElementById("gedList").innerHTML="";	 	
		document.getElementById("tacheList").innerHTML="";
		document.getElementById("phaseList").innerHTML="";	 	
		this.$("#taskforms").load('<%=request.getContextPath()%>/prc/activityUpdate?phase.id='+idphase
				+ '&process.id=' + idprocess
				+ '&phase.status=completed'
		);
	}
	function renameTask (id, idphase){
		document.getElementById("gedList").style.display="none";	 	
		document.getElementById("tacheList").style.display="none";
		document.getElementById("phaseList").style.display="none";	
		this.$("#taskforms").load('<%=request.getContextPath()%>/prc/taskToRename?id='+id+'&idphase='+idphase);
	}
	function changeOwnerTask (id, idphase){
		document.getElementById("gedList").style.display="none";	 	
		document.getElementById("tacheList").style.display="none";
		document.getElementById("phaseList").style.display="none";
		this.$("#taskforms").load('<%=request.getContextPath()%>/prc/taskToUpdateowner?id='+id+'&idphase='+idphase);
	}
	function changeStartDatePrevTask (id, idphase){
		document.getElementById("gedList").style.display="none";	 	
		document.getElementById("tacheList").style.display="none";
		document.getElementById("phaseList").style.display="none";	 	
		this.$("#taskforms").load('<%=request.getContextPath()%>/jsp/prc/task/change_start_date.jsp?id='+id+'&idphase='+idphase);
		//<%=request.getContextPath()%>/jsp/prc/task/change_start_date.jsp?idphase=<s:property value="idphase" />&id=<s:property value="id" />
	}
	function changeEndDatePrevTask (id, idphase){
		document.getElementById("gedList").style.display="none";	 	
		document.getElementById("tacheList").style.display="none";
		document.getElementById("phaseList").style.display="none";	 	
		this.$("#taskforms").load('<%=request.getContextPath()%>/jsp/prc/task/change_end_date.jsp?id='+id+'&idphase='+idphase);
		//<%=request.getContextPath()%>/jsp/prc/task/change_end_date.jsp?idphase=<s:property value="idphase" />&id=<s:property value="id" />
	}
	function rollback(){
		document.getElementById("gedList").style.display="block";	 	
		document.getElementById("tacheList").style.display="block";
		document.getElementById("phaseList").style.display="block";	 	
		document.getElementById("taskforms").innerHTML="";	 	
	}
	function taskUpdateDescription(_idphase, _id, _nom, _description){
		$("#taskforms").load('<%=request.getContextPath()%>/prc/taskUpdate?id=' + _id
				+ '&idphase=' + _idphase
				+ '&tache.nom=' + escape(_nom)
				+ '&tache.description=' + escape(_description)
		);	
	}
	function taskUpdateType(_idphase, _id, _type){
		$("#taskforms").load('<%=request.getContextPath()%>/prc/taskUpdate?id=' + _id
				+ '&idphase=' + _idphase
				+ '&tache.type=' + escape(_type)
		);	
	}
	function taskUpdateMontant(_idphase, _id, _montant){
		if(_montant != ""){
			if(checkNumber(_montant)){
				$("#taskforms").load('<%=request.getContextPath()%>/prc/taskUpdateMontant?id=' + _id
						+ '&idphase=' + _idphase
						+ '&tache.montant=' + escape(_montant)
				);	
			}	
		}else{
			alert('Un montant doit être renseigné.');
		}
	}

	function aRegrouper(item, id){
		if(item.checked){
			document.getElementById("tachesList").value = document.getElementById("tachesList").value + id + ";";
		}else{
			document.getElementById("tachesList").value=document.getElementById("tachesList").value.replace(id+";", "");
		}
	}
	function taskGroup(idphase){
		$("#taskforms").load('<%=request.getContextPath()%>/prc/taskGroup?tachesList=' + document.getElementById("tachesList").value
			+'&phase.id=' + idphase
		);
	}
	function checkNumber(montant){
		
		m=parseFloat(escape(montant));
		  if (isNaN(m) == true) {
			  alert("Le montant n'est pas un chiffre.");
			  return false;
			  }else {
				m=Number(escape(montant));
				  if (isNaN(m) == true) {
					  alert("Le montant n'est pas un chiffre.");
					  return false;
				  }else {
					  return true;
				  } 
			  }
	}
	function modifyPlanTTT(id){
		overlay();
		$("#page_content").load('<%=request.getContextPath()%>/prc/processSave2?process.id='+id);
	}
</script>  

<s:form name="pForm" action="/prc/taskUpdateStatus">
	<input type="hidden" name="id" id="id" >
	<input type="hidden" name="idphase" id="idphase" >
	<input type="hidden" name="status" id="status" >
	<input type="hidden" name="tachesList" id="tachesList" value="">
</s:form>

<s:if test="phase.id != null">
	<s:if test="tacheList.size() > 0">
		  <!-- /.row -->	
          <div class="row">
			<div class="col-lg-10">
		       <p class="text-muted"><s:text name="process_page.subtitle_tasks"/></p><br>
			</div>

	          <div class="col-lg-2">
				<s:if test="phase.status != 'to_be_started' && phase.status != 'completed'">
					<s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR' || #session.UserSessionKey.profile == 'DIRECTEUR LIGNE' || #session.UserSessionKey.profile == 'DIRECTEUR PROJET'">
						<a href="#" onclick='validatePhase(<s:property  value="phase.id" />, <s:property value="phase.idprocess" />,"completed");' 
						class="btn btn-metis-5 btn-flat btn-margin"
							<s:iterator value="tacheList" status="tacheStatus">
								<s:if test="status != 'completed'" > style="visibility:hidden;" </s:if>
							</s:iterator> ><s:text name="process_page.button.validate_phase"/></a>
					</s:if>
				</s:if>
			  </div>


	      </div>
	      <div class="row">
              <div class="col-lg-12">
                <div class="box-body">
		                    <table class="table_process responsive-table" style="margin-bottom:0px;">
		                      <thead>
		                        <tr>
		                          <td style="width:400px;padding-right:50px;"><b>ACTE | Nom de l'étape</b></td>
		                          <td class="hidden-xs"  style="width:150px"><b><s:text name="process_page.task_responsible"/></b></td>
		                          <td class="hidden-xs" style="width:150px"><b>Date</b></td>
		                          <td style="width:150px"><b>Dent</b></td>
		                          <td class="hidden-xs" style="width:150px"><b>Durée (min)</b></td>
		                          <td class="hidden-xs" style="width:150px"><b>Délai (jour)</b></td>
		                          <td class="visible-lg" style="width:150px"><b>Remarque</b></td>
		                          <td class="hidden-xs" style="width:50px"></td>
		                          <td style="width:50px"></td>
		                         </tr>
		                      </thead>    
		                    </table>
                  <div class="box-group" id="accordion">
				     <sj:div id="sortable1"  sortableCursor="move" sortable="true" sortableOpacity="9" sortableOnUpdateTopics="onupdate" sortableHelper="clone" sortableForcePlaceholderSize="true" >
							<s:iterator value="tacheList" status="taskStatus">
				                    <div 
				                    	<s:if test="status == 'to_be_started'">
				                   			class="panel box box-707070 "  
				                    	</s:if>
				                    	<s:if test="status == 'blocked'">
				                   			class="panel box box-990000 "  
				                    	</s:if>
				                    	<s:if test="status == 'in_progress'">
				                   			class="panel box box-1A616F "  
				                    	</s:if>
				                    	<s:if test="status == 'completed'">
				                   			class="panel box box-303030 "  
				                    	</s:if>
				                   		id='<s:property value="id" />' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
				                          
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:400px;padding-left:5px;" 
														<s:if test="description == ''" >
															title="<s:property escape="false" value='nom'  />"
														</s:if><s:else>
															title="<s:property escape="false" value='nom'  /> &#013;Remarque :&#013;<s:property escape="false" value='description'  />"
														</s:else>						                          
						                          >
													<s:if test="type != 'etape'" >
						                          		<a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />"
								                          	<s:if test="phase.status == 'in_progress' || phase.status == 'in_progress_init' || phase.status == 'to_be_started' || phase.status == 'blocked'">
								                          		ondblclick='renameTask(<s:property value="id" />, <s:property value="idphase" />);'
								                          		title="<s:text name="label.subtitle.modify"/>"
								                          	</s:if>
						                          		>
															<b><s:property  value="%{type.toUpperCase()}" /></b> | <s:property value='montant'  />&nbsp;&euro;
						                          		</a>
													</s:if>
													<s:else>
						                          		<a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />"
								          					<s:if test="phase.status == 'in_progress' || phase.status == 'in_progress_init' || phase.status == 'to_be_started' || phase.status == 'blocked'">
								                          		ondblclick='renameTask(<s:property value="id" />, <s:property value="idphase" />);'
								                          		title="<s:text name="label.subtitle.modify"/>"
								                          	</s:if>
						                          		>
															<b><s:if test="nom.length() > 40" ><s:property escape="false"  value="%{nom.substring(0,40)}" />... </s:if>
															<s:else><s:property escape="false" value='nom'  /></s:else></b>
						                          		</a>
														<div class="box_clickable" id="listEtapes_<s:property value='id'  />"  data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />"
									                          <s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
								                          		ondblclick='updateTask(<s:property value="phase.id" />, <s:property value="id" />);' 
									                          </s:if> 
														></div>
														<script>this.$("#listEtapes_<s:property value='id'  />").load('<%=request.getContextPath()%>/prc/etapeListByTache?tache.id=<s:property value='id'  />');</script>
													</s:else>
						                          </td>
						                          <td class="hidden-xs box_clickable"  style="width:150px" 
						                          	<s:if test="phase.status == 'in_progress' || phase.status == 'in_progress_init' || phase.status == 'to_be_started' || phase.status == 'blocked'" >
						                          		ondblclick='changeOwnerTask(<s:property value="id" />, <s:property value="idphase" />);' 
						                          		title="<s:text name="label.subtitle.modify"/>" 
						                          	</s:if>	
						                          	>
						                          <a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />">
						                          <s:if test="responsable == null || responsable.isnull()" ><i class="fa fa-plus-circle "></i>
												  </s:if><s:else>
						                          	<s:property value="responsable" />&nbsp;&nbsp;
						                          </s:else>
						                          </a>
						                          </td>
						                          	
						                          <td class="hidden-xs box_clickable" style="width:150px;" 
						                          	<s:if test="phase.status == 'in_progress'  ||  phase.status == 'in_progress_init' || phase.status == 'to_be_started' || phase.status == 'blocked'">
						                          		ondblclick='changeStartDatePrevTask(<s:property value="id" />, <s:property value="idphase" />);' 
						                          		title="<s:text name="label.subtitle.modify"/>" 
						                          	</s:if>
						                          	> &nbsp;
						                          <a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />">
							                          <s:if test="dstartprev == null || dstartprev.isnull()" ><i class="fa fa-plus-circle "></i>
													  </s:if><s:else>
							                          	<s:date name="dstartprev" format="dd/MM/yyyy" />&nbsp;
							                          </s:else>
							                      </a>
						                          </td>
						                          <td style="width:150px;">
						                          <a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />"
							                           <s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
						                          		ondblclick='updateTask(<s:property value="phase.id" />, <s:property value="id" />);' 
							                          </s:if> 
						                          >
						                          	<s:if test="type == 'etape'" >
														<div id="listDents_<s:property value='id'  />"></div>
														<script>this.$("#listDents_<s:property value='id'  />").load('<%=request.getContextPath()%>/prc/dentsListByTache?tache.id=<s:property value='id'  />');</script>
													</s:if>
													</a>
						                          </td>
						                          <td class="hidden-xs" style="width:150px;">
						                          <a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />"
							                           <s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
						                          		ondblclick='updateTask(<s:property value="phase.id" />, <s:property value="id" />);' 
							                          </s:if> 
						                          >
						                          	<s:if test="type == 'etape'" >
														<div id="DureeSeance_<s:property value='id'  />"></div>
														<script>this.$("#DureeSeance_<s:property value='id'  />").load('<%=request.getContextPath()%>/prc/dureeByTache?tache.id=<s:property value='id'  />');</script>
												  	</s:if>
												  </a>
												  </td>
						                          <td class="hidden-xs" style="width:100px" >
						                          <a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />"
							                           <s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
						                          		ondblclick='updateTask(<s:property value="phase.id" />, <s:property value="id" />);' 
							                          </s:if> 						                          
						                          >
						                          	<s:if test="type == 'etape'" >
														<div id="DelaiSeance_<s:property value='id'  />"></div>
														<script>this.$("#DelaiSeance_<s:property value='id'  />").load('<%=request.getContextPath()%>/prc/delaiByTache?tache.id=<s:property value='id'  />');</script>
												  	</s:if>
												  </a>
												  </td>
						                          	  <td class="visible-lg" style="width:150px" ><s:property escape="false" value='description'  /></td>
							                          <td style="width:40px">&nbsp;<s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'"><i class=" fa fa-times-circle box_clickable" onclick="deleteTask(<s:property value="id" />);"></i></s:if></td>
							                          <td style="width:40px">&nbsp;<s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'"><s:if test="type == 'etape'" ><input class="uniform" id="checkbox_<s:property value="id" />" name="checkbox_<s:property value="id" />" type="checkbox" style="margin-bottom:3px;" onclick="javascript:aRegrouper(this, <s:property value="id" />);"></s:if></s:if></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                      <div id="collapse<s:property value="id" />" 
				                      	<s:if test="%{#taskStatus.index == 0}">
				                      		class="panel-collapse collapse"
				                      	</s:if>
				                      	<s:if test="%{#taskStatus.index != 0}">
				                      		class="panel-collapse collapse"
				                      	</s:if>
				                      >
				                        <div class="box-body" style="padding-bottom:15px;">
											<br>	
											
											<!-- Nouveaux champs pour le cabinet dentaire -->
											<div class="row form-horizontal">
											<div class="col-lg-12">
											<div class="form-group">
											  <label class="control-label col-lg-4">Statut</label>
											  <div class="col-lg-8">
												<select id="statusTache"  name="statusTache" size="1" class="form-control" onchange="taskUpdateStatus(<%= request.getParameter("phase.idprocess") %>, <s:property value='idphase' />, <s:property value='id' />, this.value);">
													<option value="in_progress" <s:if test="status == 'in_progress'"> selected </s:if>>Démarré</option>
													<option value="blocked" <s:if test="status == 'blocked'"> selected </s:if>>En alerte</option>
													<option value="to_be_started" <s:if test="status == 'to_be_started'"> selected </s:if>>A démarrer</option>
													<option value="completed" <s:if test="status == 'completed'"> selected </s:if>>Terminé</option>
												</select>
											  </div>
											</div>
											<div class="form-group">
											  <label class="control-label col-lg-4">Type de l'étape</label>
											  <div class="col-lg-8">
												<select size="1" class="form-control" onchange="taskUpdateType(<s:property value='idphase' />, <s:property value='id' />, this.value);" >
													<option value="etape" <s:if test="type == 'etape'"> selected </s:if>>Etape de traitement</option>
													<option value="facture" <s:if test="type == 'facture'"> selected </s:if>>Facture</option>
													<option value="devis" <s:if test="type == 'devis'"> selected </s:if>>Devis</option>
													<option value="paiement" <s:if test="type == 'paiement'"> selected </s:if>>Paiement</option>
												</select>
											  </div>
											</div>
											<div class="form-group" <s:if test="type == 'etape'"> style="display:none;" </s:if> >
											  <label class="control-label col-lg-4">Montant</label>
											  <div class="col-lg-8">
											  	<input id="montantTache" name="montantTache" type="text" class="form-control" value="<s:property value='montant' />" onchange="taskUpdateMontant(<s:property value='idphase' />, <s:property value='id' />, this.value);" >
											  </div>
											</div>
											<div class="form-group">
											  <label class="control-label col-lg-4">Remarque</label>
											  <div class="col-lg-8">
											  	<textarea id="nom" name="nom" rows=4 class="form-control"  onchange="javascript:taskUpdateDescription(<s:property value="idphase" />, <s:property value="id" />, '<s:property value="nom" />', this.value);"><s:property escape="false" value='description'  /></textarea>
											  </div>
											</div>
																					
											<s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
											<div class="form-group">
											  <label class="control-label col-lg-9"></label>
											  <div class="col-lg-3 text-right">
													<s:if test="status != 'blocked'">
														<a href="#" style="margin-top:-10px;" class="btn btn-metis-1 btn-flat btn-margin" onclick="deleteTask(<s:property value="id" />);"><s:text name="process_page.button.delete"/></a>&nbsp;						
													</s:if>
													<s:if test="type == 'etape'">
													&nbsp;
														<a href="#" style="margin-top:-10px;" class="btn btn-metis-5 btn-flat btn-margin"  title="Cliquer pour modifier les champs de la tâche" onclick="updateTask(<s:property value="phase.id" />, <s:property value="id" />);"><s:text name="button.label.modify"/></a>&nbsp;
													</s:if>						
											  </div>
											</div>
											</s:if>
											
											</div>
											</div>
											
											



											
				                        </div>
				                      </div>
				                    </div>
							</s:iterator>
						</sj:div>
                   </div>
                </div><!-- /.box-body -->
              </div><!-- /.col-lg-12 -->
           </div>
           <!-- /.row -->
	</s:if>



	<s:if test="phase.status != 'completed' ">
	<s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
		<div class="col-lg-12">
			<div class="col-lg-8"></div>
			<div class="col-lg-3 text-right"><a href="#" class="btn btn-flat btn-margin bg-303030" title="Ajouter un devis, une facture, un paiement ou une étape de traitement" onclick='addTask(<s:property value='phase.id' />, <s:property value='phase.idref' />);'>+</a>
			&nbsp;<a href="#" class="btn btn-flat btn-margin bg-303030" title="Ajouter un acte" onclick='addAct(<s:property value='phase.id' />, <s:property value='phase.idref' />);'>++</a>
			&nbsp;<a href="#" class="btn btn-flat btn-margin bg-303030 hidden-xs" title="Modifier le plan de traitement" onclick="modifyPlanTTT(<s:property value="phase.idprocess" />);">Modifier</a>
			&nbsp;<a href="#" class="btn btn-flat btn-margin bg-303030" title="Regrouper des étapes de traitement" onclick="taskGroup(<s:property value='phase.id' />);">Regrouper</a>
			</div>
		</div>
	</s:if>
		
		<br>
		<br>
		<br>
		<br>

	</s:if>
</s:if>






<script type="text/javascript">
	restore();
</script>











