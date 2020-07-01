<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"  %>


<script type="text/javascript">
function validateForm(){
	/*var x=CheckDate(document.forms['pForm'].dfinprev.value);
	if (x==1){
		document.forms['pForm'].submit();
	}*/
	//processCreate6();
	goTo("<%=request.getContextPath()%>/prc/changeRefprocess?default_refprocess=<s:property value='#session.DFAULTREFPROCESS' />");

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


function setTacheByActeDentPhase (_idacte, _dent, _idphse, filed){
	overlay();
	goTo('<%=request.getContextPath()%>/prc/setSeanceActe?phase.id=' + _idphse + '&etape.idphase=' + _idphse + '&etape.dent=' + _dent + '&etape.idacte=' + _idacte + '&etape.idtache=' + filed.value);
    restore();
}
function setTacheByActeDentPhase2 (_idacte, _dent, _idphse, _id){
	this.$("#foo").load('<%=request.getContextPath()%>/prc/setSeanceActe?phase.id=' + _idphse + '&etape.idphase=' + _idphse + '&etape.dent=' + _dent + '&etape.idacte=' + _idacte + '&etape.idtache=' + _id);
}

function setTacheResponsable (_idtache, filed){
	overlay();
	goTo('<%=request.getContextPath()%>/prc/setResponsableSeance?phase.id=<s:property value="phase.id" />&tache.id=' + _idtache + '&tache.idresponsable=' + filed.value);
    restore();	
}

</script>  


<div class="inner bg-light lter">
<span id="top"></span>
<br>
        <div class="row form-horizontal">
			<div class="col-lg-12">
                    <p class="lead">Etape 4 : Regroupement des étapes de traitement par séance</p><br>
			</div>
		</div>





				<s:form name="pForm" action="prc/processCreate">
					<input type="hidden" name="idref" value="1">
					<input type="hidden" name="status" value="in_progress">

<s:set var="lastIdActValue" value="" />

<s:iterator value="etapeList" status="status10">
<s:set var="idResponsableTache" value="" />

<s:if test="idacte != #lastIdActValue " > 

			<div class="row">
				<div class="col-lg-12">
					<p class="text-muted">
						Pour l'acte <b>'<s:property value="%{acte.toUpperCase()}" />'</b> :
					</p>
					<hr>
				</div>
			</div>

 </s:if>
 
 				<div class="row form-horizontal">
					<div class="form-group">
						<label class="control-label col-lg-4"><!--<s:property value='idacte' /> - -->
							<s:if test="dent == 0">Traitement global</s:if>
							<s:else>
								Dent traitée n° <s:property value='dent' /> :
							</s:else>
						</label>
						<div class="col-lg-5 ">


							<select id="etape.idtache"  name="etape.idtache" class="form-control" onchange="setTacheByActeDentPhase(<s:property value="idacte"/>, <s:property value="dent"/>, <s:property value="idphase"/>, this)" >
								<s:if test="tacheList.size() > 0">
									<s:iterator value="tacheList" status="tacheStatus">
										<option value="<s:property value='id' />"
											<s:if test="id==idtache"> selected </s:if>>
											<!--<s:property value='id' />---><s:property value='nom' /> n° <s:property value="%{#tacheStatus.index+1}"/>
										</option>
									</s:iterator>
								</s:if>
							</select>
							<!--<script>setTacheByActeDentPhase2(<s:property value="idacte"/>, <s:property value="dent"/>, <s:property value="idphase"/>, document.getElementById('etape.idtache_<s:property value='dent' />').value);</script>-->
						</div>
						<div class="col-lg-2 "><!-- 
							<select name="docteur_actes" class="form-control" onchange="setTacheResponsable(<s:property value="idtache"/>, this)">
								<s:if test="ctList.size() > 0">
									<s:iterator value="ctList" status="ctListStatus">
										<option value="<s:property value='id' />"
											<s:if test="id == #idResponsableTache"> selected</s:if>>
											<s:property value='id' />-<s:property value='nom' /> <s:property value='prenom' />
										</option>
									</s:iterator>
								</s:if>

							</select>-->
						</div>
						<label class="control-label col-lg-3"></label>
					</div>
				</div>

<s:set var="lastIdActValue" value="%{idacte}" />
</s:iterator>


		<div class="row">

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

<div id="foo" style="display: none"></div>

<script type="text/javascript">
	restore();
	document.location.href="#top";
</script>
