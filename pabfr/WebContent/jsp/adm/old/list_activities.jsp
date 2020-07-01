<%@ taglib prefix="s" uri="/struts-tags"%>



		<div class="process">

				<div class="cadre_lister_phases">
					<div class="phase_date_debut">date de<br>début</div>
					<div class="phase_fleche_date_process"></div>

						<div id="phase" class="menu_admin_workspace" onclick="">Phase1
					       	<ul>
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Renommer</a></li>  
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
					        </ul>	
						</div>
						<div id="phase" class="menu_admin_workspace" onclick="">Phase2
					       	<ul>
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Renommer</a></li>  
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
					        </ul>	
						</div>
						<div id="phase" class="menu_admin_workspace" onclick="">Phase3
					       	<ul>
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Renommer</a></li>  
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
					        </ul>	
						</div>
						<div id="phase" class="menu_admin_workspace" onclick="">Phase4
					       	<ul>
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Renommer</a></li>  
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
					        </ul>	
						</div>
						<div id="phase" class="menu_admin_workspace" onclick="">Phase5
					       	<ul>
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Renommer</a></li>  
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
					        </ul>	
						</div>
						<div id="phase" class="menu_admin_workspace" onclick="">Phase6
					       	<ul>
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Renommer</a></li>  
					            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_activity.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
					        </ul>	
						</div>

					<div class="phase_fleche_date_process"></div>
					<div class="phase_date_fin">date de<br>fin</div>
					<span title="Ajouter une phase (jusqu'à 6 maximum et au minimum 2)"><div class="bouton_ajouter_phase" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/add_activity.jsp',width:390,height:200,opacity:60,topsplit:3})">+</div></span>
				</div>

		</div>


<script type="text/javascript"><!--
restore()
//-->
</script>
