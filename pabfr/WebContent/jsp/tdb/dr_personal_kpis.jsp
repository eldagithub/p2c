<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.fr.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker3.min.css">

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
	function calculHPJournee(){
    	this.$("#HonoProgJournee").load("<%=request.getContextPath()%>/tdb/KpiHonoProgJournee?tache.dstartprev="+document.getElementById("today_date").value);
	}
	function calculHP7NextDays(){
    	this.$("#HonoProg7NextDays").load("<%=request.getContextPath()%>/tdb/KpiHonoProg7NextDays?tache.dstartprev="+document.getElementById("today_date").value);
	}
	function calculHP7PreviousDays(){
    	this.$("#HonoProg7PreviousDays").load("<%=request.getContextPath()%>/tdb/KpiHonoProg7PreviousDays?tache.dstartprev="+document.getElementById("today_date").value);
	}
	function getHPJourneeDR(){
    	this.$("#HPJourneeDR").load("<%=request.getContextPath()%>/tdb/HPJourneeDR");
	}
	function getHPSemaineDR(){
    	this.$("#HPSemaineDR").load("<%=request.getContextPath()%>/tdb/HPSemaineDR");
	}

	$('.datepicker4').datepicker({
	    language: "fr",
	    weekStart: "1",
	    format:"dd/mm/yyyy",
	    todayHighlight: true
	});
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
                    <p class="text-muted"><i class="fa fa-bar-chart-o fa-2x" style="vertical-align:middle;"></i>&nbsp;&nbsp;&nbsp;Mon module financier </p>
			  </div>
 				<br>
			<div class="col-lg-12">
				<hr>
			</div>
		 </div>
		<div class="row form-horizontal">
            <div class="col-lg-12"><b>OBJECTIFS ANNUELS</b></div>
			<br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-2"></div>
            <div class="col-lg-1"><i class="fa fa-hand-o-right fa-2x"></i></div>
            <div class="col-lg-4">Honoraires programmés à la journée</div>
            <div class="col-lg-5 big_letter"><span id="HPJourneeDR"></span>€</div>
			<br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-2"></div>
            <div class="col-lg-1"><i class="fa fa-hand-o-right fa-2x"></i></div>
            <div class="col-lg-4">Honoraires programmés à la semaine</div>
            <div class="col-lg-5 big_letter"><span id="HPSemaineDR"></span>€</div>
			<br><br><br><br><br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-4"><b>PREVISIONNEL de la JOURNEE du 	</b></div>
            <div class="col-lg-2">
            	<div class="form-group">
	            	<input id="today_date" name="today_date" type="text" placeholder="JJ/MM/YYYY" value="" class="form-control datepicker4" >
	            </div>
	        </div>
            <div class="col-lg-1">
            	<div class="form-group">
	            	&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick="calculHPJournee();calculHP7NextDays();calculHP7PreviousDays();">
	            </div>
			</div>
            <div class="col-lg-5"></div>
			<br><br><br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-2"></div>
            <div class="col-lg-1"><i class="fa fa-hand-o-right fa-2x"></i></div>
            <div class="col-lg-4">Honoraires programmés de cette journée</div>
            <div class="col-lg-5 big_letter"><span id="HonoProgJournee"></span>€</div>
			<br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-2"></div>
            <div class="col-lg-1"><i class="fa fa-hand-o-right fa-2x"></i></div>
            <div class="col-lg-4">Honoraires programmés sur les 7 prochains jours<br>(journée sélectionnée comprise)</div>
            <div class="col-lg-5 big_letter"><span id="HonoProg7NextDays"></span>€</div>
			<br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-3"></div>
            <div class="col-lg-4"><hr></div>
            <div class="col-lg-5"></div>
			<br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-12"><b>REALISE</b></div>
			<br><br>
		</div>
		<div class="row form-horizontal">
            <div class="col-lg-2"></div>
            <div class="col-lg-1"><i class="fa fa-hand-o-right fa-2x"></i></div>
            <div class="col-lg-4">Honoraires programmés sur les 7 précédents jours<br>(hors journée sélectionnée)</div>
            <div class="col-lg-5 big_letter"><span id="HonoProg7PreviousDays"></span>€</div>
			<br><br>
		</div>
<br>
</div>
<script type="text/javascript">
	restore();
	document.getElementById("today_date").placeholder=today_date();
	document.getElementById("today_date").value=today_date();
	calculHPJournee();
	calculHP7NextDays();
	calculHP7PreviousDays();
	getHPJourneeDR();
	getHPSemaineDR();
</script>


