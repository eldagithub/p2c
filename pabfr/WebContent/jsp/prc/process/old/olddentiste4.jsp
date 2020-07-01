<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.List"  %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style_new.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/prc/process.css" type="text/css"	media="all" />
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
function validateForm(){
	/*var x=CheckDate(document.forms['pForm'].dfinprev.value);
	if (x==1){
		document.forms['pForm'].submit();
	}*/
	processCreate5();
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

<div class="inner bg-light lter">
<br>
    <div class="row form-horizontal">
		<div class="col-lg-12">
                  <p class="lead">Etape 4 : Définition du nombre d'étapes de traitement par acte</p>
		<hr>
		</div>
	</div>


<body class="body_popup">
			
			


				<s:form name="pForm" action="prc/processCreate">
					<input type="hidden" name="idref" value="1">
					<input type="hidden" name="status" value="in_progress">
						<%
				        	String[] actes = {"Cup", "Inlay", "Onlay", "Ext", "Impl", "Bio", "DP1", "L4S", "Depic", "Apex", "Rog", "RcRc Direct", "Inlay Core", "Greffe Gingivale", "DP2", "CC"};
							request.setAttribute("actes" , actes);
						%>
					<div class="contenu_formulaire2">
						<s:iterator begin="0" end="15" status="status1">
							<div class="p_t_label_donnee" style="width:250px;">Nombre d'étapes pour l'acte '${ actes[status1.index] }' : </div>
							<div class="p_t_label_input" style="width:20px;">
								<select name="etapes_actes">
									<option value="${ actes[status1.index] }_1">1</option>
									<option value="${ actes[status1.index] }_2">2</option>
									<option value="${ actes[status1.index] }_3">3</option>
									<option value="${ actes[status1.index] }_4">4</option>
								</select>
							</div>
						</s:iterator>
					</div>

				</s:form>

	
			
			<br><br>
	
	        <div class="row form-horizontal">
	           <div class="form-group">
	            <label class="control-label col-lg-5"></label>
	            <div class="col-lg-1 ">
	              <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick="validateForm();">
	            </div>
	            <div class="col-lg-1 ">
	              <input type="submit" value="<s:text name="button.label.cancel"/>" class="btn btn-primary">
	            </div>
	            <label class="control-label col-lg-5"></label>
	           </div>
	        </div>






</body>
</div>

<script type="text/javascript">
	restore();
</script>
