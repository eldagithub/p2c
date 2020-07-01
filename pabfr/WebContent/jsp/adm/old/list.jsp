<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/adm/adm.css" type="text/css" media="all" />
<script>	
function    newProcess(){
}
</script>

		<div class="cadre_liste_vue">

			<div class="cadre_titre_vue">
				<div class="titre_vues_gd">Administration</div><div class="barre_verticale">|</div><div class="titre_vue_gd">Ajout d'un nouveau processus</div>
			</div>
			<div class="cadre_contenu_vue_admin_infos">
				<div class="bdd_process">
					<div class="bdd_process_categorie">
						<ul>
							<li class="bdd_process_li_selected"><a href="">Transverse</a></li>
							<li class="bdd_process_li"><a href="">Commerce</a></li>
							<li class="bdd_process_li"><a href="">Marketing</a></li>
							<li class="bdd_process_li"><a href="">Production</a></li>
							<li class="bdd_process_li"><a href="">Supports</a></li>
							<li class="bdd_process_li"><a href="">IT</a></li>
							<li class="bdd_process_li"><a href="">Logistique</a></li>
						</ul>
					</div>
					<div class="bdd_process_fleche"></div>
					<div class="bdd_process_liste">
						<ul>
							<li class="bdd_process_li_selected"><a href="">Gestion de processs</a></li>
							<li class="bdd_process_li"><a href="">Xxx</a></li>
							<li class="bdd_process_li"><a href="">Xxx</a></li>
							<li class="bdd_process_li"><a href="">Xxx</a></li>
							<li class="bdd_process_li_tiret"></li>
							<li class="bdd_process_li"><a href="javascript:newProcess();">Créer</a></li>
						</ul>
					</div>
				</div>				
				<br><br><b style="font-size:16px;">Processus sélectionné : Transverse > Gestion de processs</b>
				<s:form name="pForm" action="prc/processCreate">
				<div class="bdd_process_ss_menu">Caractéristiques d'un processus process</div>
						<div id="ref_list_caracteristics">						
							<jsp:include page="./list_caracteristics.jsp" />
						</div> 

				<div class="bdd_process_ss_menu">Activités d'un processus process</div>
					<div class="carto_process">
						<div id="ref_list_activities_adm">						
							<jsp:include page="./list_activities.jsp" />
						</div> 
					</div>
				<div class="bdd_process_ss_menu">Tâches d'un processus process</div>
					<div class="taches_process">
						<div id="ref_list_tasks_adm">						
							<jsp:include page="./list_tasks.jsp" /> 
						</div>
					</div>
						
				<div class="p_p_cadre_enregistrer" onclick=" ">Enregsitrer</div>
				<div class="p_p_cadre_annuler" onclick=" ">Valider</div>
				<div class="p_p_cadre_annuler" onclick=" ">Annuler</div>








					</s:form>
				
				
				
				
				

				
			</div>
		</div>



<script type="text/javascript"><!--
restore()
//-->
</script>




