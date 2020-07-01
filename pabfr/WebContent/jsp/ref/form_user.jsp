<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function validateForm(){
		var nom = escape(document.getElementById("user.nom").value);
		var prenom = escape(document.getElementById("user.prenom").value);
		var email = escape(document.getElementById("user.email").value);
		var hpjournee = escape(document.getElementById("user.hpjournee").value);
		var hpsemaine = escape(document.getElementById("user.hpsemaine").value);
		
		if((nom != "") && (prenom != "") && (email != "") && (hpjournee != "") && (hpsemaine != "")){
			m=parseFloat(escape(document.getElementById("user.hpjournee").value));
			n=parseFloat(escape(document.getElementById("user.hpsemaine").value));
			  if ((isNaN(m) == true) || (isNaN(n)) == true) {
				    alert("Les honoraires programmés doivent être des chiffres uniquement.");
				  }else {
					m=Number(escape(document.getElementById("user.hpjournee").value));
					n=Number(escape(document.getElementById("user.hpsemaine").value));
					  if ((isNaN(m) == true) || (isNaN(n)) == true) {
						    alert("Les honoraires programmés doivent être des chiffres uniquement.");
					  }else {
							$("#page_content").load('<%=request.getContextPath()%>/adm/update?user.id=' + document.getElementById("user.id").value
									+ '&user.login=' + document.getElementById("user.login").value
									+ '&user.nom=' + escape(document.getElementById("user.nom").value)
									+ '&user.prenom=' + escape(document.getElementById("user.prenom").value)
									+ '&user.email=' + escape(document.getElementById("user.email").value)
									+ '&user.hpjournee=' + escape(document.getElementById("user.hpjournee").value)
									+ '&user.hpsemaine=' + escape(document.getElementById("user.hpsemaine").value)
									+ '&user.profile=' + document.getElementById("profile").options[profile.selectedIndex].value
							);
					  } 
				  }
		}else{
			alert("Veuillez compléter l'ensemble des champs du formulaire.");
		}
	}
	function validateFormP(){
		if( escape(document.getElementById("user.password").value) ==  escape(document.getElementById("user.password2").value)){
			$("#page_content").load('<%=request.getContextPath()%>/adm/updateP?user.id=' + document.getElementById("user.id2").value
					+ '&user.login=' + document.getElementById("user.login2").value
					+ '&user.oldpassword=' + escape(document.getElementById("user.oldpassword").value)
					+ '&user.password=' + escape(document.getElementById("user.password").value)
					+ '&user.password2=' + escape(document.getElementById("user.password2").value)
			);
		}else{
			alert("Les mots de passe doivent être identiques.");
		}
	}
</script>

<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.modify_user.title1"/></p>
				<hr>
			</div>
		</div>
          <div class="row form-horizontal">
              <div class="col-lg-12">
					<s:form name="pForm" action="#">
						<input type="hidden" id="user.id"  name="user.id" value="<s:property value="user.id"/>">
						<input type="hidden" id="user.login"  name="user.login" value="<s:property value="user.login"/>">

                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.user.login"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text"  value="<s:property value="user.login"/>" readonly ></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.user.entity"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="user.nom" name="user.nom" value="<s:property value="user.nom"/>" /></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.user.name"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="user.prenom" name="user.prenom" value="<s:property value="user.prenom"/>" /></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.user.email"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="user.email" name="user.email" value="<s:property value="user.email"/>" /></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.user.profile"/></label>
                        <div class="col-lg-6">
						<select id="profile" name="profile" class="form-control">
							<s:if test="profileList.size() > 0">
								<s:iterator value="profileList" status="profileStatus">
									
												<s:if test="nom=='LECTEUR'"><option value="<s:property value='nom' />" <s:if test="nom==user.profile">selected</s:if> > <s:text name="userprofile.lecteur"/></option></s:if>
												<s:if test="nom=='CONTRIBUTEUR'"><option value="<s:property value='nom' />" <s:if test="nom==user.profile">selected</s:if> > <s:text name="userprofile.contributeur"/></option></s:if>
												<s:if test="nom=='CONDUCTEUR'"><option value="<s:property value='nom' />" <s:if test="nom==user.profile">selected</s:if> > <s:text name="userprofile.conducteur"/></option></s:if>
												<s:if test="nom=='DIRECTEUR PROJETs'"><option value="<s:property value='nom' />" <s:if test="nom==user.profile">selected</s:if> > <s:text name="userprofile.directeurprocess"/></option></s:if>
												<s:if test="nom=='DIRECTEUR LIGNE'"><!-- <option value="<s:property value='nom' />" <s:if test="nom==user.profile">selected</s:if> > <s:text name="userprofile.directeurligne"/></option>--></s:if>
												<s:if test="nom=='full'"><option value="<s:property value='nom' />" <s:if test="nom==user.profile">selected</s:if> > <s:text name="userprofile.full"/></option></s:if>
									
								</s:iterator>
							</s:if>
						</select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.user.hpjournee"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="user.hpjournee" name="user.hpjournee" autocomplete="off" value="<s:property value="user.hpjournee"/>"  /></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.user.hpsemaine"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="user.hpsemaine" name="user.hpsemaine" autocomplete="off" value="<s:property value="user.hpsemaine"/>"  /></div>
                      </div>
						<br><br>

					</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='javascript:goTo("<%=request.getContextPath()%>/adm/listU");'>
	                      </div>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-flat"  onclick="javascript:validateForm();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>
<br>



        	<div class="row">
				<br>
              	<div class="col-lg-12">
                    <p class="text-muted"><s:text name="admin_page.modify_user.title2"/></p>
					<hr>
				</div>
			</div>
          	<div class="row form-horizontal">
            	<div class="col-lg-12">
					<s:form name="pFormP" action="#">
						<input type="hidden" id="user.id2" name="user.id2" value="<s:property value="user.id"/>">
						<input type="hidden" id="user.login2" name="user.login2" value="<s:property value="user.login"/>">
						
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="label.session_password"/></label>
                        <div class="col-lg-6"><input type="password" id="user.oldpassword" name="user.oldpassword" class="form-control" /></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="label.new_password"/></label>
                        <div class="col-lg-6"><input type="password" id="user.password" name="user.password" class="form-control" /></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="label.new_password2"/></label>
                        <div class="col-lg-6"><input type="password" id="user.password2" name="user.password2" class="form-control" /></div>
                      </div>
 					</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='javascript:goTo("<%=request.getContextPath()%>/adm/listU");'>
	                      </div>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-flat"  onclick="javascript:validateFormP();">
	                      </div>
                      </div>
              	</div><!-- /.col-lg-12 -->
			</div>
<br>


<div id="list_ratios"></div>








</div>


<script type="text/javascript">
	this.$("#list_ratios").load('<%=request.getContextPath()%>/adm/list_ratios2?objet.idresponsable='+<s:property value="user.id"/>);
	restore();
</script>






