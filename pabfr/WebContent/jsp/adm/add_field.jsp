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
                    <p class="lead"><s:text name="admin_page.admin_account.metaprocess_mngt.add.field.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.admin_account.metaprocess_mngt.add.field.subtitle"/></p>
					<hr>
					<s:form name="pForm3" action="#">					
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.admin_account.metaprocess_mngt.add.phase.required"/></label>
                        <div class="col-lg-5">
							<select class="form-control" >
								<option>Champ texte</option>
								<option>Champ chiffré</option>
								<option>Date</option>
								<option>Liste d'objets</option>
								<option>Liste de personnes (annuaire)</option>
							</select>
                        </div>
                      </div>
					</s:form>
					<br><br>
                      <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick='goTo("<%=request.getContextPath()%>/jsp/adm/add_field_2.jsp");'>
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>
</div>





             
<script type="text/javascript">
	restore();
</script>




