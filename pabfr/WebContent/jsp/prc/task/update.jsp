<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
function validateForm(){
			$("#tacheList").load('<%=request.getContextPath()%>/prc/taskList?phase.id=' + document.getElementById("taskform_idphase").value);
			document.getElementById("phaseList").style.display="block";	 	
			document.getElementById("tacheList").style.display="block";
			document.getElementById("gedList").style.display="block";
			document.getElementById("taskforms").innerHTML="";
}

function updateEtapeNom(id, filed){
	$("#taskforms").load('<%=request.getContextPath()%>/prc/updateEtape?etape.id=' + id
			+ '&tache.id=' + document.getElementById("taskform_idtache").value
			+ '&tache.idphase=' + document.getElementById("taskform_idphase").value
			+ '&nom=' + escape(filed.value )
	);
}

function updateEtapeDuree(id, filed){
	overlay();
	$("#taskforms").load('<%=request.getContextPath()%>/prc/updateEtapeDuree?etape.id=' + id
			+ '&tache.id=' + document.getElementById("taskform_idtache").value
			+ '&tache.idphase=' + document.getElementById("taskform_idphase").value
			+ '&etape.duree=' + escape(filed.value )
	);
}

function updateEtapeDelai(id, filed){
	overlay();
	$("#taskforms").load('<%=request.getContextPath()%>/prc/updateEtapeDelai?etape.id=' + id
			+ '&tache.id=' + document.getElementById("taskform_idtache").value
			+ '&tache.idphase=' + document.getElementById("taskform_idphase").value
			+ '&etape.delai=' + escape(filed.value )
	);
}

function updateEtapeDent(id, filed){
	$("#taskforms").load('<%=request.getContextPath()%>/prc/updateEtapeDent?etape.id=' + id
			+ '&tache.id=' + document.getElementById("taskform_idtache").value
			+ '&tache.idphase=' + document.getElementById("taskform_idphase").value
			+ '&etape.dent=' + escape(filed.value )
	);
}

function deleteEtape(id){
	$("#taskforms").load('<%=request.getContextPath()%>/prc/deleteEtape?etape.id=' + id
			+ '&tache.id=' + document.getElementById("taskform_idtache").value
			+ '&tache.idphase=' + document.getElementById("taskform_idphase").value
	);
}
</script>






<s:if test="etapeList.size() > 0">
          <div class="row form-horizontal">
              <div class="col-lg-12">
              		<br>
                    <p class="lead">Modification des étapes de traitement de la séance</p>
					<hr>
<s:form name="pForm3" action="#">
			<input type="hidden" id="taskform_id" name="taskform_id" value="<s:property value='id' />">
			<input type="hidden" id="taskform_idphase" name="taskform_idphase" value="<s:property value='tache.idphase' />">
			<input type="hidden" id="taskform_idtache" name="taskform_idtache" value="<s:property value='tache.id' />">
			<input type="hidden" id="status"  name="status" value="to_be_started" />
			<input type="hidden" id="visibilite"  name="visibilite" value="yes" />
					
		                    <table class="table responsive-table" style="margin-left:40px;width:1050px;">
		                      <thead>
		                        <tr>
		                          <td style="width:100px"><b>Acte</b></td>
		                          <td style="width:200px"><b>Nom de l'étape</b></td>
		                          <td style="width:50px"><b>Dent</b></td>
		                          <td style="width:50px"><b>Durée (min)</b></td>
		                          <td style="width:50px"><b>Délai (jour)</b></td>
		                          <td class="hidden-xs" style="width:50px"></td>
		                        </tr>
		                      </thead>
		                      <tbody>


		<s:iterator value="etapeList" status="etapeStatus">


		                      	<tr>
		                      		<td>
 				                       	<input id="acte" name="acte" type="text" class="form-control" value="<s:property value="acte"/>" disabled>
		                      		</td>
		                      		<td>
 				                       	<input id="taskform_nom" name="taskform_nom" type="text" class="form-control" value="<s:property value="nom"/>" onchange="javascript:updateEtapeNom(<s:property value='id' />, this);">
                        			</td>
		                      		<td>
										<select id="secteur"  name="secteur" size="1" class="form-control" onchange="javascript:updateEtapeDent(<s:property value='id' />, this);">
													<option selected>--</option>
													<option <s:if test="dent=='11'" > selected </s:if>>11</option>
													<option <s:if test="dent=='12'" > selected </s:if>>12</option>
													<option <s:if test="dent=='13'" > selected </s:if>>13</option>
													<option <s:if test="dent=='14'" > selected </s:if>>14</option>
													<option <s:if test="dent=='15'" > selected </s:if>>15</option>
													<option <s:if test="dent=='16'" > selected </s:if>>16</option>
													<option <s:if test="dent=='17'" > selected </s:if>>17</option>
													<option <s:if test="dent=='18'" > selected </s:if>>18</option>
													<option <s:if test="dent=='21'" > selected </s:if>>21</option>
													<option <s:if test="dent=='22'" > selected </s:if>>22</option>
													<option <s:if test="dent=='23'" > selected </s:if>>23</option>
													<option <s:if test="dent=='24'" > selected </s:if>>24</option>
													<option <s:if test="dent=='25'" > selected </s:if>>25</option>
													<option <s:if test="dent=='26'" > selected </s:if>>26</option>
													<option <s:if test="dent=='27'" > selected </s:if>>27</option>
													<option <s:if test="dent=='28'" > selected </s:if>>28</option>
													<option <s:if test="dent=='31'" > selected </s:if>>31</option>
													<option <s:if test="dent=='32'" > selected </s:if>>32</option>
													<option <s:if test="dent=='33'" > selected </s:if>>33</option>
													<option <s:if test="dent=='34'" > selected </s:if>>34</option>
													<option <s:if test="dent=='35'" > selected </s:if>>35</option>
													<option <s:if test="dent=='36'" > selected </s:if>>36</option>
													<option <s:if test="dent=='37'" > selected </s:if>>37</option>
													<option <s:if test="dent=='38'" > selected </s:if>>38</option>
													<option <s:if test="dent=='41'" > selected </s:if>>41</option>
													<option <s:if test="dent=='42'" > selected </s:if>>42</option>
													<option <s:if test="dent=='43'" > selected </s:if>>43</option>
													<option <s:if test="dent=='44'" > selected </s:if>>44</option>
													<option <s:if test="dent=='45'" > selected </s:if>>45</option>
													<option <s:if test="dent=='46'" > selected </s:if>>46</option>
													<option <s:if test="dent=='47'" > selected </s:if>>47</option>
													<option <s:if test="dent=='48'" > selected </s:if>>48</option>
										</select>
		                      		</td>
		                      		<td>
										<input type="text" id="taskform_duree" name="taskform_duree" class="form-control" value="<s:property value="duree"/>" onchange="javascript:updateEtapeDuree(<s:property value='id' />, this);" >
		                      		</td>
		                      		<td>
		                      			<input type="text" id="taskform_delai" name="taskform_delai" class="form-control" value="<s:property value="delai"/>"  onchange="javascript:updateEtapeDelai(<s:property value='id' />, this);">
		                      		</td>
		                      		<td style="margin-top:7px;">
		                      			<i class=" box_clickable fa fa-times-circle" onclick="deleteEtape(<s:property value='id' />);"></i>
		                      		</td>
		                      	</tr>


		</s:iterator> 



		                      </tbody>
		                    </table>
                      <br><br><br>

</s:form>
		
                      <div class="form-group">
                       	  <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-flat"  onclick="javascript:validateForm();">
	                      </div>
              		  </div><!-- /.col-lg-12 -->
			</div>
		</div>
<div id="foo" style="display: none"></div>


</s:if>
<s:else>
     <div class="row form-horizontal">
         <div class="col-lg-12">
         		<br>
               <p class="lead">Vous n'avez pas d'étapes de traitement pour cette séance.</p>
				<hr>
		</div>
	</div>
   	<div class="col-lg-12">
           <div class="form-group">
                      <label class="control-label col-lg-5"></label>
                      <div class="col-lg-1 ">
                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick="javascript:rollback();">
                      </div>
           </div>
	</div>
	<br><br><br><br><br><br><br><br><br>	

</s:else>

<script type="text/javascript">
	restore();
	document.location.href="#top";
</script>