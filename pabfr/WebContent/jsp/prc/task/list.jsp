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
	$('.ce').each ( function(){
	    $(this)[0].onmousedown = function() {
	        this.focus();
            $("#sortable1").sortable('disable');	        
	    };
	    $(this)[0].onmouseup = function() {
	        this.focus();
            $("#sortable1").sortable('enable');	        
	    };
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
		overlay();
		$("#taskforms").load('<%=request.getContextPath()%>/prc/taskGroup?tachesList=' + document.getElementById("tachesList").value
			+'&phase.id=' + idphase
		);
		restore();
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
	function detailTask(idphase, id){
		$("#collapse"+id).load('<%=request.getContextPath()%>/prc/taskDetailsList?id='+id+'&idphase='+idphase);
		//document.getElementById("collapse"+id).innerHTML= "iljk";/taskToUpdateowner?id='+id+'&idphase='+idphase
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
		                    <table class="table_process responsive-table" style="width:100%;margin-bottom:0px;">
		                      <thead>
		                        <tr>
		                          <td style="width:31%;padding-right:50px;"><b>ACTE | Nom de l'étape</b>&nbsp;<i class="box_clickable fa fa-sort"></i></td>
		                          <td class="hidden-xs"  style="width:10%"><b><s:text name="process_page.task_responsible"/></b>&nbsp;<i class="box_clickable fa fa-sort"></i></td>
		                          <td class="hidden-xs" style="width:10%"><b>Date</b>&nbsp;<i class="box_clickable fa fa-sort"></i></td>
		                          <td style="width:10%"><b>Dent</b>&nbsp;<i class="box_clickable fa fa-sort"></i></td>
		                          <td class="hidden-xs" style="width:10%"><b>Durée (min)</b>&nbsp;<i class="box_clickable fa fa-sort"></i></td>
		                          <td class="hidden-xs" style="width:10%"><b>Délai (jour)</b>&nbsp;<i class="box_clickable fa fa-sort"></i></td>
		                          <td class="visible-lg" style="width:10%"><b>Remarque</b></td>
		                          <td style="width:2%"></td>
		                          <td class="hidden-xs" style="width:2%"></td>
		                          <td style="width:2%"></td>
		                         </tr>
		                      </thead>    
		                    </table>
                  <div class="box-group" id="accordion">
				     <sj:div id="sortable1" sortableCursor="move" sortable="true" sortableOpacity="9" sortableOnUpdateTopics="onupdate" sortableHelper="clone" sortableForcePlaceholderSize="true" >
							<s:iterator value="tacheList" status="taskStatus">
				                    <div 
				                    	<s:if test="status == 'to_be_started'">
				                   			class="panel box box-707070 "  
				                    	</s:if>
				                    	<s:if test="status == 'blocked'">
				                   			class="panel box box-990000 "  
				                    	</s:if>
				                    	<s:if test="status == 'in_progress'">
				                   			class="panel box box-ff6600 "  
				                    	</s:if>
				                    	<s:if test="status == 'completed'">
				                   			class="panel box box-1A616F "  
				                    	</s:if>
				                   		id='<s:property value="id" />' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
				                          
						                    <table class="table_process responsive-table" style="width:100%;margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:31%;padding-left:5px;" 
														<s:if test="description == ''" >
															title="<s:property escape="false" value='nom'  />"
														</s:if><s:else>
															title="<s:property escape="false" value='nom'  /> &#013;Remarque :&#013;<s:property escape="false" value='description'  />"
														</s:else>						                          
						                          >
													<s:if test="type != 'etape'" >
						                          		<a class="no_underline box_clickable" 
								                          	<s:if test="phase.status == 'in_progress' || phase.status == 'in_progress_init' || phase.status == 'to_be_started' || phase.status == 'blocked'">
								                          		ondblclick='renameTask(<s:property value="id" />, <s:property value="idphase" />);'
								                          		title="<s:text name="label.subtitle.modify"/>"
								                          	</s:if>
						                          		>
															<b><s:property  value="%{type.toUpperCase()}" /></b> | <s:property value='montant'  />&nbsp;&euro;
						                          		</a>
													</s:if>
													<s:else>
						                          		<a class="no_underline box_clickable" 
								          					<s:if test="phase.status == 'in_progress' || phase.status == 'in_progress_init' || phase.status == 'to_be_started' || phase.status == 'blocked'">
								                          		ondblclick='renameTask(<s:property value="id" />, <s:property value="idphase" />);'
								                          		title="<s:text name="label.subtitle.modify"/>"
								                          	</s:if>
						                          		>
															<b><s:if test="nom.length() > 40" ><s:property escape="false"  value="%{nom.substring(0,40)}" />... </s:if>
															<s:else><s:property escape="false" value='nom'  /></s:else></b>
						                          		</a>
														<div class="ce" contentEditable="true" id="listEtapes_<s:property value='id'  />"
									                          <s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
								                          		ondblclick='updateTask(<s:property value="phase.id" />, <s:property value="id" />);' 
									                          </s:if> 
														></div>
														<script>this.$("#listEtapes_<s:property value='id'  />").load('<%=request.getContextPath()%>/prc/etapeListByTache?tache.id=<s:property value='id'  />');</script>
													</s:else>
						                          </td>
						                          <td class="hidden-xs box_clickable"  style="width:10%" 
						                          	<s:if test="phase.status == 'in_progress' || phase.status == 'in_progress_init' || phase.status == 'to_be_started' || phase.status == 'blocked'" >
						                          		ondblclick='changeOwnerTask(<s:property value="id" />, <s:property value="idphase" />);' 
						                          		title="<s:text name="label.subtitle.modify"/>" 
						                          	</s:if>	
						                          	>
						                          <a class="no_underline box_clickable" >
						                          <s:if test="responsable == null || responsable.isnull()" ><i class="fa fa-plus-circle "></i>
												  </s:if><s:else>
						                          	<s:property value="responsable" />&nbsp;&nbsp;
						                          </s:else>
						                          </a>
						                          </td>
						                          	
						                          <td class="hidden-xs box_clickable" style="width:10%;" 
						                          	<s:if test="phase.status == 'in_progress'  ||  phase.status == 'in_progress_init' || phase.status == 'to_be_started' || phase.status == 'blocked'">
						                          		ondblclick='changeStartDatePrevTask(<s:property value="id" />, <s:property value="idphase" />);' 
						                          		title="<s:text name="label.subtitle.modify"/>" 
						                          	</s:if>
						                          	> &nbsp;
						                          <a class="no_underline box_clickable" >
							                          <s:if test="dstartprev == null || dstartprev.isnull()" ><i class="fa fa-plus-circle "></i>
													  </s:if><s:else>
							                          	<s:date name="dstartprev" format="dd/MM/yyyy" />&nbsp;
							                          </s:else>
							                      </a>
						                          </td>
						                          <td style="width:10%;">
						                          <a class="no_underline box_clickable" 
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
						                          <td class="hidden-xs" style="width:10%;">
						                          <a class="no_underline box_clickable" 
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
						                          <td class="hidden-xs" style="width:10%" >
						                          <a class="no_underline box_clickable" 
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
						                          	  <td class="visible-lg" style="width:10%" ><s:property escape="false" value='description'  /></td>
												  	  <td style="width:2%"><i class="box_clickable  fa fa-arrows " title="Cliquer pour déplacer la séance"></i></td>
							                          <td style="width:2%">&nbsp;<a class="no_underline" style="color:#444;" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />" onclick="detailTask(<s:property value="idphase" />, <s:property value="id" />);"><i class="fa fa-plus-square box_clickable" onclick=";"></i></a></td>
							                          <td style="width:2%">&nbsp;<s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'"><i class=" fa fa-times-circle box_clickable" onclick="deleteTask(<s:property value="id" />);"></i></s:if></td>
							                          <td style="width:2%">&nbsp;<s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'"><s:if test="type == 'etape'" ><input class="uniform" id="checkbox_<s:property value="id" />" name="checkbox_<s:property value="id" />" type="checkbox" style="margin-bottom:3px;" onclick="javascript:aRegrouper(this, <s:property value="id" />);"></s:if></s:if></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>





				                      
				                      
				                      <div id="collapse<s:property value="id" />" 
				                      		class="panel-collapse collapse"
				                      >
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











