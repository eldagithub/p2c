<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function userDel(){
		
		$("#foo").load('<%=request.getContextPath()%>/adm/delete?id=<%= request.getParameter("user.id") %>&active=<%= request.getParameter("what") %>');	
		alert("<s:text name='completed_page.message'/>");
		goTo("<%=request.getContextPath()%>/adm/listU");		
	}
</script>

<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted" id="desactive"><s:text name="admin_page.user.delete.subtitle"/></p>
                    <p class="text-muted" id="active">Etes vous sûr de vouloir activer cet utilisateur ?</p>
				<hr>
			</div>
		</div>

          <div class="row form-horizontal">
              <div class="col-lg-12">
					<s:form name="pForm" action="#">
						<input type="hidden" id="user.id"  name="user.id" value="<s:property value="user.id"/>">
						<input type="hidden" id="user.login"  name="user.login" value="<s:property value="user.login"/>">
						<input type="hidden" id="what"  value="<%= request.getParameter("what") %>">

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
                        <div class="col-lg-6"><input class="form-control" type="text" id="user.profile" name="user.profile" value="<s:property value='user.profile' />" /></div>
                      </div>
						<br><br>

					</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:userDel();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>
		
</div>		
		
<div id="foo" style="display:none"></div>






<script type="text/javascript">
	if (document.getElementById("what").value == 'no'){
		document.getElementById("active").style.display = "none";
	}else{
		document.getElementById("desactive").style.display = "none";
	}
	restore();
</script>








