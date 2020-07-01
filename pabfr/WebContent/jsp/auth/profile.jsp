<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function validateForm(){
	goTo('<%=request.getContextPath()%>/profile/update?userprofile.id=' + document.getElementById("userprofile.id").value
			+ '&userprofile.login=' + document.getElementById("userprofile.login").value
			+ '&userprofile.nom=' + document.getElementById("userprofile.nom").value
			+ '&userprofile.prenom=' + document.getElementById("userprofile.prenom").value
			+ '&userprofile.email=' + document.getElementById("userprofile.email").value
	);
}
function validateFormP(){
	goTo('<%=request.getContextPath()%>/profile/updateP?userprofile.id=' + document.getElementById("userprofile.id").value
			+ '&userprofile.login=' + document.getElementById("userprofile.login").value
			+ '&userprofile.oldpassword=' + document.getElementById("userprofile.oldpassword").value
			+ '&userprofile.password=' + document.getElementById("userprofile.password").value
			+ '&userprofile.password2=' + document.getElementById("userprofile.password2").value
	);
}
</script>

<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
              <div class="col-lg-12">
                    <p class="lead"><s:text name="profile_page.title"/></p>
                    <br>
                    <p class="text-muted"><s:text name="profile_page.my_profile"/></p>
					<hr>

					<s:form name="pForm" action="#">
			 			<input type="hidden" id="userprofile.id"  name="userprofile.id" value="<s:property value="userprofile.id"/>" >
						<input type="hidden" id="userprofile.login" name="userprofile.login" value="<s:property value="userprofile.login"/>" >
							
                      	<div class="form-group">
                        	<label for="text4" class="control-label col-lg-3"><s:text name="label.login"/></label>
                        	<div class="col-lg-9">
                          		<input type="text" readonly placeholder="<s:property value="userprofile.login" />" class="form-control">
                        	</div>
                      	</div><!-- /.form-group -->
                      	
                       	<div class="form-group">
                        	<label for="text4" class="control-label col-lg-3"><s:text name="admin_page.user.profile"/></label>
                        	<div class="col-lg-9">
                          		<input type="text"  readonly
                          		
									<s:if test="userprofile.profile=='LECTEUR'"> placeholder="<s:text name="userprofile.finalclient" />" </s:if>
									<s:if test="userprofile.profile=='CONTRIBUTEUR'"> placeholder="<s:text name="userprofile.contributeur" />" </s:if>
									<s:if test="userprofile.profile=='CONDUCTEUR'"> placeholder="<s:text name="userprofile.conducteur" />" </s:if>
									<s:if test="userprofile.profile=='DIRECTEUR PROJETs'"> placeholder="<s:text name="userprofile.directeurprocess" />" </s:if>
									<s:if test="userprofile.profile=='full'"> placeholder="<s:text name="userprofile.full" />" </s:if>
                          		
                          		 
                          		 class="form-control">
                        	</div>
                      	</div><!-- /.form-group -->
                      	<div class="form-group">
                        	<label for="text4" class="control-label col-lg-3"><s:text name="label.name"/></label>
                        	<div class="col-lg-9">
                          		<input type="text" <s:if test="#session.UserSessionKey.profile == 'LECTEUR'"> readonly </s:if> id="userprofile.nom" name="userprofile.nom" value="<s:property value="userprofile.nom"/>" placeholder="<s:property value="userprofile.nom" />" class="form-control">
                        	</div>
                      	</div><!-- /.form-group -->
                      	
                      	<div class="form-group">
                        	<label for="text4" class="control-label col-lg-3"><s:text name="label.firstname"/></label>
                        	<div class="col-lg-9">
                          		<input type="text" <s:if test="#session.UserSessionKey.profile == 'LECTEUR'"> readonly </s:if> id="userprofile.prenom" name="userprofile.prenom" value="<s:property value="userprofile.prenom"/>" placeholder="<s:property value="userprofile.prenom" />" class="form-control">
                        	</div>
                      	</div><!-- /.form-group -->
                      	
                      	<div class="form-group">
                        	<label for="text4" class="control-label col-lg-3"><s:text name="label.email"/></label>
                        	<div class="col-lg-9">
                          		<input type="text" id="userprofile.email" name="userprofile.email" value="<s:property value="userprofile.email"/>" placeholder="<s:property value="userprofile.email" />" class="form-control">
                        	</div>
                      	</div><!-- /.form-group -->
					</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
	                      </div>
                      </div>


					<br>
					<br>
                    <p class="text-muted"><s:text name="profile_page.reset_password"/></p>
					<hr>
					<s:form name="pFormP" action="#">
						<input type="hidden" name="userprofile.id" value="<s:property value="userprofile.id"/>">
						<input type="hidden" name="userprofile.login" value="<s:property value="userprofile.login"/>">

                      	<div class="form-group">
                        	<label for="text4" class="control-label col-lg-3"><s:text name="label.old_password"/></label>
                        	<div class="col-lg-9">
                          		<input type="password" id="userprofile.oldpassword" name="userprofile.oldpassword" class="form-control">
                        	</div>
                      	</div><!-- /.form-group -->
                      	
                      	<div class="form-group">
                        	<label for="text4" class="control-label col-lg-3"><s:text name="label.new_password"/></label>
                        	<div class="col-lg-9">
                          		<input type="password" id="userprofile.password" name="userprofile.password" class="form-control">
                        	</div>
                      	</div><!-- /.form-group -->
                      	
                      	<div class="form-group">
                        	<label for="text4" class="control-label col-lg-3"><s:text name="label.new_password2"/></label>
                        	<div class="col-lg-9">
                          		<input type="password" id="userprofile.password2" name="userprofile.password2" class="form-control">
                        	</div>
                      	</div><!-- /.form-group -->
                      	
					</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateFormP();">
	                      </div>
                      </div>


              </div><!-- /.col-lg-12 -->
		</div>
<br>


<div id="list_ratios"></div>




</div>



<script type="text/javascript">
 	this.$("#list_ratios").load('<%=request.getContextPath()%>/adm/list_ratios');
	restore();
</script>


