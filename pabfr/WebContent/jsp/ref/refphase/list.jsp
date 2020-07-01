<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
<!--
	
    function rpChange(id, what, filed)
    {
	    loadfoo="foo"+id;
	    document.getElementById(loadfoo).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
        //this.$("#"+loadfoo).load('<%=request.getContextPath()%>/ref/modifyRefPhase?refPhase.idref='+id+'&' + what + '='+encodeURIComponent(filed.value));
        this.$("#"+loadfoo).load('<%=request.getContextPath()%>/ref/modifyRefPhase?refPhase.idref='+id+'&' + what + '='+encodeURIComponent(filed));
    }
	function rpDelete(id, idrefprocess){
    	document.getElementById("foo"+id).innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		this.$("#page_content").load("<%=request.getContextPath()%>/ref/deleteRefPhase?refProcess.idref="+ idrefprocess + "&refPhase.idref="+ id);	
	}
	function rpAdd(id){
    	document.getElementById("foo0").innerHTML='<img src="<%=request.getContextPath()%>/css/images/indicator.gif" alt="Loading..." style="display: inline" />';
		this.$("#page_content").load("<%=request.getContextPath()%>/ref/createRefPhase?refProcess.idref="+id);	
	}
	function active_phase(index, nb, idref){
		for (i = 1; i <= nb; i++) {
			document.getElementById("marker_"+i).className="  ";
		}
		document.getElementById("marker_"+index).className=" fa fa-caret-up ";
		this.$("#phase_list").load('<%=request.getContextPath()%>/ref/readRefPhase?refPhase.idref='+idref);
		this.$("#tache_list").load('<%=request.getContextPath()%>/ref/listRefTache?refPhase.idref='+idref);
		
	}
	function overDelete(id){
		document.getElementById("btn_delete_"+id).className="  label label-danger ";
		document.getElementById("btn_delete_"+id).innerHTML="--";
	}
	function outDelete(id){
		document.getElementById("btn_delete_"+id).className="  label label-default  ";
		document.getElementById("btn_delete_"+id).innerHTML=id;
	}

//-->
</script>


<div class="inner bg-light lter">
        <div class="row">
			<br>
              <div class="col-lg-10">
                    <p class="lead"><s:text name="admin_page.admin_account.metaprocess_mngt.title"/> : <s:property value='refProcess.nom' /></p>
	          </div>
	          <div class="col-lg-2">
	          		<a href="#" class="btn btn-metis-5 btn-flat btn-margin" onclick='rpAdd(<s:property value='refProcess.idref' />);'><s:text name="admin_page.admin_account.metaprocess_mngt.add.phase.title"/></a>
	          </div><div id='foo0' ></div>
              <div class="col-lg-12">
                    <p class="text-muted">Liste des phases</p>
				<hr>
			</div>
		</div>

		      <div class="row">
	            <div class="text-center">	
	              	<span class="quick-btn-date"><s:text name="label.start_date"/><br>__/__/____<br><br></span>
		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
					<s:if test="refPhaseList.size() > 0">
						<s:iterator value="refPhaseList" status="UserStatus">
			          	  <a class="quick-btn btn-flat-design-custom" href="#" title="<s:property value='nom' />" onmouseover="overDelete(<s:property value="#UserStatus.count" />);" onmouseout="outDelete(<s:property value="#UserStatus.count" />);"  onclick="active_phase(<s:property value="#UserStatus.count" />, <s:property value="refPhaseList.size()" />, <s:property value="idref"/>);">
				          	<i class="fa fa-cogs fa-2x"></i>
			               	<span class="box_ellipsis"><s:property value='nom' /></span> 
			               	<span id="btn_delete_<s:property value="#UserStatus.count" />" class="label label-default" title="<s:text name="label.subtitle.delete"/>" onclick="rpDelete(<s:property value="idref"/>, <s:property value="idrefprocess" />);"><s:property value="#UserStatus.count" /></span> 
			               	<i id="marker_<s:property value="#UserStatus.count" />" class="">&nbsp;</i>
			              </a> 
						</s:iterator>
					</s:if>
			      <a class="quick-btn quick-btn3" href="#">
					    <span class="fa fa-chevron-right"></span><br>
				  </a>
	              	<span class="quick-btn-date"><s:text name="label.end_date"/><br>__/__/____<br><br></span>
				</div>
			</div>

		<div  class="row " id="phase_list"></div>

		<div  class="row form-horizontal" id="tache_list"></div>

<script type="text/javascript">
restore();
</script>










