<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
<!--
	
	function    loadGare(id)
	{
		overlay();
		document.getElementById("list_admin_items").style.display="none";
		this.$("#admin_forms").load("<%=request.getContextPath()%>/ref/toEditGare?objet.idref="+id);
		//TINY.box.show({iframe:'<%=request.getContextPath()%>/ref/toEditGare?objet.idref='+id,width:390,height:160,opacity:60,topsplit:3});
	}
	function addGare(){
		overlay();
		document.getElementById("list_admin_items").style.display="none";	 	
		this.$("#admin_forms").load("<%=request.getContextPath()%>/jsp/ref/add_gare.jsp");
	}
	function deleteGare(id){
		document.getElementById("itemToDelete").value = id;	 	
		$('#myModal').modal();
	}
	function deleteGare2(id){
		document.getElementById("list_admin_items").style.display="none";	 	
		this.$("#admin_forms").load("<%=request.getContextPath()%>/ref/deleteGare?objet.idref="+ id);	
	}
//-->
</script>

<div class="inner bg-light lter" id="list_admin_items">
        <div class="row">
			<br>
            <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted"><s:text name="repository1.Name"/></p>
				<hr>
			</div>

        	<div class="col-lg-12">
	           <table class="table_process responsive-table" style="margin-bottom:0px;">
	             <thead style="font-weight:bold;">
	               <tr>
	                 <td class="hidden-xs"><s:text name="admin_page.field.id"/></td>
	                 <td><s:text name="admin_page.field.acronyme"/></td>
	                 <td class="hidden-xs"><s:text name="admin_page.field.details"/></td>
	                 <td style="width:50px;"></td>
	                 <td style="width:50px;"></td>
	                </tr><tr><td>&nbsp;</td></tr>
	             </thead>   
					<s:if test="objetList.size() > 0">
						<tbody>
						<s:iterator value="objetList" status="UserStatus">
								<tr>
									<td><a href="#" onclick="javascript: loadGare(<s:property value='idref' />)"><s:property value='idref' /></a></td>
									<td><a href="#" onclick="javascript: loadGare(<s:property value='idref' />)"><s:property value='nom' /></a></td>
									<td><a href="#" onclick="javascript: loadGare(<s:property value='idref' />)">
										<s:if test="description == null || description.isnull() || description == ''" ><i class="fa fa-plus-circle "></i>
										</s:if><s:else>
						                   	<s:property value="description" />&nbsp;&nbsp;
						                </s:else>									
									</a></td>
									<td style="width:50px;"><a href="#" onclick="javascript: loadGare(<s:property value='idref' />)"><i class="fa fa-edit"></i></a></td>
									<td style="width:50px;"><a href="#" onclick="javascript:deleteGare(<s:property value='idref' />);"><i class="fa fa-times-circle"></a></td>
	             				</tr>
						</s:iterator>
						</tbody>
					</s:if>
           		</table>
			<br><br>
			</div>		
			<div class="col-lg-12">
                <label class="control-label col-lg-5"></label>
                <div class="col-lg-6 ">
                  <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='javascript:goTo("<%=request.getContextPath()%>/adm/home");'>
                </div>
				<div class="col-lg-1 text-right"><a href="#" class="btn btn-flat btn-margin bg-303030" title="<s:text name="button.label.new"/>" onclick='addGare();'>+</a></div>	
				<br><br><br><br>
			</div>
		
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="color:black;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Etes-vous sûr de vouloir supprimer cet item ?</h4>
      </div>
      <div class="modal-body" style="color:black;">
       Cet item est susceptible d'être utilisé par un ou plusieurs processus. <br>L'information sera perdue. <br>La suppression est définitive.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-metis-1 btn-flat" onclick='deleteGare2(document.getElementById("itemToDelete").value);$("#myModal").modal("hide");'>Supprimer</button>
 		<div id="itemToDelete" style="display:none;"></div>
      </div>
    </div>
  </div>
</div>


<div id="admin_forms"></div>

<script type="text/javascript">
	restore();
</script>




