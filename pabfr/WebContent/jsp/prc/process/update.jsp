<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.fr.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker3.min.css">

<script>

function jqSend() {
	overlay();
	var formul=document.getElementById('pFormDent');
	var x = CheckDate(document.getElementById("datepicker3").value);

	if (x == 1) {
		var formdata = jQuery(formul).serialize();
		$.ajaxSetup({ type: "post" });
	    jQuery('#page_content').load(formul.action, formdata);

	}
	//this.$("#page_content").load('<%=request.getContextPath()%>/prc/phaseList?process.id='+document.getElementById("id").value+'&process.phaseencours='+document.getElementById("phaseencours").value);	
}

$('.datepicker3').datepicker({
    language: "fr",
    weekStart: "1",
    format:"dd/mm/yyyy",
    todayHighlight: true

});

</script>

<span id="top"></span>


<div class="inner bg-light lter">
		<br>
        <div class="row form-horizontal">
            <div class="col-lg-12">
                  <p class="lead"><s:text name="process_page.process_charter"/></p>
                  <hr>
	  		</div>
	
		<s:form action="processSave"  id="pFormDent" name="pFormDent" method="POST">
            <div class="col-lg-12">
			<input type="hidden" id="id" name="id" value="<s:property value='process.id' />">
			<input type="hidden" name="status" value="<s:property value='process.status' />">
			<input type="hidden" name="idref" value="<s:property value='process.idref' />">
			<input type="hidden" name="dfin" value="<s:property value='process.dfin' />">
			<input type="hidden" name="dstart" value="<s:property value='process.dstart' />">
			<input type="hidden" id="phaseencours" name="phaseencours" value="<s:property value='process.phaseencours' />">
			<input type="hidden" id="couleur" name="couleur" value="9b59b6">

                     <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="repository2.Name"/></label>
                        <div class="col-lg-6">
							<select id="idprogramme"  name="idprogramme" class="form-control">
								<s:if test="programmeList.size() > 0">
									<s:iterator value="programmeList" status="programmeStatus">
										<option value="<s:property value='idref' />"
											<s:if test="idref==process.idprogramme">selected</s:if>>
											<s:property value='nom' />&nbsp;<s:property value='description' />
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

                       <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="process_page.task_edateprev"/></label>
                        <div class="col-lg-6"><input type="text" id="datepicker3" name="dfinprev" placeholder="JJ/MM/YYYY" value="<s:date name="process.dfinprev" format="dd/MM/yyyy" />" onclick="" class="form-control datepicker3"></div>
                      </div>

                     <div class="form-group" style="display:none;">
                        <label class="control-label col-lg-4"><s:text name="userprofile.directeurprocess"/></label>
                        <div class="col-lg-6">
							<select id="iddp"  name="iddp" class="form-control">
								<s:if test="dpList.size() > 0">
									<s:iterator value="dpList" status="dpStatus">
									<s:if test="nom!='elmos'">
										<option value="<s:property value='id' />"
											<s:if test="id == process.iddp">selected</s:if> >
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
											<s:if test="id == process.idcp">selected</s:if> >
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
 		</s:form>
                      <div class="form-group">
		                <label class="control-label col-lg-5"></label>
		                <div class="col-lg-1 ">
		                  <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='processRead(<s:property value='process.id' />);'>
		                </div>
		                <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary btn-flat" onclick="jqSend()">
	                      </div>
                      </div>
 	
  		</div>
</div>

<div id="foo" style="display: none"></div>

<script type="text/javascript">
	restore();
</script>

