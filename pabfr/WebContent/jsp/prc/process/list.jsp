<%@ taglib prefix="s" uri="/struts-tags"%>

<script>

function processCreate1(){
	goTo('<%=request.getContextPath()%>/prc/processPopulate');
}
function processCreate2(){
	//goTo('<%=request.getContextPath()%>/jsp/prc/process/dentiste2.jsp');
	//goTo('<%=request.getContextPath()%>/prc/populateEtape');
}
function processCreate3(){
	//goTo('<%=request.getContextPath()%>/jsp/prc/process/dentiste3.jsp');
	goTo('<%=request.getContextPath()%>/prc/populateFamille');

}

function processCreate6(){
	goTo('<%=request.getContextPath()%>/jsp/prc/process/dentiste6.jsp');
}

</script>

<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
              <div class="col-lg-10">
                    <p class="lead"><s:text name="process_page.title"/></p>
			  </div>
	          <div class="col-lg-2">
				<s:if test="#session.UserSessionKey.profile == 'full'  || #session.UserSessionKey.profile == 'DIRECTEUR PROJET' || #session.UserSessionKey.profile == 'DIRECTEUR LIGNE' || #session.UserSessionKey.profile == 'CONDUCTEUR'">
	          		<a href="#" class="btn btn-metis-5 btn-flat btn-margin" onclick='goTo("<%=request.getContextPath()%>/prc/processPopulate");'><s:text name="process_page.button.new_process"/></a>
	          	</s:if>
	          </div>
 				<br>
			<div class="col-lg-12">
				<hr>
			</div>
		 </div>
				<s:if test="processList.size() > 0">
		          <div class="row">
						<s:iterator value="processList" status="processStatus">
				            <div class="col-md-3 col-sm-6 col-xs-12">
				              <s:if test="status == 'in_progress'">
					              <div class="info-box bg-1A616F box_clickable"  onclick='filArianeAppend("<s:property value="programme" /> - <s:property value="gare" />");processRead("<s:property value="id" />", "<s:property value="phaseencours" />");'>
					                <span class="info-box-icon"><i class="fa fa-cogs"></i></span>
							  </s:if>
				              <s:if test="status == 'blocked'">
					              <div class="info-box bg-990000 box_clickable"  onclick='filArianeAppend("<s:property value="programme" /> - <s:property value="gare" />");processRead("<s:property value="id" />", "<s:property value="phaseencours" />");'>
					                <span class="info-box-icon"><i class="fa fa-pause"></i></span>
							  </s:if>
				              <s:if test="status == 'completed'">
					              <div class="info-box bg-707070 box_clickable"  onclick='filArianeAppend("<s:property value="programme" /> - <s:property value="gare" />");processRead("<s:property value="id" />", "<s:property value="phaseencours" />");'>
					                <span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>
							  </s:if>
				                <div class="info-box-content">
				                  <span class="info-box-text" title="<s:property value="programme" /> - <s:property value="gare" />">N°<s:property value='id' /> - <s:property value="programme" /> - <s:property value="gare" /></span>
				                  <span class="info-box-number"><s:date name="dfinprev" format="dd/MM/yyyy"/></span>
				                  <div class="progress">
				                    <div class="progress-bar" style="width:100%"></div>
				                  </div>
					              <span class="progress-description"><s:property value="phaseencours" /></span>
				                  
				                  
				                </div><!-- /.info-box-content -->
				              </div><!-- /.info-box -->
				            </div><!-- /.col -->								
						</s:iterator>
					</div>
				</s:if> <s:else>
								<div class="cadre_item_process"><s:text name="process_page.no_process"/></div>
				</s:else>
</div>	

<script type="text/javascript">
	restore();
	document.location.href="#top";
	document.getElementById("logo_label").innerHTML="<s:text name="menu.label.process"/>";
</script>
