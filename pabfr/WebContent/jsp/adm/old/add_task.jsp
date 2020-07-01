<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<title>Process2Com</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/adm/adm.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_new.css" type="text/css" media="all" />

</head>
<body>
<script>
function validateForm(){

}

function NonVide(c){
	if (c==''){ alert("Le nom de la tâche doit être renseigné.");return false;}else{return true;}
}

</script>

		<s:form name="pForm4" action="">
			<div class="p_new_t_cadre">
				<div class="p_t_cadre_titre">Nouvelle tâche </div>
				<div class="p_t_label_donnee">Nom de la tâche</div><div class="p_t_label_input"><input type="text" placeholder="" name="nom"/></div>
				<br>	
				<br>	
				<div class="p_t_espace"></div>
				<div class="p_new_t_cadre_valider" onclick="javascript:validateForm();">Valider</div>
				<div class="p_t_cadre_annuler" onclick="parent.TINY.box.hide();">Annuler</div>
			
			</div>
		</s:form>


</body>
</html>
