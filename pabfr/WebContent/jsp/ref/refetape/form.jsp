<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
function validateForm(){
   	
 	var x=NonVide(document.getElementById("refEtape.nom").value);
 	var y=NonVide(document.getElementById("refEtape.duree").value);
 	var z=NonVide(document.getElementById("refEtape.delai").value);
 	
 	if(x && y && z){
 		y = document.getElementById("refEtape.duree").value;
 		z = document.getElementById("refEtape.delai").value;
		m=parseFloat(y);
		n=parseFloat(z);
		  if ((isNaN(m) == true) || (isNaN(n)) == true) {
			    alert("Les duréé et délai doivent être des chiffres uniquement.");
			  }else {
				m=Number(y);
				n=Number(z);
				  if ((isNaN(m) == true) || (isNaN(n)) == true) {
					    alert("Les duréé et délai doivent être des chiffres uniquement.");
				  }else {
						overlay();
						$("#page_content").load('<%=request.getContextPath()%>/ref/addRefEtape?refEtape.idacte=' + document.getElementById("taskform_idacte").options[taskform_idacte.selectedIndex].value
								+ '&refEtape.nom=' + escape(document.getElementById("refEtape.nom").value)
								+ '&refEtape.duree=' + escape(y)
								+ '&refEtape.delai=' + escape(z)
						);
				  } 
			  }
	}else{
		alert("Veuillez compléter l'ensemble des champs du formulaire.");
	} 	
}

function rollbackListRefEtape(){
	javascript:goTo('<%=request.getContextPath()%>/ref/listRefEtape');
}

</script>

<span id="top"></span>

<div class="inner bg-light lter">
<br>

 
          <div class="row form-horizontal">
              <div class="col-lg-12">
              		<br>
                    <p class="lead">Nouvel acte</p>
					<hr>
<s:form name="pForm3" action="#">
                      <div class="form-group">
                        <label class="control-label col-lg-4">Nom de l'acte</label>
                        <div class="col-lg-8">
							<select id="taskform_idacte"  name="taskform_idacte" size="1" class="form-control" >
								<s:iterator value="actesunitList" status="status1">
									<option value="<s:property value="idacte"/>"><s:property value="acte"/></option>					
								</s:iterator>
							</select>
                        </div>
                      </div>
                                              
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4"><s:text name="label.name"/></label>
                        <div class="col-lg-8">
                          <textarea id="refEtape.nom" class="form-control" name="refEtape.nom" ></textarea>
                        </div>
                      </div><!-- /.form-group -->
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4">Durée</label>
                        <div class="col-lg-8">
                          <input type="text" id="refEtape.duree" class="form-control" name="refEtape.duree" >
                        </div>
                      </div><!-- /.form-group -->
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4">Délai</label>
                        <div class="col-lg-8">
                          <input type="text" id="refEtape.delai" class="form-control" name="refEtape.delai" >
                        </div>
                      </div><!-- /.form-group -->
</s:form>
     <br><br>                 <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick="javascript:rollbackListRefEtape();">
	                      </div>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>



</div>


<div id="foo" style="display: none"></div>

<script type="text/javascript">
	restore();
	document.location.href="#top";
</script>