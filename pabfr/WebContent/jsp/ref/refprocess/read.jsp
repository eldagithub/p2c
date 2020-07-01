<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- Font Awesome -->
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">

<div class="inner bg-light lter">

	<div id="phaseList">
		<br>
	        <div class="row">
	              <div class="col-lg-9">
	                    <p class="lead"><s:text name="admin_page.admin_account.metaprocess_mngt.modify.title"/> : <s:property value='refProcess.idref' /> - <s:property value='refProcess.nom' /> </p>
	              </div><!-- /.col-lg-9 -->
	              <div class="col-lg-3">
					<div class="bs-example">
					    <div class="panel-group" id="accordion">
					        <div class="panel panel-default">
					            <div class="panel-heading">
					                <h4 class="panel-title">
					                     <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><i class="fa fa-cog">&nbsp;&nbsp;</i>Actions</a>
					                </h4>
					            </div>
					            <div id="collapseOne" class="panel-collapse collapse">
					                <div class="panel-body box_wrapable">
								       <ul style="padding-left:20px;list-style:none;">
								            <li><a href="#" onclick='goTo("<%=request.getContextPath()%>/jsp/adm/add_field.jsp");'><i class="fa fa-plus-circle"></i>&nbsp;<s:text name="admin_page.admin_account.metaprocess_mngt.add.field"/></a></li>  
								            <li><a href="#" onclick='goTo("<%=request.getContextPath()%>/jsp/adm/add_phase.jsp");'><i class="fa fa-plus-circle"></i>&nbsp;<s:text name="admin_page.admin_account.metaprocess_mngt.add.phase"/></a></li>  
								            <li><a href="#" onclick='goTo("<%=request.getContextPath()%>/jsp/adm/add_task.jsp");'><i class="fa fa-plus-circle"></i>&nbsp;<s:text name="admin_page.admin_account.metaprocess_mngt.add.task"/></a></li>  
								            <hr>  
								            <li><a href="#" onclick=""><i class="fa fa-save"></i>&nbsp;<s:text name="admin_page.admin_account.metaprocess_mngt.save"/></a></li>  
								            <li><a href="#" onclick=""><i class="fa fa-check-circle-o"></i>&nbsp;<s:text name="admin_page.admin_account.metaprocess_mngt.publish"/></a></li>  
								            <li><a href="#" onclick=""><i class="fa fa-times-circle-o"></i>&nbsp;<s:text name="admin_page.admin_account.metaprocess_mngt.delete"/></a></li>  
								  		</ul>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>                           
	              </div>
			</div>
			<hr><br>
	
	

		      <div class="row">
	            <div class="text-center">	
		          <a class="quick-btn quick-btn2 " href="#" title="<s:property value="description" />">
	              	<span><s:text name="label.start_date"/><br>__/__/____<br><br></span>
				  </a>

		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
	          	  <span class="quick-btn btn-flat-design-custom">
		          	<i class="fa fa-cogs fa-2x"></i>
	               	<span contenteditable="true" title="<s:text name="label.subtitle.modify"/>">ETUDE</span> 
	               	<span class="label label-default">1</span> 
	              </span> 
		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
	          	  <span class="quick-btn btn-flat-design-custom">
		          	<i class="fa fa-cogs fa-2x"></i>
	               	<span contenteditable="true" title="<s:text name="label.subtitle.modify"/>">CONCEPTION</span> 
	               	<span class="label label-default">2</span> 
	              </span> 
		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
	          	  <span class="quick-btn btn-flat-design-custom">
		          	<i class="fa fa-cogs fa-2x"></i>
	               	<span contenteditable="true" title="<s:text name="label.subtitle.modify"/>">REALISATION</span> 
	               	<span class="label label-default">3</span> 
	              </span> 

			      <a class="quick-btn quick-btn3" href="#">
					    <span class="fa fa-chevron-right"></span><br>
				  </a>
		          <a class="quick-btn quick-btn2 " href="#">
	              	<span><s:text name="label.end_date"/><br>__/__/____<br><br></span>
				  </a>
				</div>
			</div>    
    
	</div>

	<div id="tacheList">
	    <div class="row">
	         <div class="col-lg-9">
	               <p class="text-muted"><s:text name="process_page.subtitle_tasks"/></p>
	         </div><!-- /.col-lg-9 -->
	    </div>
		<hr>
          <div class="row form-horizontal">
              <div class="col-lg-2"></div>
              
              <div class="col-lg-8">
                <div class="box-body">
                  <div class="box-group" id="accordion">
                    <div class="panel box box-1A616F" id='<s:property value="id" />' >
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />">
		                    <table class="table_process responsive-table" style="margin-bottom:0px;">
		                      <tbody>
		                        <tr>
		                          <td style="width:100%">Réception de l'étude</td>
		                          <td style="width:20px"><i class="fa fa-times-circle" title="<s:text name="label.subtitle.delete"/>" ></i></td>
		                         </tr>
		                      </tbody>    
		                    </table>
                          </a>
                        </h4>
                      </div>
                    </div>
                    <div class="panel box box-1A616F" id='<s:property value="id" />' >
                      <div class="box-header with-border">
                        <h4 class="box-title">
                          <a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="id" />">
		                    <table class="table_process responsive-table" style="margin-bottom:0px;">
		                      <tbody>
		                        <tr>
		                          <td style="width:100%">Qualification de la demande</td>
		                          <td style="width:20px"><i class="fa fa-times-circle" title="<s:text name="label.subtitle.delete"/>" ></i></td>
		                         </tr>
		                      </tbody>    
		                    </table>
                          </a>
                        </h4>
                      </div>
                    </div>
                   </div>
                </div><!-- /.box-body -->
              </div><!-- /.col-lg-12 -->			
			<br>
			<br>
			<br>
	</div>
	<br><br><br>
	<br><br><br><br><br>



</div> 

</div>           
<script type="text/javascript">
	restore();
</script>






