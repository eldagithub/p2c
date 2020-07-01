<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function validateForm3(oFormElement){
	/*
	var x=CheckDate(document.getElementById("datepicker2").value);
	if (x==1){

		this.$("#page_content").load('<%=request.getContextPath()%>/prc/processCreate?idref=' + document.getElementById("idref").value 
				+ '&status=in_progress'
				+ '&idprogramme=' + document.getElementById("idprogramme").options[idprogramme.selectedIndex].value 
				+ '&idgare=' + document.getElementById("idgare").options[idgare.selectedIndex].value 
				+ '&dfinprev=' + document.getElementById("datepicker2").value 
				+ '&couleur=' + document.getElementById("couleur").value 
				+ '&iddp=' + document.getElementById("iddp").options[iddp.selectedIndex].value 
				+ '&idcp=' + document.getElementById("idcp").options[idcp.selectedIndex].value 
				+ '&codebudget=' + escape(document.getElementById("codebudget").value) 
		);
	}
	
	var x=CheckDate(document.getElementById("datepicker2").value);
	document.getElementById("couleur").value = (document.getElementById("couleur2").value).slice(1);
	if (x==1){
		  var xhr = new XMLHttpRequest();
		  xhr.onload = function(){
			  document.getElementById("page_content").innerHTML=xhr.responseText;}
		  xhr.open (oFormElement.method, oFormElement.action, true);
		  xhr.send (new FormData (oFormElement));
	}
	return false;
	*/
	//processCreate2();
	return false;
}

$( "#datepicker2" ).click(function() {
	   $( "#datepicker2" ).datepicker(
	    		{
	    			  firstDay: 1,
	    			  dateFormat: "dd/mm/yy",
	    			  monthNames: [ <s:text name="label.month_names"/> ],
	    			  dayNamesMin: [ <s:text name="label.week_names"/> ]
	    		}
	    );
	$( "#datepicker2" ).datepicker("show");
});
</script>

<div class="inner bg-light lter">
		<br>
        <div class="row form-horizontal">
            <div class="col-lg-12">
                  <p class="lead"><s:text name="process_page.button.new_process"/></p>
                  <hr>
	  		</div>
	
		<s:form action="processCreate"  id="pForm" name="pForm" method="post"  onsubmit="return validateForm3(this);">
            <div class="col-lg-12">
			<input type="hidden" id="idref"  name="idref" value="1">
			<input type="hidden" id="status" name="status" value="in_progress">
			<input type="hidden" id="couleur" name="couleur" value="9b59b6">
	  		<br><br>

                     <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="repository2.Name"/></label>
                        <div class="col-lg-6">
							<select id="idprogramme"  name="idprogramme" class="form-control">
								<s:if test="programmeList.size() > 0">
									<s:iterator value="programmeList" status="programmeStatus">
										<option value="<s:property value='idref' />"
											<s:if test="idref==process.idprogramme">selected</s:if>>
											<s:property value='nom' />
										</option>
									</s:iterator>
								</s:if>
							</select>
                        </div>
                      </div>

                     <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="repository1.Name"/></label>
                        <div class="col-lg-6">
							<select id="idgare" name="idgare" class="form-control">
								<s:if test="gareList.size() > 0">
									<s:iterator value="gareList" status="gareStatus">
										<option value="<s:property value='idref' />"
											<s:if test="idref==process.idgare">selected</s:if>>
											<s:property value='nom' />
										</option>
									</s:iterator>
								</s:if>
							</select>
                        </div>
                      </div>

                     <!-- <div class="form-group"  id="colorPickerBlock">
                        <label class="control-label col-lg-4">Couleur</label>
                        <div class="col-lg-6">
	        				<input type="color" id="couleur2" name="couleur2" value="#9b59b6" class=" form-control" >
                        </div>
                     </div>-->

                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="process_page.task_edateprev"/></label>
                        <div class="col-lg-6"><input type="text" id="datepicker2" name="dfinprev" placeholder="JJ/MM/YYYY" value="12/07/2015" onclick="" class="form-control"></div>
                      </div>

                     <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="userprofile.directeurprocess"/></label>
                        <div class="col-lg-6">
							<select id="iddp"  name="iddp" class="form-control">
								<s:if test="dpList.size() > 0">
									<s:iterator value="dpList" status="dpStatus">
									<s:if test="nom!='elmos'">
										<option value="<s:property value='id' />"
											<s:if test="login == #session.UserSessionKey.name">selected</s:if> >
											<s:property value='nom' /> <s:property value='prenom' /> 
										</option>
									</s:if>
									</s:iterator>
								</s:if>
							</select>
                        </div>
                      </div>

                     <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="userprofile.conducteur"/></label>
                        <div class="col-lg-6">
							<select id="idcp" name="idcp" class="form-control">
								<s:if test="cpList.size() > 0">
									<s:iterator value="cpList" status="cpStatus">
									<s:if test="nom!='elmos'">
										<option value="<s:property value='id' />"
											<s:if test="login == #session.UserSessionKey.name">selected</s:if> >
											<s:property value='nom' /> <s:property value='prenom' /> 
										</option>
									</s:if>
									</s:iterator>
								</s:if>
							</select>
                        </div>
                      </div>

                     <div class="form-group">
                        <label class="control-label col-lg-4">Numéros de compte</label>
                        <div class="col-lg-6">
							<input type="text" id="codebudget" name="codebudget" placeholder="X123456, A786786, ... " value="<s:property value='process.codebudget' /> " class="form-control"/>
                        </div>
                      </div>

			</div>
                      <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 "><br><br>
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary">
	                      </div>
                      </div>
  		</s:form>
	
  		</div>
</div>


<script type="text/javascript">
	restore();
</script>
