<%@ taglib prefix="s" uri="/struts-tags"%>
          <div class="row">
            <div class="col-md-12">
              <!-- The time line -->
              <ul class="timeline" >
<li class="time-label"><span class="bg-990000 label_process">Timeline</span></li>         
	<s:if test="tacheList.size() > 0">
	<s:iterator value="tacheList" status="taskStatus">
		<li><!-- iterator sur les tâches en retard -->
		<i class="fa fa-user bg-1A616F"></i>
		   <div class="timeline-item">
		     <span class="time"><i class="fa fa-clock-o"></i> <s:date name="dstartprev" format="dd/MM/yyyy - HH:mm" /></span>
		     <h3 class="timeline-header">
		     
		   
				<s:if test="type != 'etape'" >
					<b><s:property  value="%{type.toUpperCase()}" /></b> | <s:property value='montant'  />&nbsp;&euro;
				</s:if>
				<s:else>
					<b><s:if test="nom.length() > 40" ><s:property escape="false"  value="%{nom.substring(0,40)}" />... </s:if>
					<s:else><s:property escape="false" value='nom'  /></s:else></b>
				</s:else>		   
		     
		     </h3>
				<s:if test="type == 'etape'" >
		     <div class="timeline-body">
		   
					<div id="listEtapes_<s:property value='id'  />"></div>
					<script>this.$("#listEtapes_<s:property value='id'  />").load('<%=request.getContextPath()%>/prc/etapeListByTache?tache.id=<s:property value='id'  />');</script>

		     <s:if test="description != ''"><br>Remarque : <s:property escape="false" value='tache.getDescription()'  /></s:if>
		     </div>
				</s:if>
		    </div>
		</li><!-- FIN iterator -->
	</s:iterator>
	</s:if>
	<s:else>
		<li>
		   <div class="timeline-item">
		     <h3 class="timeline-header">Vous n'avez pas de rendez-vous pour ce plan de traitement.</h3>
		    </div>
		</li>
	</s:else>
              </ul>
            </div><!-- /.col -->
          </div><!-- /.row -->
					
<script type="text/javascript">
restore();

</script>




