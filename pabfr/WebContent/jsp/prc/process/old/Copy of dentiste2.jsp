<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"  %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/prc/process.css" type="text/css"	media="all" />


<div class="inner bg-light lter" style="height:1300px;">
<br>

        <div class="row form-horizontal">
			<div class="col-lg-12">
                    <p class="lead">Etape 2 : Identification des dents et actes</p>
				<hr>
			</div>
		</div>

        <div class="row form-horizontal">
<script>


</script>
			<div class="col-lg-12">

			<div class="contenu_popup">
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
			
			<form name="pForm" action="prc/populateFamille" onsubmit='return validateFormDentiste2(<s:property value="phase.id"/>);'>
			<input type="hidden" name="phase.id" value="<s:property value="phase.id"/>">
				<div class="contenu_formulaire">
					<div class="ligne_dent">
						<div class="titre_colonnes f_left" style="background-color:white;"></div>
						<s:iterator value="actesunitList"   status="status1">
							<div class="titre_colonnes f_left" title="<s:property value="acte"/>"><s:property value="idacte"/>-<s:property value="acte"/></div>
						</s:iterator>
					</div>
		
						
					<s:iterator begin="1" end="4" status="chapeau">
						<br><div class="cadre_secteur">
							<s:iterator begin="0" end="7" status="status3">
								<div class="ligne_dent">
									<div class="titre_lignes f_left"><s:property value="%{#status3.index+11+10*#chapeau.index}"/></div>
									<s:iterator value="actesunitList" status="status4">
										<div class="div_checkbox f_left">
											<input onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#status3.index+11+10*#chapeau.index}"/>, <s:property value="idacte"/>);" 
											type="checkbox" id="dent<s:property value="%{#status3.index+11+10*#chapeau.index}"/>-<s:property value="idacte"/>">
										</div>
							 		</s:iterator>
							 			<br>
						 		</div>
							</s:iterator>
						</div>
						<br>

					</s:iterator><br>	
						<br>






						
					<div class="ligne_dent">
						<div class="titre_colonnes f_left" style="background-color:white;"></div>
						<s:iterator value="actesallList"  status="status1">
							<div class="titre_colonnes f_left" style="width:63px;" title="<s:property value='acte' />"><s:property value='acte' /></div>
						</s:iterator>
					</div>
					<br>
					<div class="ligne_dent">
						<div class="titre_colonnes f_left" style="background-color:white;"></div>
						<s:iterator value="actesallList"  status="status1">
					  		<div class="titre_colonnes f_left" style="width:63px;text-align:center;background-color:white;" >
					  		<input type="checkbox" onclick="javascript:dentDent2(this,<s:property value='phase.id' />, 0, <s:property value='idacte' />);" 
					  		 id="dent0-<s:property value='idacte' />" ></div>
						</s:iterator>
					</div>
					<br><br>

					</div>
				

		        <div class="row form-horizontal">
		           <div class="form-group">
		            <label class="control-label col-lg-5"></label>
		            <div class="col-lg-1 ">
		              <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"><br>
		            </div>
		           </div>
		        </div>
				<br><br><br><br>


				

			</form>
			</div>
			</div>
			</div>
</div>
	<div id="foo" style="display: none"></div>

<script type="text/javascript">
//alert("coucouff");
<s:iterator value="etapeList" status="status10">
dentChecked(<s:property value='dent' />, <s:property value='idacte' />);</s:iterator>

</script>
<script type="text/javascript">

	restore();
</script>

</html>
