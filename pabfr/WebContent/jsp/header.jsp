<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Process2Com - <s:text name="client.namespace"/></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_new.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/todo/todo.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/func.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tinybox.js"></script>
</head>
<div class="banniere_fond"></div>

<body class="body">
<div class="banniere">
	<div class="logo menu_onglet_process" onclick="location.href='<%=request.getContextPath()%>/jsp/home.jsp';">Process2Com
		<s:if test="#session.refProcessList.size() > 0">
		       <ul><li><ul class="sous_menu_onglet_process">
						<s:iterator value="#session.refProcessList" status="refProcessStatus">
				            <li><a href="<%=request.getContextPath()%>/prc/changeRefprocess?default_refprocess=<s:property value='idref' />" onclick=""> <s:property value='nom' /></a>
				            <div class='<s:if test="#session.DFAULTREFPROCESS!=idref">not_</s:if>selected_process'    >&nbsp;</div>			            
				            </li> 
				            <s:if test="#session.DFAULTREFPROCESS==idref">
								<s:form name="pForm" action="#">
											<input type="hidden" id="nom_selected_process" name="nom_selected_process" value="<s:property value='nom' />">
								</s:form>
							</s:if>
						</s:iterator>
		        </ul></li></ul>
		</s:if>
	</div>
	<div class="connection">
	      		<s:if test="#session.UserSessionKey.profile != null">
				<!--  <div class="div_search"><input class="search" type="text" size="10" value="" /></div> -->	
          		<a href="<%=request.getContextPath()%>/auth/logout" class="login">
				 Se déconnecter</a>&nbsp;<a href="<%=request.getContextPath()%>/profile/home" >(<s:property value="#session.UserSessionKey.name" />)</a> 
				</s:if>
				<s:else>
          		<a href="<%=request.getContextPath()%>/auth/login" class="login">
				 <b>Se connecter</b></a>
				</s:else>
	</div>
</div>
<div class="navigation">
	<ul>
		<li class="navigation_separator"><a href="<%=request.getContextPath()%>/event/wall">Wall</a></li>
		<li class="navigation_separator"><a id="label_mes_processus" href="<%=request.getContextPath()%>/prc/home"  class="">Mes Processus
		</a></li>
		<li class="navigation_separator"><a href="<%=request.getContextPath()%>/tdb/home" >Tableau de bord</a></li>
	      	<s:if test="#session.UserSessionKey.profile == 'full'">
		<li class="navigation_separator"><a href="<%=request.getContextPath()%>/adm/home" >Paramètres</a></li>
			</s:if>
		<li class="navigation_separator_fin"><a href="<%=request.getContextPath()%>/cnt/home" >Aide</a></li>
		<li class="navigation_separator_fin">
		</li>
	</ul>
	<div class="logo2"></div>
</div>

<script>
document.getElementById("label_mes_processus").innerHTML=document.getElementById("nom_selected_process").value;
</script>

<div class="corps">

