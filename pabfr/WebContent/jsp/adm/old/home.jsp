
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/adm/adm.css" type="text/css" media="all" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/spin.min.js"></script>
<style>
<!--
.overlay
{
   background-color: #000;
   opacity: .7;
   filter: alpha(opacity=70);
   position: absolute; top: 0; left: 0;
   width: 100%; height: 100%;
   z-index: 10;
}

-->
</style>
<script type="text/javascript">
var opts = {
		  lines: 15, // The number of lines to draw
		  length: 20, // The length of each line
		  width: 10, // The line thickness
		  radius: 30, // The radius of the inner circle
		  corners: 1, // Corner roundness (0..1)
		  rotate: 0, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  color: '#FFF', // #rgb or #rrggbb or array of colors
		  speed: 1, // Rounds per second
		  trail: 60, // Afterglow percentage
		  shadow: true, // Whether to render a shadow
		  hwaccel: false, // Whether to use hardware acceleration
		  className: 'spinner', // The CSS class to assign to the spinner
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		};


function overlay() {

	   var overlay = document.createElement("div");
	   overlay.setAttribute("id","overlay");
	   overlay.setAttribute("class", "overlay");
	   document.body.appendChild(overlay);
		var spinner = new Spinner(opts).spin(overlay);

	}

function restore() {
	   var overlay = document.getElementById("overlay");
	   if(overlay) document.body.removeChild( overlay );
	}
</script>

<div id="main">

	<div id="cadre_contenu">

		<div class="cadre_admin_infos">
			<div class="titre_lister_admin_infos">Compte Administrateur</div>
			<div class="cadre_lister_admin_infos">
				<div class="cadre_item_admin_infos">Entreprise : <s:text name="client.compagny"/></div>
				<div class="cadre_item_admin_infos" title="<s:text name="client.email_admin_func"/>">Email de contact : <s:text name="client.email_admin_func"/></div>
				<div class="cadre_item_admin_infos" title="<s:text name="client.name_admin_func"/>">Administrateur : <s:text name="client.name_admin_func"/></div>
				<div class="cadre_item_admin_infos">Espace de travail : <s:text name="client.namespace"/></div>
				<div class="cadre_item_admin_infos_logo"></div>
			</div>
		</div>

		<div id="ref_contenu_adm">
			<jsp:include page="./list.jsp" />
		</div>






	</div>


</div>



