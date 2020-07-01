<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<html>
<head>
<title>Process2Com</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/style_new.css" type="text/css"	media="all" />
<link rel="stylesheet"	href="<%=request.getContextPath()%>/jsp/prc/process.css" type="text/css"	media="all" />
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/jscolor/jscolor.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
</head>


<body class="body_popup">
<script>
	function champsActive(id, filed)
	{
		
		document.getElementById("indicator").style.display = "inline";
		this.$("#foo").load('<%=request.getContextPath()%>/prc/champsUpdate?champs.id='+id+'&champs.value='+encodeURIComponent(filed.value));
		document.getElementById("indicator").style.display = "none";
	}
	
	function    champsFin()
	{
//		parent.location.reload(false);
		alert("fin");
		parent.$("#processList").load('./listDiv');
		parent.$("#phaseList").load('./phaseList?process.id=<s:property value="process.id" />');
		parent.$("#tacheList").load("./../page/prc$task$list");
		parent.TINY.box.hide();

	}
	//javascript:phaseFin();
</script>

	<s:set var="inp" value="0" />
	<s:set var="inpc" value="0" />


	<img id="indicator"
		src="<%=request.getContextPath()%>/css/images/indicator.gif"
		alt="Loading..." style="display: none" />

	<div class="p_p_cadre">
		<div class="p_p_cadre_titre">List des champs</div>

		<s:if test="champsList.size() > 0">

			<br>


			<s:iterator value="champsList" status="champsStatus">
				<div class="p_p_label_donnee">
					<s:property value="nom" />
				</div>
				<div class="p_p_label_input">
					<input onchange="champsActive(<s:property value="id"/>, this)"
						type="<s:property value='type' />"
						
						value="<s:property value='value' />"  />
				</div>
			</s:iterator>
		</s:if>

		<div class="p_t_espace"></div>

		<div class="comment_ajout_process">Veuillez renseigner les champs.</div>

			<div class="conteneur_boutons_pp">
				<div class="p_p_cadre_valider" style="margin-left:160px;float:bottom;" onclick="javascript: champsFin();">Valider</div>
			</div>
	</div>

	<div id="foo" style="display: none"></div>





</body>
</html>
