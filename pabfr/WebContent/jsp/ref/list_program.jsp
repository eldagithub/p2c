<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
<!--

	function    loadProgram(id)
	{
		overlay();
		document.getElementById("list_admin_items").style.display="none";
		this.$("#admin_forms").load("<%=request.getContextPath()%>/ref/toEditProgram?objet.idref="+id);
		//TINY.box.show({iframe:'<%=request.getContextPath()%>/ref/toEditProgram?objet.idref='+id,width:390,height:160,opacity:60,topsplit:3});
	}
	function addProgram(){
		overlay();
		document.getElementById("list_admin_items").style.display="none";	 	
		this.$("#admin_forms").load("<%=request.getContextPath()%>/jsp/ref/add_program.jsp");
	}
	function deleteProgram(id){
		document.getElementById("itemToDelete").value = id;	 	
		$('#myModal').modal();
	}
	function deleteProgram2(id){
		document.getElementById("list_admin_items").style.display="none";	 	
		this.$("#admin_forms").load("<%=request.getContextPath()%>/ref/deleteProgram?objet.idref="+ id);
	}
	function addUserProgram(id, nom, description){
		if (description != ""){
			$("#page_content").load('<%=request.getContextPath()%>/adm/addUserUpdateProgram?user.login=' +id
					+ '&user.nom=' + escape(nom)
					+ '&user.prenom=' + escape(description)
					+ '&user.hpjournee=0' 
					+ '&user.hpsemaine=0' 
					+ '&user.profile=LECTEUR'
					+ '&user.password=' + escape("dentaire")
					+ '&user.password2=' + escape("dentaire")
			);
		}else{
			alert("Tous les champs doivent �tre renseign�s.");
			restore();
		}
	}
//-->
</script>

<div class="inner bg-light lter" id="list_admin_items">
        <div class="row">
			<br>
            <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted"><s:text name="repository2.Name"/></p>
				<hr>
			</div>

        	<div class="col-lg-12">
	           <table class="table_process responsive-table" style="margin-bottom:0px;">
	             <thead style="font-weight:bold;">
	               <tr>
	                 <td class="hidden-xs"><s:text name="admin_page.field.id"/></td>
	                 <td><s:text name="label.name"/></td>
	                 <td class="hidden-xs"><s:text name="label.firstname"/></td>
	                 <td style="width:50px;"></td>
	                 <td style="width:50px;"></td>
	                 <td style="width:50px;"></td>
	                </tr><tr><td>&nbsp;</td></tr>
	             </thead>   
					<s:if test="objetList.size() > 0">
						<tbody>
							<s:iterator value="objetList" status="UserStatus">
								<tr>
									<td><a href="#" onclick='javascript: loadProgram(<s:property value="idref" />)' ><s:property value="idref" /></a></td>
									<td><a href="#" onclick='javascript: loadProgram(<s:property value="idref" />)' ><s:property value="nom" /></a></td>
									<td><a href="#" onclick='javascript: loadProgram(<s:property value="idref" />)' ><s:property value="description" /></a></td>
									<td style="width:50px;"><a title="Cliquer pour mettre � jour les informations du patient" href="#" onclick='javascript: loadProgram(<s:property value="idref" />);' ><i class="fa fa-edit"></i></a></td>
									<td style="width:50px;"><a  href="#" onclick='javascript:deleteProgram(<s:property value="idref" />);'><i class="fa fa-times-circle"></i></a></td>
									<td style="width:50px;">
										<s:if test="idresponsable == 0">
											<a title="Cliquer pour cr�er un compte utilisateur au patient" href="#" onclick='javascript: addUserProgram(<s:property value="idref" />, "<s:property value="nom" />", "<s:property value="description" />");' ><i class="fa fa-user"></i></a>
										</s:if>
									</td>
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
				<div class="col-lg-1 text-right"><a href="#" class="btn btn-flat btn-margin bg-303030" title="<s:text name="button.label.new"/>" onclick='addProgram();'>+</a></div>	
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
        <h4 class="modal-title" id="myModalLabel">Etes-vous s�r de vouloir supprimer cet item ?</h4>
      </div>
      <div class="modal-body" style="color:black;">
       Cet item est susceptible d'�tre utilis� par un ou plusieurs processus. <br>L'information sera perdue. <br>La suppression est d�finitive.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-metis-1 btn-flat" onclick='deleteProgram2(document.getElementById("itemToDelete").value);$("#myModal").modal("hide");'>Supprimer</button>
 		<div id="itemToDelete" style="display:none;"></div>
      </div>
    </div>
  </div>
</div>

<div id="admin_forms"></div>

<script type="text/javascript">
	restore();
</script>

