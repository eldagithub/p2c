<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
	function loadNewPostForm(){
		this.$("#collapse_new_post").load('<%=request.getContextPath()%>/event/add');//collapse_new_post
	}
</script>

<div id="form_new_post">
<div class="inner bg-light lter3">

	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br>
	        		<p class="lead"><a class="no_underline" data-toggle="collapse" data-parent="#accordion" href="#collapse_new_post" onclick="javascript:loadNewPostForm();"><s:text name="wall_page.new_post"/>&nbsp;</a></p>
		</div>
	</div>
	<div class="row form-horizontal panel-collapse collapse"  id="collapse_new_post">
	</div>
</div>

</div>

<div class="inner bg-light lter2">
	
<br>
<s:if test="logList.size() > 0">
          <!-- row -->
          <div class="row">
            <div class="col-md-12">
              <!-- The time line -->
              <ul class="timeline">
				<s:iterator value="logList" status="ClientStatus" var="name">
				  	<s:if test="#ClientStatus.first == true">
			                <!-- timeline time label -->
			                <li class="time-label"><span class="bg-6E6E6E label_process"><s:property escapeHtml="false" value='nomobj' /></span>
							</li>
			                <!-- /.timeline-label -->
					</s:if>
					<s:else>
						<s:if test="%{logList[#ClientStatus.index].nomobj != logList[#ClientStatus.index-1].nomobj}">
			                <!-- timeline time label -->
			                <li class="time-label"><span class="bg-6E6E6E label_process"><s:property escapeHtml="false" value='nomobj' /></span>
							</li>
			                <!-- /.timeline-label -->
						</s:if>
					</s:else>
	                <!-- timeline item -->
	                <li>
		                <s:if test="typeobj == 'Gare'">
							<i class="fa fa-cogs bg-303030"></i>
			                  <div class="timeline-item">
			                    <span class="time"><i class="fa fa-clock-o"></i> <s:date name="dcreate" format="dd/MM/yy  H:mm" /></span>
			                    <h3 class="timeline-header"><s:text name="wall_page.notification"/><a href="#"><s:property value='creator' /></a></h3>
			                    <div class="timeline-body"><s:property escapeHtml="false" value="%{coment.substring(4,coment.length())}" /></div>
			                  </div>
						</s:if>
		                <s:else>
		                	<i class="fa fa-user bg-1A616F"></i>
			                  <div class="timeline-item">
			                    <span class="time"><i class="fa fa-clock-o"></i> <s:date name="dcreate" format="dd/MM/yy  H:mm" /></span>
			                    <h3 class="timeline-header"><a href="#"><s:property value='creator' /></a> <s:text name="wall_page.post"/></h3>
			                    <div class="timeline-body">@<b><s:property escapeHtml="true" value="%{coment.substring(coment.indexOf(' - ')+3,coment.indexOf('</a>'))}" /></b> : <s:property escapeHtml="true" value="%{coment.substring(coment.indexOf('<pre>')+5,coment.indexOf('</pre>'))}" /></div>
			                  </div>
		                </s:else>
	                </li>
	                <!-- END timeline item -->
				</s:iterator>
              </ul>
            </div><!-- /.col -->
          </div><!-- /.row -->
		</s:if><s:else>
					<div class=""><s:text name="wall_page.no_news"/></div>
		</s:else>	
</div>

<script type="text/javascript">
	restore();
</script>

