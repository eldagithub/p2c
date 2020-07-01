<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html class="no-js">
  <head>
    <meta charset="UTF-8">
    <title>Process2Com - <s:text name="client.namespace"/></title>
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap @ Font Awesome  -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
    
    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">

    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/metisMenu.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
      <script src="<%=request.getContextPath()%>/js/html5shiv.js"></script>
      <script src="<%=request.getContextPath()%>/js/respond.js"></script>
      <![endif]-->
	<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/tinybox.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/prc/process.css" type="text/css"	media="all" />
</head>


<script>



liste="";
function dentChecked(dent, acte){
		 document.getElementById("dent"+dent+'-'+acte).checked = true;

	if(dent != 0)
	{
	  document.getElementById("dentSchema"+dent).value = parseInt(document.getElementById("dentSchema"+dent).value) + 1;
	  if(document.getElementById("dentSchema"+dent).value<=0){
		 document.getElementById("dentSchema"+dent).value = 0;
		 document.getElementById("dent"+dent).style.fontWeight = "normal";
		 document.getElementById("dent"+dent).style.color = "#666";
	  }else{
		 document.getElementById("dent"+dent).style.fontWeight = "bold";
		 document.getElementById("dent"+dent).style.color = "#990000";
	  }
	}  
}


</script>

<body>
      <div id="content" style="overflow-y:scroll;overflow-x:none;height:650px;">


<span id="top"></span>

<br>

        <div class="row form-horizontal">
			<div class="col-lg-12">

			<div class="contenu_popup" style="width:1050px;height:100%;margin:auto;">
<div style="width:1050px;align:center;margin:auto;background-color:white;z-index:1000;">
			<s:form name="pForm2" action="#">
				<div class="image_secteurs">
					<div class="secteur1">
						<s:iterator begin="0" end="7" status="status">
						  <div class="label_dent w_cell_28 f_right" id="dent<s:property value="%{#status.index+11}"/>" ><s:property value="%{#status.index+11}"/></div>
  						</s:iterator>
					</div>
					<div class="secteur2">
						<s:iterator begin="0" end="7" status="status">
						  <div class="label_dent w_cell_28 f_left" id="dent<s:property value="%{#status.index+21}"/>"  ><s:property value="%{#status.index+21}"/></div>
  						</s:iterator>
					</div>
					<div class="secteur3">
						<s:iterator begin="0" end="7" status="status">
						  <div class="label_dent w_cell_24 f_left" id="dent<s:property value="%{#status.index+31}"/>"  ><s:property value="%{#status.index+31}"/></div>
  						</s:iterator>
					</div>
					<div class="secteur4">
						<s:iterator begin="0" end="7" status="status">
						  <div class="label_dent w_cell_24 f_right" id="dent<s:property value="%{#status.index+41}"/>"  ><s:property value="%{#status.index+41}"/></div>
  						</s:iterator>
					</div>
				</div>
				<s:iterator begin="1" end="49" status="status5">
					<input type="hidden" name="dentSchema<s:property value="%{#status5.index}"/>" id="dentSchema<s:property value="%{#status5.index}"/>" value="0">
				</s:iterator>
			</s:form>	


			<div style="width:100%;margin-left:70px;padding:0px;">
			<table class="tb_dents_actes" style="width:940px;">
					<tr class="th_titre_colonnes">
						<td class="td_titre_colonnes" style="background-color:white;"><div class="div_titre_colonnes"></div></td>
							<s:iterator value="actesunitList"   status="status1">
								<td class="td_titre_colonnes"><div class="div_titre_colonnes" title="<s:property value="acte"/>"><s:if test="acte.length() > 8" >&nbsp;<s:property escape="false"  value="%{acte.substring(0,8)}" />... </s:if><s:else>&nbsp;<s:property escape="false"  value="acte" /></s:else></div></td>
							</s:iterator>
					</tr>
			</table>
			</div>


			
</div>			
<div style="width:950px;margin-left:80px;">
			<form name="pForm" action="prc/populateFamille" onsubmit='return validateFormDentiste2(<s:property value="phase.id"/>);'>
			<input type="hidden" name="phase.id" value="<s:property value="phase.id"/>">




			<table class="tb_dents_actes">
					<s:iterator begin="1" end="4" status="chapeau">
							<s:iterator begin="0" end="7" status="status3">
							<tr class="th_titre_colonnes">
								<td class="td_titre_lignes"><s:property value="%{#status3.index+11+10*#chapeau.index}"/></td>
									<s:iterator value="actesunitList" status="status4">
										<td class="td_checkbox">
											<input onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#status3.index+11+10*#chapeau.index}"/>, <s:property value="idacte"/>);" 
											type="checkbox" disabled id="dent<s:property value="%{#status3.index+11+10*#chapeau.index}"/>-<s:property value="idacte"/>">
										</td>
							 		</s:iterator>
						 	</tr>
							</s:iterator>
					<tr class="tr_separator"></tr>
					</s:iterator>
			</table>







						
				<table class="tb_dents_actes" style="border-spacing:25px;margin-left:50px;">
					<tr class="th_titre_colonnes">
						<s:iterator value="actesallList"  status="status1">
							<td class="td_titre_colonnes"><div class="div_titre_colonnes" title="<s:property value='acte' />">&nbsp;<s:if test="acte.length() > 8" ><s:property escape="false"  value="%{acte.substring(0,8)}" />... </s:if><s:else><s:property escape="false"  value="acte" /></s:else></div></td>
						</s:iterator>
					</tr>
	
					<tr class="th_titre_colonnes">
						<s:iterator value="actesallList"  status="status1">
							<td class="td_checkbox">
					  			<input type="checkbox" disabled onclick="javascript:dentDent2(this,<s:property value='phase.id' />, 0, <s:property value='idacte' />);" 
					  			 id="dent0-<s:property value='idacte' />" >
					  		</td>
						</s:iterator>
					</tr>
				</table>				

			</form>
</div>
			</div>
			</div>
			</div>
		
	<div id="foo" style="display: none"></div>
</div>


<script type="text/javascript">
<s:iterator value="etapeList" status="status10">
dentChecked(<s:property value='dent' />, <s:property value='idacte' />);</s:iterator>
</script>
<script type="text/javascript">
	document.location.href="#top";
</script>

</body>
</html>
