<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ page import="java.util.List"  %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/prc/process.css" type="text/css"	media="all" />
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/spin.min.js"></script>
<sj:head jquerytheme="vader"  jqueryui="true" locale="fr"/>

<script type="text/javascript">
function validateForm(){
	/*var x=CheckDate(document.forms['pForm'].dfinprev.value);
	if (x==1){
		document.forms['pForm'].submit();
	}*/
	goTo("<%=request.getContextPath()%>/prc/changeRefprocess?default_refprocess=1");
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
 		order=order+':'+$("#sortable1").children().eq(i).attr('id');
    }		
		//alert('all : ' + order  );
		
		//parent.taskOrder(order, <s:property value="phase.id" />);
	
	});
</script>  




<div class="inner bg-light lter">
<br>
        <div class="row form-horizontal">
			<div class="col-lg-12">
                    <p class="lead">Etape 5 : Finalisation du plan de traitement</p><br><br>
			</div>
		</div>








	      <div class="row">
              <div class="col-lg-12">
                <div class="box-body">
		                    <table class="table_process responsive-table" style="margin-bottom:0px;">
		                      <thead>
		                        <tr>
		                          <td style="width:450px"><b>ACTE | Etape de traitement</b></td>
		                          <td class="hidden-xs" ><b><s:text name="process_page.task_responsible"/></b></td>
		                          <td class="hidden-xs" style="width:150px"><b>Dent</b></td>
		                          <td class="hidden-xs" style="width:150px"><b>Durée</b></td>
		                          <td style="width:150px"><b>Délai min</b></td>
		                          <td style="width:50px"></td>
		                          <td style="width:50px"></td>
		                         </tr>
		                      </thead>    
		                    </table>
				     <sj:div id="sortable1"  sortableCursor="move" sortable="true" sortableOpacity="9" sortableOnUpdateTopics="onupdate" sortableHelper="clone" sortableForcePlaceholderSize="true" >
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          CUP | Obturation temporaire (optionnelle)
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;16;17</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          CUP | Réalisation du composite up
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;16;17</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          CUP | Obturation temporaire (optionnelle)
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;16;17</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          CUP | Réalisation du composite up
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;16;17</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          INLAY | Nettoyer la carie ; faire l'empreinte ; mise en place provisoire
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;16;17;18</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          INLAY | Envoi au prothésite
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;16;17;18</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          INLAY | Réception de la prothèse
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;16;17;18</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          INLAY | Coller l'inlay
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;16;17;18</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          DP1 | Faire une dent provisoire
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;23</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>
				                    
				                    <div class="panel box box-707070 "  id='' style="margin-bottom:10px;">
				                      <div class="box-header with-border" >
				                        <h5 class="box-title">
						                    <table class="table_process responsive-table" style="margin-bottom:0px;">
						                      <tbody>
						                        <tr>
						                          <td style="width:450px">
						                          DP1 | Faire une dent provisoire
												  </td>
						                          <td class="hidden-xs">DR ...</td>
						                          <td class="hidden-xs" style="width:150px;"> &nbsp;35</td>
						                          <td class="hidden-xs" style="width:150px;">&nbsp;90</td>
						                          <td style="width:150px">&nbsp;15</td>
						                          <td style="width:50px">&nbsp;<i class=" fa fa-times-circle"></i></td>
						                          <td style="width:50px">&nbsp;<input class="uniform" type="checkbox" style="margin-bottom:3px;"></td>
						                         </tr>
						                      </tbody>    
						                    </table>
				                        </h5>
				                      </div>
				                    </div>				                    
						</sj:div>
                </div><!-- /.box-body -->
              </div><!-- /.col-lg-12 -->
           </div>
           <!-- /.row -->	
			
			<br><br>
	        <div class="row form-horizontal">
	           <div class="form-group">
	            <label class="control-label col-lg-3"></label>
	            <div class="col-lg-2 ">
	              <input type="submit" value="Regrouper" class="btn btn-primary">
	            </div>
	            <div class="col-lg-2 ">
	              <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick="validateForm();">
	            </div>
	            <div class="col-lg-2 ">
	              <input type="submit" value="<s:text name="button.label.cancel"/>" class="btn btn-primary">
	            </div>
	           </div>
	        </div>
	</div>







<script type="text/javascript">
	restore();
	goTo("<%=request.getContextPath()%>/prc/changeRefprocess?default_refprocess=<s:property value='#session.DFAULTREFPROCESS' />");
</script>
