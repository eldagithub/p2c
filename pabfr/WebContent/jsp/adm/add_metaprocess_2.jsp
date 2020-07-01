<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<div class="inner bg-light lter">

	<div id="phaseList">
		<br>
	        <div class="row">
	              <div class="col-lg-12">
	                    <p class="lead"><s:text name="admin_page.admin_account.metaprocess_mngt.add.template.title"/> Assurance</p>
	                    <p class="text-muted"><s:text name="admin_page.admin_account.metaprocess_mngt.add.template.subtitle"/></p>
	              </div><!-- /.col-lg-12 -->
			</div>
			<hr>
	
	
	          <div class="row">
		          <div class="col-lg-3"></div>
		          <div class="col-lg-6">
                        <br><label class="control-label col-lg-4"></label>
							<select class="form-control" size="5">
									<s:iterator status="Status" begin="1" end="20">
										<option>Prêt Immobilier Personnel - template n°<s:property value="%{#Status.count}"/></option>
									</s:iterator>
							</select>
		          </div><!-- /.col-lg-9 -->
		      </div>	
	
			<br><br>
		    <div class="row">
		         <div class="col-lg-9">
		               <p class="text-muted"><s:text name="process_page.subtitle_phases"/></p>
		         </div><!-- /.col-lg-9 -->
		    </div>
			<hr>

		      <div class="row">
	            <div class="text-center">	
		          <a class="quick-btn quick-btn2 " href="#" title="<s:property value="description" />">
	              	<span><s:text name="label.start_date"/><br>__/__/____<br><br></span>
				  </a>

		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
	          	  <a class="quick-btn btn-flat-design-custom" href="#" title="desc" onclick="">
		          	<i class="fa fa-cogs fa-2x"></i>
	               	<span>ETUDE</span> 
	               	<span class="label label-default">1</span> 
	              </a> 
		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
	          	  <a class="quick-btn btn-flat-design-custom" href="#" title="desc" onclick="">
		          	<i class="fa fa-cogs fa-2x"></i>
	               	<span>CONCEPTION</span> 
	               	<span class="label label-default">2</span> 
	              </a> 
		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
	          	  <a class="quick-btn btn-flat-design-custom" href="#" title="desc" onclick="">
		          	<i class="fa fa-cogs fa-2x"></i>
	               	<span>REALISATION</span> 
	               	<span class="label label-default">3</span> 
	              </a> 

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
		                          <td style="width:100%" id="label_meta_process">Réception de l'étude</td>
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
		                          <td style="width:100%" id="label_meta_process2">Qualification de la demande</td>
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
	</div>
	<br><br><br>
    <div class="col-lg-12">
            <div class="form-group">             
     		<div class="col-lg-5"></div>
     		<div class="col-lg-2">
               <input type="submit" value="Sélectionner le processus" class="btn btn-primary" onclick='goTo("<%=request.getContextPath()%>/jsp/adm/modify_metaprocess.jsp");'>
            </div>
    </div>
	<br><br><br><br><br>



</div> 

             
<script type="text/javascript">
	restore();
</script>






