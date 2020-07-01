<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
function listEntenteFin3(item){
	this.$("#foo3").load("<%=request.getContextPath()%>/tdb/listEntenteFin3?phase.idprocess="+item.value);
}
</script>
<style>
	.big_letter{
		font-weight:bold;
		font-size:22px;
	}
</style>
           <div class="col-lg-1"></div>
           <div class="col-lg-3">Sélectionner le plan de TTT</div>
		  	<div class="col-lg-5">
				<select id="taskforms_listeProcess"  name="taskforms_listeProcess" size="1" class="form-control" onchange="listEntenteFin3(this);">
					<s:if test="processList.size() > 0">
						<s:iterator value="processList" status="processStatus">
							<option value="<s:property value='id' />">Plan de TTT N°<b><s:property value='id' /></b>&nbsp;-&nbsp;fin prévue : <s:date name="dfinprev" format="dd/MM/yyyy"/>
							</option>
						</s:iterator>
					</s:if>
				</select>
		       </div>


<script type="text/javascript">
	restore();
	//alert(document.getElementById("taskforms_listeProcess").options[taskforms_listeProcess.selectedIndex].value );
	this.$("#foo3").load("<%=request.getContextPath()%>/tdb/listEntenteFin3?phase.idprocess="+document.getElementById("taskforms_listeProcess").options[taskforms_listeProcess.selectedIndex].value );
</script>
