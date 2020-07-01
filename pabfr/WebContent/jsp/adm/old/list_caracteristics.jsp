<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/adm/adm.css" type="text/css" media="all" />
						<input type="hidden" name="idref" value="1">
						<input type="hidden" name="status" value="in_progress">
			
						<div class="p_t_label_donnee">
							<div  class="menu_admin_workspace2">
								<a href="#" onclick="">Liste déroulante 1</a>
								<ul>
						            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_caracteristic.jsp',width:340,height:125,opacity:60,topsplit:3})" title="Survoler pour modifier le nom de cet attribut process ou le supprimer">Renommer</a></li>  
						            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_caracteristic.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
						        </ul>
							</div>					
						</div>
						<div class="p_t_label_input">
							<select name="repository1" title="Ces données listées seront modifiables via l'onglet Paramètres de votre espace de travail une fois le processus validé">
										<option value="Item 1">Item 1</option>
										<option value="Item 2">Item 2</option>
										<option value="Item 3">Item 3</option>
							</select>
						</div>
						<div class="p_p_div_espace"></div>
						<div class="p_t_label_donnee">
							<div  class="menu_admin_workspace2">
								<a href="#" onclick="">Liste déroulante 2</a>
								<ul>
						            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_caracteristic.jsp',width:340,height:125,opacity:60,topsplit:3})" title="Survoler pour modifier le nom de cet attribut process ou le supprimer">Renommer</a></li>  
						            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_caracteristic.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
						        </ul>
							</div>					
						</div>
						<div class="p_t_label_input">
							<select name="repository1" title="Ces données listées seront modifiables via l'onglet Paramètres de votre espace de travail une fois le processus validé">
										<option value="Item 1">Item 1</option>
										<option value="Item 2">Item 2</option>
										<option value="Item 3">Item 3</option>
							</select>
						</div>
						<div class="p_p_div_espace"></div>
						<div class="p_t_label_donnee">Couleur</div>
						<div class="p_t_label_input">
							<input name="couleur" class="color" placeholder="BBBBBB" value="<s:property value='process.couleur' />">
						</div>
						<div class="p_t_label_donnee">Date de fin prévisionnelle</div>
						<div class="p_t_label_input">
							<input type="text" placeholder="JJ/MM/AAAA" name="dfinprev" value="<s:date name="process.dfinprev" format="dd/MM/yyyy" />" size=10/>
						</div>
						<div class="p_p_div_espace"></div>
						<div class="p_t_label_donnee">
							<div  class="menu_admin_workspace2">
								<a href="#" onclick="">Liste contributeurs 1</a>
								<ul>
						            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_caracteristic.jsp',width:340,height:125,opacity:60,topsplit:3})" title="Survoler pour modifier le nom de cet attribut process ou le supprimer">Renommer</a></li>  
						            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_caracteristic.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
						        </ul>
							</div>					
						</div>
						<div class="p_t_label_input">
							<select name="profil1" title="Ces données listées seront modifiables via l'onglet Paramètres de votre espace de travail une fois le processus validé">
										<option value="Contributeur 1">Contributeur 1</option>
										<option value="Contributeur 2">Contributeur 2</option>
										<option value="Contributeur 3">Contributeur 3</option>
							</select>
						</div>
						<div class="p_p_div_espace"></div>
						<div class="p_t_label_donnee">
							<div  class="menu_admin_workspace2">
								<a href="#" onclick="">Liste contributeurs 2</a>
								<ul>
						            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/rename_caracteristic.jsp',width:340,height:125,opacity:60,topsplit:3})" title="Survoler pour modifier le nom de cet attribut process ou le supprimer">Renommer</a></li>  
						            <li><a href="#" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/delete_caracteristic.jsp',width:340,height:125,opacity:60,topsplit:3})">Supprimer</a></li>  
						        </ul>
							</div>					
						</div>
						<div class="p_t_label_input">
							<select name="profil2" title="Ces données listées seront modifiables via l'onglet Paramètres de votre espace de travail une fois le processus validé">
										<option value="Contributeur 1">Contributeur 1</option>
										<option value="Contributeur 2">Contributeur 2</option>
										<option value="Contributeur 3">Contributeur 3</option>
							</select>
						</div>
						<div class="p_t_label_donnee">Budget</div>
						<div class="p_t_label_input">
							<input type="text" name="codebudget" placeholder="" value="<s:property value='process.codebudget' />"/>
						</div>
						<div class="p_t_espace"></div>
						<div class="bouton_ajouter_attribute" title="Ajouter un attribut spécifique au processus" onclick="TINY.box.show({iframe:'<%=request.getContextPath()%>/jsp/adm/add_attribute.jsp',width:385,height:190,opacity:60,topsplit:3})">+</div>
						<div class="p_p_div_espace"></div>
						<div class="p_t_espace"></div>





