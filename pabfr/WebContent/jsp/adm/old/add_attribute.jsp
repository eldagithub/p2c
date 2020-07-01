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
<script>
function validateForm(){
		document.forms['pForm'].submit();
}
</script>
<body class="body_popup">


		<s:form name="pForm" action="../adm/add_attribute2.jsp">

			<div class="p_t_cadre">
				<div class="p_t_cadre_titre">Ajout d'un attribut au processus </div>
				<div class="p_statut_label_input" style="margin-left:130px;">
					<select size="5" name="type_champ" length="80px">
					  <option value='Champ texte' selected>Champ texte</option>
					  <option value='Liste déroulante'>Liste déroulante</option>
					  <option value='Date'>Date</option>
					  <option value='Champ chiffré'>Champ chiffré</option>
					  <option value='Email'>Email</option>
					</select>
				</div>
				<br>
				<br>
				<div class="p_t_espace"></div>
				<div class="p_t_cadre_valider" onclick="javascript:validateForm();">Valider</div>
				<div class="p_p_cadre_annuler" onclick="javascript: parent.TINY.box.hide();">Annuler</div>
			</div>
			
			
			
		</s:form>


</body>
</html>
