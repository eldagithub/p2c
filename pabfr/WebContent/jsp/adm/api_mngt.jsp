<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- Font Awesome -->

<div class="inner bg-light lter">

		<br>
	        <div class="row">
	              <div class="col-lg-12">
	                    <p class="lead"><s:text name="admin_page.admin_account.api.title"/></p>
	                    <p class="text-muted"><s:text name="admin_page.admin_account.api.subtitle"/></p>
	              </div><!-- /.col-lg-12 -->
			</div>
			<hr>
	
	
		<s:iterator status="item" begin="1" end="6">
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
		                          <td style="width:100%" id="label_meta_process"><a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse<s:property value="#item.count" />">API n°<s:property value="#item.count" /> : gestion de la création ...</a>
		                          </td>
		                         </tr>
		                      </tbody>    
		                    </table>
                        </h4>
                      </div>
				      <div id="collapse<s:property value="#item.count" />" class="panel-collapse collapse">
						<div class="box-body"> 
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.				      	</div>
				      </div>
                      
                    </div>
                   </div>
                </div><!-- /.box-body -->
              </div><!-- /.col-lg-12 -->
		</div>
		</s:iterator>





    
    

<br><br><br>
</div> 

             
<script type="text/javascript">
	restore();
</script>






