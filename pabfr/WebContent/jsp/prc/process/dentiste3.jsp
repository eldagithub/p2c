
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ page import="java.util.List"  %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/prc/process.css" type="text/css"	media="all" />
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/spin.min.js"></script>
<sj:head jquerytheme="vader"  jqueryui="true" locale="fr"/>

<script type="text/javascript">

$(function() {
    $(".columnme div div .ui-icon").click(function() {
        $(this).toggleClass("ui-icon-minusthick");
        $(this).parents(".columnme div").find(".portlet-content").toggle();
    });
});

$.subscribe('onupdate', function(event,data) {
	var order="";
	for (var i = 0; i < $("#sortable1").children().length; i++) {
	order=order+'-'+$("#sortable1").children().eq(i).attr('id');
	}
	idphase=<s:property value="phase.id" />;
	//parent.taskOrder(order, <s:property value="phase.id" />);
	familleOrder(order, idphase)
 	
});
function    familleOrder(order, idphase)
{	
	//alert('all : ' + order  );
 	this.$("#form3").load('<%=request.getContextPath()%>/prc/updateOrdrefamille?etape.idphase=' + idphase + 
 			'&order=' + order+'&process.id='+document.getElementById("process.id").value);
}

function validateForm(){
	/*var x=CheckDate(document.forms['pForm'].dfinprev.value);
	if (x==1){
	document.forms['pForm'].submit();
	}*/
	//processCreate5();
	//goTo('<%=request.getContextPath()%>/prc/populateSeance?phase.id=<s:property value="phase.id" />');
	//goTo("<%=request.getContextPath()%>/prc/changeRefprocess?default_refprocess=<s:property value='#session.DFAULTREFPROCESS' />");
	processRead(document.getElementById("process.id").value);

}

function CheckDate(d) {
    // Cette fonction vérifie le format JJ/MM/AAAA saisi et la validité de la date.
    // Le séparateur est défini dans la variable separateur
    var amin=2014; // année mini
    var amax=2025; // année maxi
    var separateur="/"; // separateur entre jour/mois/annee
    var j=(d.substring(0,2));
    var m=(d.substring(3,5));
    var a=(d.substring(6));
    var ok=1;
    
    if ( ((isNaN(j))||(j<1)||(j>31)) && (ok==1) ) {
       alert("Le jour n'est pas correct."); ok=0;
    }
    if ( ((isNaN(m))||(m<1)||(m>12)) && (ok==1) ) {
       alert("Le mois n'est pas correct."); ok=0;
    }
    if ( ((isNaN(a))||(a<amin)||(a>amax)) && (ok==1) ) {
       alert("L'année n'est pas correcte."); ok=0;
    }
    if ( ((d.substring(2,3)!=separateur)||(d.substring(5,6)!=separateur)) && (ok==1) ) {
       alert("Les séparateurs doivent être des "+separateur); ok=0;
    }

    if (ok==1) {
       var d2=new Date(a,m-1,j);
       j2=d2.getDate();
       m2=d2.getMonth()+1;
       a2=d2.getFullYear();
       if (a2<=100) {a2=1900+a2}
       if ( (j!=j2)||(m!=m2)||(a!=a2) ) {
          alert("La date "+d+" n'existe pas !");
          ok=0;
       }
    }
    return ok;
 }



</script>  

<div id="form3">

<div class="inner bg-light lter" >
<span id="top"></span>
<br>
        <div class="row form-horizontal">
			<div class="col-lg-12">
                    <p class="lead">Etape 3 : Ordonnancement des actes par familles de traitement</p>
				<hr>
			</div>
		</div>

        <div class="row form-horizontal">
		
			<s:form name="pForm" action="prc/processCreate">
			
			<input type="hidden" name="idref" value="1">
			<input type="hidden" name="status" value="in_progress">
			<input type="hidden" id="process.id" name="process.id" value="<%= request.getParameter("process.id") %>">
			
				<div class="famille bgc_104080" style="line-height:45px;" title="Acte concerné : Etude esthétique">EXAMEN PRELIMINARE</div>
				<div class="groupe_famille bgc_ED7D26">
					<sj:div id="sortable1" sortableCursor="move" sortable="true" sortableOpacity="9" sortableOnUpdateTopics="onupdate" sortableHelper="clone" sortableForcePlaceholderSize="true" >

						<s:iterator value="familleList" status="status10">
						<s:if test="idfamille != 10 && idfamille != 120">
							<div class="famille bgc_D45522" id='<s:property value='idfamille'/>'
								<s:if test="idfamille == 20"> title="Acte concerné : Litho"</s:if>
								<s:if test="idfamille == 30"> title="Actes concernés : Cup, DP1 ou Depic"</s:if>
								<s:if test="idfamille == 40"> title="Actes concernés : Bio, Rog, Rcrc direct"</s:if>
								<s:if test="idfamille == 50"> title="Actes concernés : NG, Etude occlusale"</s:if>
								<s:if test="idfamille == 60"> title="Actes concernés : Extraction, Chirurgie paro, Greffe gingivale"</s:if>
								<s:if test="idfamille == 70"> title="Actes concernés : Exrtaction, Implanto, Greffe osseuse, Minivis"</s:if>
								<s:if test="idfamille == 80"> title="Actes concernés : Inlay core, Dp2"</s:if>
								<s:if test="idfamille == 90"> title="Actes concernés : Inlay, Onlay, BV2, BNV"</s:if>
								<s:if test="idfamille == 100"> title="Actes concernés : Ortho, Chirurgie orthognatique, Minivis"</s:if>
								<s:if test="idfamille == 110"> title="Acte concerné : Chirurgie esthétique"</s:if>
								>
								<s:property value='famille'/><br><span style="color:#F2C1AE;">
									<s:if test="idfamille == 20">(acte concerné : Litho)</s:if>
									<s:if test="idfamille == 30">(actes concernés : Cup, DP1 ou Depic)</s:if>
									<s:if test="idfamille == 40">(actes concernés : Bio, Rog, Rcrc direct)</s:if>
									<s:if test="idfamille == 50">(actes concernés : NG, Etude occlusale)</s:if>
									<s:if test="idfamille == 60">(actes concernés : Extraction, Chirurgie paro, Greffe gingivale)</s:if>
									<s:if test="idfamille == 70">(actes concernés : Exrtaction, Implanto, Greffe osseuse, Minivis)</s:if>
									<s:if test="idfamille == 80">(actes concernés : Inlay core, Dp2)</s:if>
									<s:if test="idfamille == 90">(actes concernés : Inlay, Onlay, BV2, BNV)</s:if>
									<s:if test="idfamille == 100">(actes concernés : Ortho, Chirurgie orthognatique, Minivis)</s:if>
									<s:if test="idfamille == 110">(acte concerné : Chirurgie esthétique)</s:if></span>
							</div>
						</s:if>
						</s:iterator>

					</sj:div>
				</div>
				
				<div class="famille bgc_622989" style="line-height:45px;" title="Acte concerné : CC, NG">FIN DE TRAITEMENT</div>
			</s:form>	
			
			<br><br>
	
	        <div class="row form-horizontal">
	           <div class="form-group">
                <label class="control-label col-lg-5"></label>
                <div class="col-lg-1 ">
                  <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='goTo("<%=request.getContextPath()%>/prc/changeRefprocess?default_refprocess=<s:property value='#session.DFAULTREFPROCESS' />");'>
                </div>
                <div class="col-lg-1 ">
	              <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-flat" onclick="validateForm();">
	            </div>
	           </div>
	        </div>
	</div>
</div>
</div>

<script type="text/javascript">
	restore();
	document.location.href="#top";
</script>
