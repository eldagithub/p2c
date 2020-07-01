<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"  %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/prc/process.css" type="text/css"	media="all" />


<div class="inner bg-light lter">
<span id="top"></span>

<br>

        <div class="row form-horizontal">
			<div class="col-lg-12">
                    <p class="lead">Etape 2 : Identification des actes et des dents associées</p>
				<hr>
			</div>
		</div>

        <div class="row form-horizontal">
<script>
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
			<div class="col-lg-12">

			<div class="contenu_popup" style="width:100%;margin:auto;">
<div style="width:100%;height:340px;align:center;margin:auto;background-color:white;z-index:1000;">
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
								<td class="td_titre_colonnes"><div class="div_titre_colonnes" title="<s:property value="acte"/>"><!--<s:property value="idacte"/>--->&nbsp;<s:property value="acte"/></div></td>
							</s:iterator>
					</tr>
			</table>
			</div>


			
</div>			
<div style="width:85%;margin-left:80px;overflow-y:scroll;overflow-x:hidden;height:550px;">
			<form name="pForm" action="prc/populateFamille" onsubmit='return validateFormDentiste2(<s:property value="phase.id"/>, <s:property value="process.id"/>);'>
			<input type="hidden" name="phase.id" value="<s:property value="phase.id"/>">
			<input type="hidden" name="process.id" value="<s:property value="process.id"/>">

<div id="dentiste2_contenu_1" style="width:100%;margin:0px;padding:0px;height:100p;"></div>
<div id="dentiste2_contenu_2" style="width:100%;margin:0px;padding:0px;height:100p;"></div>
<div id="dentiste2_contenu_3" style="width:100%;margin:0px;padding:0px;height:100p;"></div>
<div id="dentiste2_contenu_4" style="width:100%;margin:0px;padding:0px;height:100p;"></div>
				
			<table class="tb_dents_actes" style="border-spacing:25px;margin-left:50px;">
				<tr class="th_titre_colonnes">
					<s:iterator value="actesallList"  status="status1">
						<td class="td_titre_colonnes"><div class="div_titre_colonnes" title="<s:property value='acte' />">&nbsp;<s:property value='acte' /></div></td>
					</s:iterator>
				</tr>

				<tr class="th_titre_colonnes">
					<s:iterator value="actesallList"  status="status1">
						<td class="td_checkbox">
				  			<input type="checkbox" onclick="javascript:dentDent2(this,<s:property value='phase.id' />, 0, <s:property value='idacte' />);" 
				  			 id="dent0-<s:property value='idacte' />" >
				  		</td>
					</s:iterator>
				</tr>
			</table>

	        <div class="row form-horizontal">
	           <div class="form-group">
	                <label class="control-label col-lg-5"></label>
	                <div class="col-lg-1 ">
	                  <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='processRead(<s:property value='process.id' />);'>
	                </div>
	                <div class="col-lg-1 ">
	              <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-flat"><br>
	            </div>
            	<label class="control-label col-lg-6"><br><br><br><br></label>
	           </div>
	        </div>
			<br><br><br><br>


				

			</form>
</div>
			</div>
			</div>
			</div>
</div>
<div id="foo" style="display: none"></div>
				
<script type="text/javascript">
	document.location.href="#top";
	this.$("#dentiste2_contenu_1").load("<%=request.getContextPath()%>/prc/getDentiste2Contenu1?process.id=<s:property value="process.id"/>&phase.id=<s:property value="phase.id"/>");
	//this.$("#dentiste2_contenu_2").load("<%=request.getContextPath()%>/prc/getDentiste2Contenu2?process.id=<s:property value="process.id"/>&phase.id=<s:property value="phase.id"/>");
	//this.$("#dentiste2_contenu_3").load("<%=request.getContextPath()%>/prc/getDentiste2Contenu3?process.id=<s:property value="process.id"/>&phase.id=<s:property value="phase.id"/>");
	//this.$("#dentiste2_contenu_4").load("<%=request.getContextPath()%>/prc/getDentiste2Contenu4?process.id=<s:property value="process.id"/>&phase.id=<s:property value="phase.id"/>");
	
</script>


</html>
