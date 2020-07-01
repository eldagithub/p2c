<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
function listProcessReader(){
	this.$("#tacheList").load("<%=request.getContextPath()%>/prc/taskListReader?phase.idprocess=" + document.getElementById("taskforms_listProcessReaderListe").options[taskforms_listProcessReaderListe.selectedIndex].value);
}
</script>

	<div class="row form-horizontal">
	    <div class="col-lg-2">Mes plans de traitement</div>
	  	<div class="col-lg-8">
			<select id="taskforms_listProcessReaderListe"  name="taskforms_listProcessReaderListe" size="1" class="form-control" onchange="listProcessReader();">
				<s:if test="processList.size() > 0">
						<s:iterator value="processList" status="processStatus">
							<option value="<s:property value='id' />">Plan de TTT n° <s:property value="%{#processStatus.index+1}"/>
							<s:if test="#processStatus.first == true">
								<script type="text/javascript">
									document.getElementById("libelleProcess").innerHTML = '<s:property value="id" /> - <s:property value="phaseencours" />';
									document.getElementById("libelleCP").innerHTML = "<s:property value="cp" />";
								</script>
							</s:if>
							</option>
						</s:iterator>
				</s:if>
			</select>
	    </div>
		<br><br><br><br>
	</div>
	
	<hr>
	<div class="row">
	      <div class="col-lg-9">
	            <p class="lead">Plan de TTT n°<span id="libelleProcess"></span></p>
	            <p class="text-muted"><s:text name="userprofile.conducteur"/> : <span id="libelleCP"></span></p>
	      </div><!-- /.col-lg-9 -->	
	</div>
	<hr>
	

			
<script type="text/javascript">
	listProcessReader();
</script>
