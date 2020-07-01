<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
<!--
	
function    loadRefProcess(id)
{
	//alert("go");
	//overlay();
	//document.getElementById("list_admin_items").style.display="none";
	this.$("#page_content").load("<%=request.getContextPath()%>/ref/listRefPhase?refProcess.idref="+id);
	//TINY.box.show({iframe:'<%=request.getContextPath()%>/ref/toEditRefProcess?refProcess.idref='+id,width:390,height:160,opacity:60,topsplit:3});
}
	function rpChange(id, what, filed, loadfoo)
	{
		document.getElementById(loadfoo).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
	    this.$("#"+loadfoo).load('<%=request.getContextPath()%>/ref/modifyRefProcess?refProcess.idref='+id+'&' + what + '='+encodeURIComponent(filed.value));
	}
	function rpChange2(id, what, filed, loadfoo)
	{
		document.getElementById(loadfoo).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
	    //this.$("#"+loadfoo).load('<%=request.getContextPath()%>/ref/modifyRefProcess?refProcess.idref='+id+'&' + what + '='+encodeURIComponent(filed));
	    this.$("#page_content").load('<%=request.getContextPath()%>/ref/activateRefProcess?refProcess.idref='+id+'&' + what + '='+encodeURIComponent(filed));
	}
	function rpDelete(id){
    	document.getElementById("foo"+id).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		this.$("#page_content").load("<%=request.getContextPath()%>/ref/deleteRefProcess?refProcess.idref="+ id);	
	}
	function rpRead(id)
	{
    	document.getElementById("foo"+id).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		this.$("#page_content").load("<%=request.getContextPath()%>/ref/listRefPhase?refProcess.idref="+id);
	}
	function rpAdd(){
    	document.getElementById("foo0").innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		this.$("#page_content").load("<%=request.getContextPath()%>/ref/createRefProcess");	
	}

//-->
</script>

<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-10">
                    <p class="lead"><s:text name="admin_page.admin_account.metaprocess_mngt.title"/></p>
	          </div>
	          <div class="col-lg-2">
	          		<a href="#" class="btn btn-metis-5 btn-flat btn-margin" onclick='rpAdd();'><s:text name="admin_page.admin_account.metaprocess_mngt.add_title"/></a>
	          </div><div id='foo0' ></div>
              <div class="col-lg-12">
                    <p class="text-muted"><s:text name="admin_page.admin_account.metaprocess_mngt.activated_process"/></p>
				<hr>
			</div>
		</div>


          <div class="row form-horizontal">
              <div class="col-lg-2"></div>
              <div class="col-lg-8">
		                    <table class="table-condensed responsive-table">
		                      <thead>
		                        <tr>
				                 <th class="hidden-xs text-center" style="width:40px;"><s:text name="admin_page.field.id"/></th>
				                 <th class="text-center" style="width:200px;"><s:text name="admin_page.field.acronyme"/></th>
				                 <th class="hidden-xs text-center" style="width:450px;"><s:text name="admin_page.field.details"/></th>
				                 <th class="hidden-xs text-center" style="width:80px;">Active</th>
				                 <td style="width:50px;"></td>
				                 <td style="width:50px;"></td>
				                 <td style="width:50px;"></td>
		                      </thead>    
		                    </table>
               </div><!-- /.col-lg-8 -->
		</div>

					<s:if test="refProcessList.size() > 0">
						<s:iterator value="refProcessList" status="UserStatus">
         <div class="row form-horizontal">
              <div class="col-lg-2"></div>
              
              <div class="col-lg-8">
                <div class="box-body">
                  <div class="box-group" id="accordion">
                    <div class="panel box box-<s:property value='active' />" id='<s:property value="id" />' style="margin-bottom:0px;">
                      <div class="box-header with-border">
                        <h4 class="box-title">
		                    <table class="responsive-table" style="margin-bottom:0px;">
		                      <tbody>
		                        <tr>
									<td style="width:25px;"><a href="#" onclick="javascript: loadRefProcess(<s:property value='idref' />)"><s:property value='idref' /></a></td>
									
		                         	 <td class="hidden-xs" id="label_meta_process" style="padding-right:5px;">
				                          <input class="form-control" style="border:0px;"
											onchange="rpChange(<s:property value="idref"/>, 'refProcess.nom', this, 'foo<s:property value="idref"/>')"
											type="text" value="<s:property value='nom' />" />
		                     	     </td>


									<td style="padding-right:5px;">
			                          	<input class="form-control" style="border:0px;" size=40
										onchange="rpChange(<s:property value="idref"/>, 'refProcess.description', this, 'foo<s:property value="idref"/>');"
										type="text" value="<s:property value='description' />" />
									
									</td>
									<td class="hidden-xs" style="padding-right:5px;">
										<select class="form-control" onchange="rpChange2(<s:property value="idref"/>, 'refProcess.active', this.options[this.options.selectedIndex].value, 'foo<s:property value="idref"/>');">
											<option value="yes" <s:if test="active=='yes'"> selected </s:if>>yes</option>
											<option value="no" <s:if test="active=='no'"> selected </s:if>>no</option>
										</select>
									
									</td>
									<td class="text-center" style="width:30px;"><a class="no_underline collapsed" href="#collapse<s:property value="idref" />" data-parent="#accordion" data-toggle="collapse" aria-expanded="false"><i class="fa fa-toggle-down"></i></a></td>
									<td class="text-center" style="width:30px;"><i class="fa fa-edit box_clickable" title="<s:text name="admin_page.admin_account.metaprocess_mngt.modify"/>" onclick="javascript: rpRead(<s:property value='idref' />);"></i></td>
  		                            <td class="text-center" style="width:30px;"><i class="fa fa-times-circle box_clickable" title="<s:text name="admin_page.admin_account.metaprocess_mngt.unpublish"/>" onclick="javascript:rpDelete(<s:property value='idref' />);"></i></td>



		                         </tr>
		                      </tbody>    
		                    </table>
                        </h4>
                      </div>
				 	  <div id='foo<s:property value="idref"/>' ></div>

				      <div id="collapse<s:property value="idref" />" class="panel-collapse collapse">
				      </div>
                      
                    </div>
                   </div>
                </div><!-- /.box-body -->
              </div><!-- /.col-lg-12 -->
		</div>
						</s:iterator>
					</s:if>

<br><br><br><br><br>

</div>



<s:if test="refProcessList.size() > 0">
	<s:iterator value="refProcessList" status="UserStatus">

<script type="text/javascript">


$(document).ready(function(){

	$("#collapse<s:property value="idref" />").on('show.bs.collapse', function(){
    	
   	$("#collapse<s:property value="idref" />").load('<%=request.getContextPath()%>/ref/listRefChamps?refProcess.idref=<s:property value="idref" />');
	});
    
});
</script>
			</s:iterator>

</s:if>


<script type="text/javascript">

restore();
</script>










