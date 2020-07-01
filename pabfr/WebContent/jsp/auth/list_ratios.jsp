<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function update_ratios(idref, value){
	kpi = Number(escape(value));
	if (isNaN(Number(kpi)) == false){
		if(kpi >=0 && kpi <= 100){
			$("#list_ratios").load('<%=request.getContextPath()%>/adm/update_ratio?objet.idref='+idref+'&objet.description='+escape(kpi));
		}else{
			alert("Les gains en temps générés par regroupement des actes en séances doivent être des nombres compris entre 0 et 100.");
		}
	}else{
		alert("Les gains en temps générés par regroupement des actes en séances doivent être des nombres compris entre 0 et 100.");
	}
}
</script>
						<s:if test="objetList.size() > 0">

        	<div class="row">
				<br>
              	<div class="col-lg-12">
                    <p class="text-muted"><s:text name="admin_page.modify_ratios.title"/></p>
					<hr>
				</div>
			</div>
          	<div class="row form-horizontal">
            	<div class="col-lg-2"></div>
            	<div class="col-lg-8">
                      <div class="form-group">
                        <label class="control-label col-lg-1"><s:text name="Regroupement d'actes différents pour la même dent"/></label>
                      </div>

							<s:iterator value="objetList" status="UserStatus">
								<s:if test="#UserStatus.odd == true ">
	                     		 <div class="form-group">
			                        <label class="control-label col-lg-2" style="text-align:left;"></label>
			                        <label class="control-label col-lg-4" style="font-weight:normal;"><s:text name="Gain de temps sur le deuxième acte"/></label>
			                        <div class="col-lg-2" style="text-align:right;"><input type="text" id="<s:property value="nom" />" name="<s:property value="nom" />" class="form-control" value="<s:property value='description'/>" onmouseout="update_ratios(<s:property value='idref'/>, this.value);" /></div>
			                        <label class="control-label col-lg-1" style="text-align:left;"><s:text name="% "/></label>
			                        <label class="control-label col-lg-4" style="text-align:left;"></label>
	                      		 </div>
								</s:if>
								<s:if test="#UserStatus.even == true ">
	                     		 <div class="form-group">
			                        <label class="control-label col-lg-2" style="text-align:left;"></label>
			                        <label class="control-label col-lg-4" style="font-weight:normal;"><s:text name="Gain de temps sur les actes suivants"/></label>
			                        <div class="col-lg-2" style="text-align:right;"><input type="text" id="<s:property value="nom" />" name="<s:property value="nom" />" class="form-control" value="<s:property value='description'/>"  onmouseout="update_ratios(<s:property value='idref'/>, this.value);" /></div>
			                        <label class="control-label col-lg-1" style="text-align:left;"><s:text name="% "/></label>
			                        <label class="control-label col-lg-4" style="text-align:left;"></label>
	                      		 </div>
	                      		 <br>
								</s:if>
								<s:if test="#UserStatus.getCount() == 2 ">
			                      <div class="form-group">
			                        <label class="control-label col-lg-1"><s:text name="Regroupement d'actes identiques sur des dents différentes"/></label>
			                      </div>
								</s:if>
								<s:if test="#UserStatus.getCount() == 4 ">
			                      <div class="form-group">
			                        <label class="control-label col-lg-1"><s:text name="Regroupement d'actes différents sur un même secteur"/></label>
			                      </div>
								</s:if>
								<s:if test="#UserStatus.getCount() == 6 ">
			                      <div class="form-group">
			                        <label class="control-label col-lg-1"><s:text name="Regroupement d'actes sur des secteurs différents"/></label>
			                      </div>
								</s:if>
							
	                        </s:iterator>
                        </s:if>
                </div>
            </div>

<script type="text/javascript">
	restore();
</script>


