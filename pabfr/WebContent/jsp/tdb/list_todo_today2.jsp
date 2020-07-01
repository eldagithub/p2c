<%@ taglib prefix="s" uri="/struts-tags"%>

<li class="time-label"><span class="bg-6E6E6E label_process">TODO du jour</span></li>         
	<s:if test="pptList.size() > 0">
	<s:iterator value="pptList" status="projetStatus">
		<li><!-- iterator sur les tâches en retard -->
		<i class="fa fa-user bg-1A616F"></i>
		   <div class="timeline-item">
		     <span class="time"><i class="fa fa-clock-o"></i> <s:date name="tache.getDstartprev()" format="dd/MM/yyyy - HH:mm" /></span>
		     <h3 class="timeline-header box_clickable" onclick="processRead(<s:property value="process.getId()" />);">Plan de traitement n� <s:property value='process.getId()' /> - Patient : <s:property value="process.getProgramme()" /> (<s:property value='process.getGare()' />)</h3>
		     <div class="timeline-body">
		     <b><s:property  value="%{tache.getType().toUpperCase()}" /></b> | <s:property escape="false" value='tache.getNom()'  />
		     <br>Montant du devis : <span id="MontantDevis_<s:property value='tache.getId()'  />"></span>
							<script>this.$("#MontantDevis_<s:property value='tache.getId()'  />").load("<%=request.getContextPath()%>/tdb/KpiMontantDevis?process.id=<s:property value='process.getId()'  />");</script>
		     <br>Devis sign� ? : <span id="DevisSigne_<s:property value='tache.getId()'  />"></span>
							<script>this.$("#DevisSigne_<s:property value='tache.getId()'  />").load("<%=request.getContextPath()%>/tdb/KpiDevisSigne?process.id=<s:property value='process.getId()'  />");</script>
		     <br><br>
		     <s:if test="tache.getDescription() != ''"><br>Remarque : <s:property escape="false" value='tache.getDescription()'  /></s:if>
		     <s:if test="tache.getType() != 'etape'"><br>Montant : <s:property escape="false" value='tache.getMontant()'  />&euro;</s:if>
		     <br>Dur�e de la s�ance (en min): <span id="DureeSeance_<s:property value='tache.getId()'  />"></span>
					<script>this.$("#DureeSeance_<s:property value='tache.getId()'  />").load("<%=request.getContextPath()%>/prc/dureeByTache?tache.id=<s:property value='tache.getId()'  />");</script>
		     <br>D�lai avant la prochaine s�ance (en jour) : <span id="DelaiSeance_<s:property value='tache.getId()'  />"></span>
					<script>this.$("#DelaiSeance_<s:property value='tache.getId()'  />").load("<%=request.getContextPath()%>/prc/delaiByTache?tache.id=<s:property value='tache.getId()'  />");</script>
		     </div>
		     <div class="timeline-body text-right"><i class="fa fa-euro fa-2x" style="vertical-align:bottom;margin-bottom:-15px;"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Honoraires Progamm�s du patient = <b><span id="HonoProgPatient_<s:property value='tache.getId()' />">0</span>&euro;/h</b><br>Honoraires Progamm�s de la s�ance = <b><span id="CAProdTache_<s:property value='tache.getId()' />">0</span>&euro;</b></div>
		     <script>this.$("#HonoProgPatient_<s:property value='tache.getId()' />").load("<%=request.getContextPath()%>/tdb/KpiHonoProgPatient?phase.idprocess=<s:property value='process.getId()' />");</script>
		     <script>this.$("#CAProdTache_<s:property value='tache.getId()' />").load("<%=request.getContextPath()%>/tdb/KpiCAProdTache?phase.idprocess=<s:property value='process.getId()' />&tache.id=<s:property value='tache.getId()'  />");</script>
		    </div>
		</li><!-- FIN iterator sur les tâches en retard -->
	</s:iterator>
	</s:if>
	<s:else>
		<li>
		   <div class="timeline-item">
		     <h3 class="timeline-header">Vous n'avez pas de t�ches pour aujourd'hui</h3>
		    </div>
		</li>
	</s:else>
					
<script type="text/javascript"><!--
restore()
//-->
</script>




