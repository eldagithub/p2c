<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
</script>



		      <div class="row">
	            <div class="text-center">	
	              	<span  onmouseover="overRefPhase('0');"  onmouseout="outRefPhase('0');"  class="quick-btn-date"><s:text name="label.start_date"/><br>__/__/____<br><br></span>
		          <a class="quick-btn quick-btn3" href="#">
				    <span class="fa fa-chevron-right"></span><br>
				  </a>
					<s:if test="refPhaseList.size() > 0">
						<s:iterator value="refPhaseList" status="UserStatus">
			          	  <a class="quick-btn btn-flat-design-custom" href="#" title="<s:property value='nom' />" onmouseover="overRefPhase('<s:property value="#UserStatus.count" />');"  onmouseout="outRefPhase('<s:property value="#UserStatus.count" />');" >
				          	<i class="fa fa-cogs fa-2x"></i>
			               	<span class="box_ellipsis"><s:property value='nom' /></span> 
			              </a> 
						</s:iterator>
					</s:if>
			      <a class="quick-btn quick-btn3" href="#">
					    <span onmouseover="overRefPhase('0');"  onmouseout="outRefPhase('0');"  class="fa fa-chevron-right"></span><br>
				  </a>
	              	<span class="quick-btn-date"><s:text name="label.end_date"/><br>__/__/____<br><br></span>
				</div>
			</div>

<script type="text/javascript">
restore();
</script>










