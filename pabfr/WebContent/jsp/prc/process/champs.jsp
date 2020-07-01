<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<script>
function validateFormChamps(processid){
	goTo('<%=request.getContextPath()%>/prc/processCreateStep2?process.id='+processid);
}
</script>
<html>
<body >
<span id="top"></span>
      <img id="indicator"
        src="<%=request.getContextPath()%>/css/images/indicator.gif"
        alt="Loading..." style="display: none" />


	<div class="inner bg-light lter">
		<br>
		<div class="row form-horizontal">
			<div class="col-lg-12">
				<p class="lead">
					<s:text name="process_page.process_fields" />
				</p>
				<hr>
			</div>

			



			<s:if test="champsList.size() > 0">

				<br>


				<s:iterator value="champsList" status="champsStatus">

					<div class="form-group" id="colorPickerBlock">
						<label class="control-label col-lg-4"><s:property value="nom" /></label>
						<div class="col-lg-6">







							<s:if test="%{type=='select'}">
								<select onchange="champsActive(<s:property value="id"/>, this)"
									class="form-control">

									<s:generator val="listvalues" separator=",">
										<s:iterator var="myListValue">
											<s:property />
											<br />   go <br />

											<option value="<s:property />"
												<s:if test="%{#myListValue==value}">selected</s:if>>
												<s:property value='myListValue' />
											</option>

										</s:iterator>
									</s:generator>
								</select>

							</s:if>
							<s:elseif test="%{type=='date'}">
								<input class="form-control" onchange="champsActive(<s:property value="id"/>, this)" type="text" placeholder="JJ/MM/YYYY" value="<s:property value='value' />" />
							</s:elseif>

							<s:else>
								<input class="form-control" onchange="champsActive(<s:property value="id"/>, this)"
									type="<s:property value='type' />"
									value="<s:property value='value' />" 
									/>



							</s:else>

						</div>
					</div>
				</s:iterator>
					<div class="form-group" >
						<label class="control-label col-lg-4">Honoraires programmés du patient </label>
						<div class="col-lg-6"><input class="form-control" disabled value="" /></div>
					</div>
					<div class="form-group" >
						<label class="control-label col-lg-4">Durée du plan de TTT (min)</label>
						<div class="col-lg-6"><input class="form-control" disabled value="" /></div>
					</div>
			</s:if>
		</div>
		<s:if test="champsList.size() <= 0">
		<br>
		<div class="row form-horizontal">
			<div class="col-lg-12">
				<p>
					<s:text name="process_page.no_process_fields" />
					<br><br>
				</p>
			</div>
		</div>
		</s:if>
		<div class="p_t_espace"></div>

		<s:form action="processCreateStep2"  id="pForm" name="pForm" method="post">
			<input type="hidden" name="id" value="<s:property value='process.id' />">
                      <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="button" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick='validateFormChamps(<s:property value='process.id' />);'>
	                      </div>
                      </div>
  		</s:form>

	</div>

	<div id="foo" style="display: none"></div>
</body>

<script type="text/javascript">
	restore();
</script>

</html>