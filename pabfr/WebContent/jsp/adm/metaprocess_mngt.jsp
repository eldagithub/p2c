<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	function validateForm(){
	}
</script>


<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-10">
                    <p class="lead"><s:text name="admin_page.admin_account.metaprocess_mngt.title"/></p>
	          </div>
	          <div class="col-lg-2">
	          		<a href="#" class="btn btn-metis-5 btn-flat btn-margin" onclick='goTo("<%=request.getContextPath()%>/jsp/adm/add_metaprocess.jsp");'><s:text name="admin_page.admin_account.metaprocess_mngt.add_title"/></a>
	          </div>
              <div class="col-lg-12">
                    <p class="text-muted"><s:text name="admin_page.admin_account.metaprocess_mngt.activated_process"/></p>
				<hr>
			</div>
		</div>
		<s:iterator status="item" begin="1" end="2">
          <div class="row form-horizontal">
              <div class="col-lg-2"></div>
              
              <div class="col-lg-8">
                <div class="box-body">
                  <div class="box-group" id="accordion">
                    <div class="panel box box-1A616F" id='<s:property value="id" />' style="margin-bottom:0px;">
                      <div class="box-header with-border">
                        <h4 class="box-title">
		                    <table class="table_process responsive-table" style="margin-bottom:0px;">
		                      <tbody>
		                        <tr>
		                          <td style="width:90%" id="label_meta_process"><a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="#item.count" />">Processus de gestion de prêt immo n°<s:property value="#item.count" /></a>
		                          </td>
		                          <td style="width:50px"><i class="fa fa-edit box_clickable" title="<s:text name="admin_page.admin_account.metaprocess_mngt.modify"/>"  onclick='goTo("<%=request.getContextPath()%>/jsp/adm/modify_metaprocess.jsp");'></i></td>
		                          <td style="width:50px">&nbsp;&nbsp;<i class="fa fa-times-circle box_clickable" title="<s:text name="admin_page.admin_account.metaprocess_mngt.unpublish"/>"></i></td>
		                         </tr>
		                      </tbody>    
		                    </table>
                        </h4>
                      </div>
				      <div id="collapse<s:property value="#item.count" />" class="panel-collapse collapse">
						<div class="box-body"> 
							Champ n°1<br>Champ n°2<br>Champ n°3<br>
				      	</div>
				      </div>
                      
                    </div>
                   </div>
                </div><!-- /.box-body -->
              </div><!-- /.col-lg-12 -->
		</div>
		</s:iterator>




        <div class="row">
			<br>
              <div class="col-lg-12">
                    <p class="text-muted"><s:text name="admin_page.admin_account.metaprocess_mngt.saved_process"/></p>
				<hr>
			</div>
		</div>
		<s:iterator status="item2" begin="1" end="2">
          <div class="row form-horizontal">
              <div class="col-lg-2"></div>
              
              <div class="col-lg-8">
                <div class="box-body">
                  <div class="box-group" id="accordion">
                    <div class="panel box box-990000" id='<s:property value="id" />' style="margin-bottom:0px;">
                      <div class="box-header with-border">
                        <h4 class="box-title">
		                    <table class="table_process responsive-table" style="margin-bottom:0px;">
		                      <tbody>
		                        <tr>
		                          <td style="width:90%" id="label_meta_process"><a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#saved_collapse<s:property value="#item2.count" />">Processus de gestion de prêt conso n°<s:property value="#item2.count" /></a>
		                          </td>
		                          <td style="width:50px"><i class="fa fa-edit box_clickable" title="<s:text name="admin_page.admin_account.metaprocess_mngt.modify"/>"  onclick='goTo("<%=request.getContextPath()%>/jsp/adm/modify_metaprocess.jsp");'></i></td>
		                          <td style="width:50px">&nbsp;&nbsp;<i class="fa fa-check-circle box_clickable" title="<s:text name="admin_page.admin_account.metaprocess_mngt.publish"/>"></i></td>
		                         </tr>
		                      </tbody>    
		                    </table>
                        </h4>
                      </div>
				      <div id="saved_collapse<s:property value="#item2.count" />" class="panel-collapse collapse">
						<div class="box-body"> 
							Champ n°1<br>Champ n°2<br>Champ n°3<br>
				      	</div>
				      </div>
                      
                    </div>
                   </div>
                </div><!-- /.box-body -->
              </div><!-- /.col-lg-12 -->
		</div>
		</s:iterator>



<br><br><br><br><br>

</div>



<script type="text/javascript">
	restore();
	//document.getElementById("label_meta_process").innerHTML = document.getElementById("nom_selected_process").value;
	document.getElementById("label_meta_process2").innerHTML = document.getElementById("nom_selected_process").value + " - version 2";
</script>






