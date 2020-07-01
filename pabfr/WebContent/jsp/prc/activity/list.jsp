<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/tinybox.js"></script>
<script type="text/javascript">
	function active_phase(index, nb){
		for (i = 1; i <= nb; i++) {
			document.getElementById("marker_"+i).className="  ";
		}
		document.getElementById("marker_"+index).className=" fa fa-caret-up ";		
		document.getElementById("gedList").style.display="block";	 	
	}
	function printPlanTTT(id){
		window.open('<%=request.getContextPath()%>/prc/processPrint?process.id='+id,'name','height=850,width=1050');
	}
</script>

<div class="inner bg-light lter">

<span id="top"></span>

<div id="phaseList"> 
<br>

	<s:if test="process.id != null ">
	        <div class="row">
	              <div class="col-lg-9">
	                    <p class="lead">Plan de TTT n° <s:property value="process.id" /> : <s:property value="process.programme" /> - <s:property value="process.gare" /></p>
	                   <p class="text-muted"><!--  <s:text name="userprofile.directeurprocess"/> : <s:property value="process.getDp()" /> <br>--> 
	                    <s:text name="userprofile.conducteur"/> : <s:property value="process.cp" />
	                    </p>
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
					                <div class="panel-body">
								       <ul style="padding-left:20px;list-style-type: none;">
								            <!-- <li class="visible-lg">&nbsp;&nbsp;<a href="#" onclick="printPlanTTT(<s:property value="process.id" />);"><i class="fa fa-print " style="padding-right:10px;"></i>Imprimer</a></li>  -->  
								       	    <s:if test="#session.UserSessionKey.profile == 'full' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
									            <li>&nbsp;&nbsp;<a href="#" onclick="goTo('<%=request.getContextPath()%>/prc/processUpdate?process.id=<s:property value="process.id" />')"><i class="fa fa-download" style="padding-right:10px;"></i><s:text name="process_page.process_charter"/></a></li>  
									            <li class="visible-lg">&nbsp;&nbsp;<a href="#taskforms" onclick="document.getElementById('gedList').style.display='block';loadAddGed('<s:property value="process.id" />')"><i class="fa fa-file-text " style="padding-right:10px;"></i><s:text name="process_page.new_document"/></a></li>  
									            <li>&nbsp;&nbsp;<a href="#" onclick="goTo('<%=request.getContextPath()%>/jsp/prc/process/delete_process.jsp?id=<s:property value="process.id" />')"><i class="fa fa-times-circle " style="padding-right:10px;"></i><s:text name="process_page.delete_process"/></a></li>
								            </s:if>  
								  		</ul>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>             
	              
	              </div>
	
			</div>
			<hr>
	
	
	
	
	          <div class="row">
		          <div class="col-lg-9">
		                <p class="text-muted"><s:text name="process_page.subtitle_phases"/></p>
		          </div><!-- /.col-lg-9 -->
		      </div>
		      <div class="row">
		      
	    
	            <div class="text-center">
				<s:if test="phaseList.size() > 0">
	
	              	<span class="quick-btn-date" ><s:text name="label.start_date"/><br><s:date name="process.dstart" format="dd/MM/yyyy" /><br><br></span>
		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
				  <s:iterator value="phaseList" status="phaseStatus">
			              <s:if test="status == 'in_progress_init'">
		              	    <a class="quick-btn btn-flat-design-custom" href="#" title="<s:property value="description" />" onclick="javascript:active_phase(<s:property value="#phaseStatus.count" />, <s:property value="phaseList.size()" />);javascript:phaseRead(<s:property value="id" />);">
				          	<i class="fa fa-cogs fa-2x"></i>
		                	<span class="box_ellipsis"><s:property value="nom" /></span> 
		                	<span class="label label-default"><s:property value="%{#phaseStatus.count}"/></span> 
			               	<i id="marker_<s:property value="#phaseStatus.count" />" class="">&nbsp;</i>
		              		</a> 
				  		 	<!--<script>phaseRead3(<s:property value="id"/>, <s:property value="idprocess"/>);</script>		-->		  
						  </s:if>
		
			              <s:if test="status == 'in_progress'">
		              	    <a class="quick-btn btn-active btn-flat-design-custom" href="#" title="<s:property value="description" />" onclick="javascript:active_phase(<s:property value="#phaseStatus.count" />, <s:property value="phaseList.size()" />);javascript:phaseRead(<s:property value="id" />);">
				          	<i class="fa fa-cogs fa-2x"></i>
		                	<span class="box_ellipsis"><s:property value="nom" /></span> 
		                	<span class="label label-default"><s:property value="%{#phaseStatus.count}"/></span> 
			               	<i id="marker_<s:property value="#phaseStatus.count" />" class="">&nbsp;</i>
		              		</a> 
				  		 	<!--<script>phaseRead3(<s:property value="id"/>, <s:property value="idprocess"/>);</script>		-->		  
						  </s:if>
		
			              <s:if test="status == 'blocked'">
		              	    <a class="quick-btn btn-active bg-990000 btn-flat-design-custom" href="#" title="<s:property value="description" />" onclick="javascript:active_phase(<s:property value="#phaseStatus.count" />, <s:property value="phaseList.size()" />);javascript:phaseRead(<s:property value="id" />);">
				          	<i class="fa fa-cogs fa-2x"></i>
		                	<span class="box_ellipsis"><s:property value="nom" /></span> 
		                	<span class="label label-default"><s:property value="%{#phaseStatus.count}"/></span> 
			               	<i id="marker_<s:property value="#phaseStatus.count" />" class="">&nbsp;</i>
		              		</a> 
				  		 	<!--<script>phaseRead3(<s:property value="id"/>, <s:property value="idprocess"/>);</script>	-->			  
						  </s:if>
		
			              <s:if test="status == 'completed'">
		              	    <a class="quick-btn btn-flat-design-custom" href="#" title="<s:property value="description" />" onclick="javascript:active_phase(<s:property value="#phaseStatus.count" />, <s:property value="phaseList.size()" />);javascript:phaseRead(<s:property value="id" />);">
				          	<i class="fa fa-check fa-2x"></i>
		                	<span class="box_ellipsis"><s:property value="nom" /></span> 
		                	<span class="label label-default"><s:property value="%{#phaseStatus.count}"/></span> 
			               	<i id="marker_<s:property value="#phaseStatus.count" />" class="">&nbsp;</i>
		              		</a> 
						  </s:if>
		
			              <s:if test="status == 'to_be_started'">
		              	    <a class="quick-btn btn-flat-design-custom" href="#" title="<s:property value="description" />" onclick="javascript:active_phase(<s:property value="#phaseStatus.count" />, <s:property value="phaseList.size()" />);javascript:phaseRead(<s:property value="id" />);">
				          	<i class="fa fa-calendar fa-2x"></i>
		                	<span class="box_ellipsis"><s:property value="nom" /></span> 
		                	<span class="label label-default"><s:property value="%{#phaseStatus.count}"/></span> 
			               	<i id="marker_<s:property value="#phaseStatus.count" />" class="">&nbsp;</i>
		              		</a> 
						  </s:if>
			          <a class="quick-btn quick-btn3" href="#">
					    <span class="fa fa-chevron-right"></span><br>
					  </a>
	              </s:iterator>
	              	<span class="quick-btn-date "><s:text name="label.end_date"/><br><s:date name="process.dfinprev" format="dd/MM/yyyy" /><br><br></span>
				</s:if>
				</div>
			</div>
	</s:if>
	<br>
	<hr>
</div>

<div id="tacheList">
	        <div class="row">
	              <div class="col-lg-3"></div>
	              <div class="col-lg-6">
	                    <p class="text-muted"><s:text name="process_page.phases.list"/></p>
	              </div><!-- /.col-lg-6 -->
	              <div class="col-lg-3"></div>
	        </div>

</div>

<div id="gedList"></div>

<div id="taskforms"></div>


<br><br>
</div>              

<script>
this.$("#gedList").load("<%=request.getContextPath()%>/ged/gedList?ged.idprocess=<s:property value="process.id" />");
document.getElementById("gedList").style.display="none";	 	

function    loadTaskForms(id, idprocess)
{
	$("#taskforms").load("<%=request.getContextPath()%>/jsp/prc/ged/delete_livrable.jsp?ged.id="+id+"&ged.idprocess="+idprocess);
}

function    loadAddGed(id)
{
	//alert("coucou");
	//document.getElementById("gedList").innerHTML="";
	//document.getElementById("tacheList").innerHTML="";
	//document.getElementById("phaseList").style.display="none";	
	TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/prc/ged/form_livrable.jsp?ged.idprocess='+id,width:600,height:300,opacity:60,topsplit:3});
    
    //$("#taskforms").load("<%=request.getContextPath()%>/jsp/prc/ged/form_livrable.jsp?ged.idprocess="+id);
}

restore();
document.location.href="#top";

</script>
