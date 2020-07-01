<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<title>Process2Com</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_new.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/adm/adm.css" type="text/css" media="all" />
</head>
<body class="body_popup">


		<s:form name="pFormz" action="">
		</s:form>
		
		<div class="p_t_cadre">
			<div class="p_t_cadre_titre">Etes-vous sur de vouloir supprimer cette tâche ?
			<u>Nom : </u><s:property value="tache.nom" />
			</div>
		
			<br>
			<div class="p_t_cadre_valider" onclick="document.forms['pFormz'].submit();">Valider 
				</div>
			<div class="p_t_cadre_annuler" onclick="javascript: parent.TINY.box.hide();">Annuler</div>


		</div>


    <div id="foo" style="display:none"></div>





</body>
</html>
