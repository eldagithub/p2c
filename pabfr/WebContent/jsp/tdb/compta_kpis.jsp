<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	function today_date(){
		var today = new Date();
   		var dd = today.getDate();
   		var mm = today.getMonth()+1; //January is 0!
   		var yyyy = today.getFullYear();

   		if(dd<10) {
   		    dd='0'+dd
   		} 

   		if(mm<10) {
   		    mm='0'+mm
   		} 

   		today = dd+'/'+mm+'/'+yyyy;
   		return today;
	}
	function listRequete(item){
		overlay();
		document.getElementById("foo2").innerHTML="";
		document.getElementById("foo3").innerHTML="";
		if (item.value == 'Devis0'){
			this.$("#foo").load("<%=request.getContextPath()%>/tdb/listDevisZero");
		}
		if (item.value == 'DevisNonSigne'){
			this.$("#foo").load("<%=request.getContextPath()%>/tdb/listDevisNonSigne");
		}
		if (item.value == 'EntenteFin'){
			this.$("#foo").load("<%=request.getContextPath()%>/tdb/listEntenteFin");
		}
		if (item.value == 'DettesPatient'){
			this.$("#foo").load("<%=request.getContextPath()%>/tdb/listDettesPatient");
		}
	}
</script>
<style>
	.big_letter{
		font-weight:bold;
		font-size:22px;
	}
</style>
<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
              <div class="col-lg-12">
                    <p class="lead">Tableau de bord</p>
                    <p class="text-muted"><i class="fa fa-bar-chart-o fa-2x" style="vertical-align:middle;"></i>&nbsp;&nbsp;&nbsp;Ma comptabilité </p>
			  </div>
 				<br>
			<div class="col-lg-12">
				<hr>
			</div>
		 </div>
		<div class="row form-horizontal">
            <div class="col-lg-12"><b>PARAMETRES</b></div>
			<br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-2">Liste des requêtes</div>
		  	<div class="col-lg-8">
				<select id="taskforms_listeRequeteCompta"  name="taskforms_listeRequeteCompta" size="1" class="form-control" onchange="listRequete(this);">
					<option value="Devis0" selected>Liste des plans de TTT dont le devis n'est réalisé</option>
					<option value="DevisNonSigne">Liste des plans de TTT dont le devis n'est pas signé</option>
					<option value="DettesPatient">Liste des retards de paiement par patient</option>
					<option value="EntenteFin">Récapitulatif de l'entente financière par plan de TTT</option>
				</select>
	        </div>
			<br><br><br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-12"><b>RESULTAT DE LA REQUETE</b></div>
		</div>
			<br>
		<div class="row form-horizontal" id="foo"></div>
			<br>
		<div class="row form-horizontal" id="foo2"></div>
			<br><br>
		<div class=" " id="foo3"></div>

<br>
</div>
<script type="text/javascript">
	this.$("#foo").load("<%=request.getContextPath()%>/tdb/listDevisZero");
</script>


