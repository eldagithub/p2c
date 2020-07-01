<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
function listEntenteFin2(item){
	this.$("#foo2").load("<%=request.getContextPath()%>/tdb/listEntenteFin2?objet.idref="+item.value);
}
</script>
<style>
	.big_letter{
		font-weight:bold;
		font-size:22px;
	}
</style>
           <div class="col-lg-1"></div>
           <div class="col-lg-3">Sélectionner le patient</div>
		  	<div class="col-lg-5">
				<select id="taskforms_listePatients"  name="taskforms_listePatients" size="1" class="form-control" onchange="listEntenteFin2(this);">
					<s:if test="programmeList.size() > 0">
						<s:iterator value="programmeList" status="programmeStatus">
							<option value="<s:property value='idref' />">
								<s:property value='nom' />&nbsp;<s:property value='description' />
							</option>
						</s:iterator>
					</s:if>
				</select>
		       </div>


<script type="text/javascript">
	restore();
	this.$("#foo2").load("<%=request.getContextPath()%>/tdb/listEntenteFin2?objet.idref="+document.getElementById("taskforms_listePatients").options[taskforms_listePatients.selectedIndex].value );
</script>
