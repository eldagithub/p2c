<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.fr.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker3.min.css">

<script>
	function jqSend() {
		overlay();
		var formul=document.getElementById('pFormDent');
		var x = CheckDate(document.getElementById("datepicker2").value);

		if (x == 1) {
			var formdata = jQuery(formul).serialize();
			$.ajaxSetup({ type: "post" });
		    jQuery('#page_content').load(formul.action, formdata);

		}
		
	}
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


	$('.datepicker2').datepicker({
	    language: "fr",
	    weekStart: "1",
	    format:"dd/mm/yyyy",
	    todayHighlight: true
	});
	    

</script>

<div class="inner bg-light lter">
		<br>
        <div class="row form-horizontal">
            <div class="col-lg-12">
                  <p class="lead"><s:text name="process_page.button.new_process"/></p>
                  <hr>
	  		</div>
	
		<s:form action="processCreate"  id="pFormDent" name="pFormDent" >
            <div class="col-lg-12">
			<input type="hidden" id="idref"  name="idref" value="1">
			<input type="hidden" id="status" name="status" value="in_progress">
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
                        <div class="col-lg-6"><input type="text" id="datepicker2" name="dfinprev" placeholder="JJ/MM/YYYY" value="" onclick="" class="form-control datepicker2"></div>
                      </div>

                     <div class="form-group" style="display:none;">
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


 		</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='goTo("<%=request.getContextPath()%>/prc/changeRefprocess?default_refprocess=<s:property value='#session.DFAULTREFPROCESS' />");'>
	                      </div>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick="jqSend()">
	                      </div>
                      </div>
 	
  		</div>
</div>


<script type="text/javascript">
	restore();
	document.getElementById("datepicker2").value=today_date();
</script>
