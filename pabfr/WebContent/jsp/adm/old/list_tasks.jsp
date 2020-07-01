<%@ taglib prefix="s" uri="/struts-tags"%>



		<div class="cadre_titre_taches">
			<div class="libelle_tache">Nom de la tâche</div>
			<div class="libelle_responsable">Responsable</div>
			<div class="date_debut">Date de début</div>
			<div class="date_fin_prev">Date de fin prévisionnelle</div>
		</div>

		<div class="cadre_lister_taches_scroll">

				<div class="cadre_item_tache">
					<div class="fond_item_tache">
						<div class="libelle_item_tache"	onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_task.jsp',width:340,height:125,opacity:60,topsplit:3})">Nom de la tâche</div>
						<div class="libelle_item_responsable" title="Le nom du responsable de chaque tache est modifiable une fois le processus instancié"><i>Nom du responsable</i></div>
						<div class="libelle_item_date_debut">00/00/0000</div>
						<div class="libelle_item_date_fin_prev">00/00/0000</div>
					</div>
					<div class="supprimer_tache" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_task.jsp',width:340,height:180,opacity:60,topsplit:3})"></div>
					<div class="privatiser_tache_ko" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/privatize_task.jsp',width:340,height:125,opacity:60,topsplit:3})"></div>
				</div>
				<div class="cadre_item_tache">
					<div class="fond_item_tache">
						<div class="libelle_item_tache"	onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_task.jsp',width:340,height:125,opacity:60,topsplit:3})">Nom de la tâche</div>
						<div class="libelle_item_responsable" title="Le nom du responsable de chaque tache est modifiable une fois le processus instancié"><i>Nom du responsable</i></div>
						<div class="libelle_item_date_debut">00/00/0000</div>
						<div class="libelle_item_date_fin_prev">00/00/0000</div>
					</div>
					<div class="supprimer_tache" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_task.jsp',width:340,height:180,opacity:60,topsplit:3})"></div>
					<div class="privatiser_tache_ko" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/privatize_task.jsp',width:340,height:125,opacity:60,topsplit:3})"></div>
				</div>
				<div class="cadre_item_tache">
					<div class="fond_item_tache">
						<div class="libelle_item_tache"	onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_task.jsp',width:340,height:125,opacity:60,topsplit:3})">Nom de la tâche</div>
						<div class="libelle_item_responsable" title="Le nom du responsable de chaque tache est modifiable une fois le processus instancié"><i>Nom du responsable</i></div>
						<div class="libelle_item_date_debut">00/00/0000</div>
						<div class="libelle_item_date_fin_prev">00/00/0000</div>
					</div>
					<div class="supprimer_tache" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_task.jsp',width:340,height:180,opacity:60,topsplit:3})"></div>
					<div class="privatiser_tache_ko" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/privatize_task.jsp',width:340,height:125,opacity:60,topsplit:3})"></div>
				</div>
				
				
				
		</div>


		<span title="Ajouter une tâche spécifique"><div class="bouton_ajouter_tache" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/add_task.jsp',width:395,height:140,opacity:60,topsplit:3})">+</div></span>
		<br>
		<br>




<script type="text/javascript"><!--
restore()
//-->
</script>

