<%@ taglib prefix="s" uri="/struts-tags"%>
          <div class="row">
            <div class="col-md-12">
              <!-- The time line -->
              <ul class="timeline" >

<li class="time-label"><span class="bg-990000 label_process">Timeline</span></li>         
	<s:if test="pptList.size() > 0">
	<s:iterator value="pptList" status="projetStatus">
		<li><!-- iterator sur les tÃ¢ches en retard -->
		<i class="fa fa-user bg-1A616F"></i>
		   <div class="timeline-item">
		     <span class="time"><i class="fa fa-clock-o"></i> <s:date name="tache.getDstartprev()" format="dd/MM/yyyy - HH:mm" /></span>
		     <h3 class="timeline-header"><b><s:property  value="%{tache.getType().toUpperCase()}" /></b> | <s:property escape="false" value='tache.getMontant()'  />&euro;</h3>
		     <div class="timeline-body">
		     Montant du devis : <span id="MontantDevis_<s:property value='tache.getId()'  />"></span>
							<script>this.$("#MontantDevis_<s:property value='tache.getId()'  />").load("<%=request.getContextPath()%>/tdb/KpiMontantDevis?process.id=<s:property value='process.getId()'  />");</script>
		     <br>Devis signé ? : <span id="DevisSigne_<s:property value='tache.getId()'  />"></span>
							<script>this.$("#DevisSigne_<s:property value='tache.getId()'  />").load("<%=request.getContextPath()%>/tdb/KpiDevisSigne?process.id=<s:property value='process.getId()'  />");</script>
		     <br>Honoraire Programm&eacute; : <span id="HonoProgPatient_<s:property value='tache.getId()' />">0</span>&euro;/h
		     <br><br>
		     <s:if test="tache.getDescription() != ''"><br>Remarque : <s:property escape="false" value='tache.getDescription()'  /></s:if>
		     </div>
		     <script>this.$("#HonoProgPatient_<s:property value='tache.getId()' />").load("<%=request.getContextPath()%>/tdb/KpiHonoProgPatient?phase.idprocess=<s:property value='process.getId()' />");</script>
		    </div>
		</li><!-- FIN iterator -->
	</s:iterator>
	</s:if>
	<s:else>
		<li>
		   <div class="timeline-item">
		     <h3 class="timeline-header">Vous n'avez pas de résulats pour la requête sélectionnée.</h3>
		    </div>
		</li>
	</s:else>
              </ul>
            </div><!-- /.col -->
          </div><!-- /.row -->
					
<script type="text/javascript">
restore();

</script>




