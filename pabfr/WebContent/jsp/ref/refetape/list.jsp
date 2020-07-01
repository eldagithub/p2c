<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
function validateForm(){
	javascript:goTo("<%=request.getContextPath()%>/jsp/adm/home.jsp");;
}

function updateEtapeActe(id, filed){
	overlay();
	$("#page_content").load('<%=request.getContextPath()%>/ref/updateRefEtape?refEtape.idacte=' + id
			+ '&refEtape.acte=' + escape(filed.value )
	);
}

function updateRefEtapeNom(id, filed){
	overlay();
	$("#page_content").load('<%=request.getContextPath()%>/ref/updateRefEtape?refEtape.idref=' + id
			+ '&refEtape.nom=' + escape(filed.value )
	);
}

function updateRefEtapeDuree(id, filed){
	overlay();
	$("#page_content").load('<%=request.getContextPath()%>/ref/updateRefEtape?refEtape.idref=' + id
			+ '&refEtape.duree=' + escape(filed.value )
	);
}

function updateRefEtapeDelai(id, filed){
	overlay();
	$("#page_content").load('<%=request.getContextPath()%>/ref/updateRefEtape?refEtape.idref=' + id
			+ '&refEtape.delai=' + escape(filed.value )
	);
}

function updateRefEtapeDescription(id, filed){
	overlay();
	$("#page_content").load('<%=request.getContextPath()%>/ref/updateRefEtape?refEtape.idref=' + id
			+ '&refEtape.description=' + escape(filed.value )
	);
}

function deleteRefEtape(id){
	overlay();
	$("#page_content").load('<%=request.getContextPath()%>/ref/deleteRefEtape?refEtape.idref=' + id
	);
}
function refEtapeToAdd(){
	overlay();
	$("#page_content").load('<%=request.getContextPath()%>/ref/refEtapeToAdd');
}
</script>

<span id="top"></span>

<div class="inner bg-light lter">
<br>

          <div class="row form-horizontal">
              <div class="col-lg-12">
              		<br>
                    <p class="lead">Liste des actes et étapes de traitement </p>
					<hr>
<s:form name="pForm3" action="#">					
		                    <table class="table responsive-table" style="margin-left:40px;width:1050px;">
		                      <thead>
		                        <tr>
		                          <td style="width:100px"><b>Acte</b></td>
		                          <td style="width:200px"><b>Nom de l'étape</b></td>
		                          <td style="width:100px"><b>Séance</b></td>
		                          <td style="width:50px"><b>Durée (min)</b></td>
		                          <td style="width:50px"><b>Délai (jour)</b></td>
		                          <td class="hidden-xs" style="width:50px"></td>
		                        </tr>
		                      </thead>
		                      <tbody>


	<s:if test="refEtapeList.size() > 0">
		<s:iterator value="refEtapeList" status="refEtapeStatus">


		                      	<tr>
		                      		<td>
 				                       	<input id="acte" name="acte" type="text" class="form-control" value="<s:property value="acte"/>" disabled>
		                      		</td>
		                      		<td>
 				                       	<input id="taskform_nom" name="taskform_nom" type="text" class="form-control" value="<s:property value="nom"/>" onchange="javascript:updateRefEtapeNom(<s:property value='idref' />, this);">
                        			</td>
		                      		<td>
		                      			<select class="form-control"  onchange="javascript:updateRefEtapeDescription(<s:property value='idref' />, this);">
			                      			<s:iterator begin="0" end="7" status="status">
				                      			<option value="Etape n°<s:property value="%{#status.count}"/>"
													<s:if test="description.substring(description.length() - 1)==#status.count"> selected </s:if>		             
				                      				>Séance n°<s:property value="%{#status.index+1}"/>
				                      			</option>
			                      			</s:iterator>
		                      			</select>
                        			</td>
		                      		<td>
										<input type="text" id="taskform_duree" name="taskform_duree" class="form-control" value="<s:property value="duree"/>" onchange="javascript:updateRefEtapeDuree(<s:property value='idref' />, this);" >
		                      		</td>
		                      		<td>
		                      			<input type="text" id="taskform_delai" name="taskform_delai" class="form-control" value="<s:property value="delai"/>"  onchange="javascript:updateRefEtapeDelai(<s:property value='idref' />, this);">
		                      		</td>
		                      		<td style="margin-top:7px;">
		                      			 <i class=" box_clickable fa fa-times-circle" onclick="deleteRefEtape(<s:property value='idref' />);"></i>  
		                      		</td>
		                      	</tr>


		</s:iterator> 
	</s:if>



		                      </tbody>
		                    </table>
                      <br><br><br>

</s:form>
                      <div class="form-group">
                       	  <label class="control-label col-lg-4"></label>
	                       <div class="col-lg-2 ">
	                        <input type="submit" value="<s:text name="button.label.new"/>" class="btn btn-metis-5 btn-flat"  onclick="javascript:refEtapeToAdd();">
	                      </div> 
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-flat"  onclick="javascript:validateForm();">
	                      </div>
              		  </div><!-- /.col-lg-12 -->
		
 			</div>
		</div>

</div>



<div id="foo" style="display: none"></div>


<script type="text/javascript">
	restore();
	document.location.href="#top";
</script>