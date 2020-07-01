<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function validateFormP(){
		overlay();
		var login = escape(document.getElementById("objet.login").value);
		var nom = escape(document.getElementById("objet.nom").value);
		var email = escape(document.getElementById("objet.email").value);

		if(nom != ""){
			if(document.getElementById("objet.createAccount").checked == true){
				if ((login != "") && (email != "")){
					$("#page_content").load('<%=request.getContextPath()%>/adm/addUserAndProgramme?user.login=' + login
							+ '&user.nom=' + nom
							+ '&user.prenom=' + escape(document.getElementById("objet.description").value)
							+ '&user.email=' + email
							+ '&user.hpjournee=0' 
							+ '&user.hpsemaine=0' 
							+ '&user.profile=LECTEUR'
							+ '&user.password=' + escape("dentaire")
							+ '&user.password2=' + escape("dentaire")
					);
				}else{
					alert("Tous les champs doivent être renseignés.");
					restore();
				}
			}else{
				$("#page_content").load('<%=request.getContextPath()%>/ref/addProgram?objet.categorie=' + document.getElementById("objet.categorie").value
					+ '&objet.idresponsable=' + escape(document.getElementById("objet.idresponsable").value)
					+ '&objet.nom=' + escape(document.getElementById("objet.nom").value)
					+ '&objet.description=' + escape(document.getElementById("objet.description").value)
				);
				restore();
			}
		}else{
			alert("Tous les champs doivent être renseignés.");
			restore();
		}
	}	
	function creationCompte(item){
		if(item.checked){
			document.getElementById("form-group-login").style.display = "block";
			document.getElementById("form-group-email").style.display = "block";
		}else{
			document.getElementById("form-group-login").style.display = "none";
			document.getElementById("form-group-email").style.display = "none";		
		}
	}
</script>

<div class="inner bg-light lter">
		<s:if test="hasActionErrors()">
			<script type="text/javascript">
				alert("Le login existe déjà.");
			</script>
		</s:if>
        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.add.title"/>&nbsp;<s:text name="repository2.Name"/></p>
				<hr>
			</div>
		</div>
          <div class="row form-horizontal">
              <div class="col-lg-12">
					<s:form name="pFormP" action="#">
						<input type="hidden" id="objet.categorie" name="objet.categorie" value="PROGRAMME">
						<input type="hidden" id="objet.idresponsable" name="objet.idresponsable" value="0">

                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="label.name"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="objet.nom" name="objet.nom" value="<s:property value="objet.nom"/>" ></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="label.firstname"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="objet.description" name="objet.description" value="<s:property value="objet.description"/>" ></div>
                      </div>
                      <div class="form-group" id="form-group-login" style="display:none;">
                        <label class="control-label col-lg-4"><s:text name="label.login"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="objet.login" name="objet.login" value="<s:property value="objet.login"/>" ></div>
                      </div>
                      <div class="form-group" id="form-group-email" style="display:none;">
                        <label class="control-label col-lg-4"><s:text name="label.email"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="objet.email" name="objet.email" value="<s:property value="objet.email"/>" ></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.add.create_account"/></label>
                        <div class="col-lg-1 text-left"><input class="form-control" style="width:30px;" type="checkbox" id="objet.createAccount" name="objet.createAccount" onchange="creationCompte(this);"></div>
                      </div>
                      
					</s:form>
              </div><!-- /.col-lg-12 -->
    				<div class="col-lg-12">
                      <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='javascript:goTo("<%=request.getContextPath()%>/ref/listProgram?objet.categorie=PROGRAMME");'>
	                      </div>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-flat"  onclick="javascript:validateFormP();">
	                      </div>
                      </div>
                     </div>
		</div>
<br>

</div>

<div id="fooProgramme" style="display:none;"></div>

<script type="text/javascript">
	restore();
</script>


