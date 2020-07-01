<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="ged.idprocess != null ">
	<s:if test="gedList.size() > 0">
	<hr>
	<div class="row">
		<div class="col-lg-10">
	       <p class="text-muted"><s:text name="ged_page.subtitle_ged"/></p><br>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-1"></div>
		<div class="col-lg-11">
			<table class="table_process responsive-table" style="margin-bottom:0px;">
			  <thead>
			    <tr>
			    	<td style="width:550px"><s:text name="ged_page.table_libelle"/></td>
			    	<td>Description</td>
			    	<td><s:text name="ged_page.table_owner"/></td>
			    	<td><s:text name="ged_page.table_date"/></td>
			    	<td></td>
				</tr>
			  </thead>
			  
			  <tbody>
				<s:iterator value="gedList" status="gedStatus">
					<tr>
						<td><s:property value="%{#gedStatus.count}" /> - 
							<a href="<%=request.getContextPath()%>/ged/download?ged.id=<s:property value="id" />" title="" >
								<s:if test="fileName.length() > 50" ><s:property value="%{fileName.substring(0,50)}" />... </s:if>
								<s:else><s:property value="%{fileName}" /></s:else>
							</a>
						</td>
						<td>
							<s:property value="description" />
						</td>
						<td>
							<s:property value="owner" />
						</td>
						<td>
							<s:date name="dcreate" format="dd/MM/yyyy" />
						</td>
						<td>
							<a href="#taskforms" onclick='javascript:loadTaskForms(<s:property value="id" />, <s:property value="idprocess" />, <s:property value="%{#gedStatus.count}" /> );'>
								<i class="fa fa-times-circle "></i>
							</a>			
						</td>
					</tr>
				</s:iterator>
			  </tbody>
			</table>
		</div>	
	</div>
		
	</s:if>
	<s:if test="gedList.size() <= 0">
	<hr>
	<div class="row">
		<div class="col-lg-10">
	       <p class="text-muted"><s:text name="ged_page.no_ged"/></p><br>
		</div>
	</div>
	</s:if>
</s:if>

<script type="text/javascript">

restore();
</script>


