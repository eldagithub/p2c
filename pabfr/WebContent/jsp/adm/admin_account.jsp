<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function validateForm(){
	}
</script>


<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.admin_account.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.admin_account.subtitle"/></p>
				<hr>
			</div>
		</div>
          <div class="row form-horizontal">
              <div class="col-lg-12">
					<s:form name="pForm" action="#">
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.admin_account.company_name"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text"  placeholder="<s:text name="client.compagny"/>"  value="<s:text name="client.compagny"/>" ></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.admin_account.email"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="" name="" placeholder="<s:text name="client.email_admin_func"/>" value="<s:text name="client.email_admin_func"/>" /></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.admin_account.admin_name"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="" name="" placeholder="<s:text name="client.name_admin_func"/>"  value="<s:text name="client.name_admin_func"/>" /></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="admin_page.admin_account.workspace_name"/></label>
                        <div class="col-lg-6"><input class="form-control" type="text" id="" name="" placeholder="<s:text name="client.namespace"/>"  value="<s:text name="client.namespace"/>" /></div>
                      </div>
						<br><br>

					</s:form>
                      <!-- <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
	                      </div>
                      </div-->
              </div><!-- /.col-lg-12 -->
		</div>
<br><br><br><br><br>

</div>



<script type="text/javascript">
	restore();
</script>






