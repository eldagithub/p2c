<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<html>
<head>
<title>Process2Com</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_new.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/adm/adm.css" type="text/css" media="all" />
</head>
<body class="body_popup">


		<s:form name="pForm" action="">

			<div class="p_t_cadre">
				<div class="p_t_cadre_titre">Renommage de l'attribut : </div>
				<div class="p_t_label_donnee">Nouveau nom</div><div class="p_t_label_input"><input name="tache.nom" type="text" placeholder="">	</div>
				<br>
				<br>
				<div class="p_t_espace"></div>
				<div class="p_t_cadre_valider" onclick="javascript: document.forms['pForm'].submit();">Valider</div>
				<div class="p_p_cadre_annuler" onclick="javascript: parent.TINY.box.hide();">Annuler</div>
			</div>
			
			
			
		</s:form>


</body>
</html>
