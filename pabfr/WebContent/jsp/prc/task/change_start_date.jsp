<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.fr.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker3.min.css">
  
  
<script>
function validateForm(){
	var x=CheckDate(document.getElementById("taskforms_dstartprev").value);
	var dateheure = document.getElementById("taskforms_dstartprev").value+" "+  document.getElementById("taskforms_heuredstartprev").options[taskforms_heuredstartprev.selectedIndex].value +":"+  document.getElementById("taskforms_mindstartprev").options[taskforms_mindstartprev.selectedIndex].value+ ":00";
	//dateheure.setHours(9);
	if (x==1){
		$("#taskforms").load('<%=request.getContextPath()%>/prc/taskUpdate?id=' + document.getElementById("taskforms_id").value
				+ '&idphase=' + document.getElementById("taskforms_idphase").value
				+ '&dstartprev=' + escape(dateheure)
		);
		//alert(dateheure);
		document.getElementById("phaseList").style.display="block";	 	
		document.getElementById("tacheList").style.display="block";
		document.getElementById("taskforms").innerHTML="";
		document.getElementById("gedList").style.display="block";
	}
}

$('.taskforms_dstartprev').datepicker({
    language: "fr",
    weekStart: "1",
    format:"dd/mm/yyyy",
    todayHighlight: true
});
    
</script>
	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br><p class="lead"><s:text name="process_page.task.change_start_date_title"/></p>
			<hr>
		</div>

		<s:form name="pForm" action="#">
			<input type="hidden" id="taskforms_id" name="id" value="<%= request.getParameter("id") %>">
			<input type="hidden" id="taskforms_idphase" name="idphase" value="<%= request.getParameter("idphase") %>">

		  	<div class="col-lg-12">
	            <div class="form-group">
	                        <label class="control-label col-lg-2"><s:text name="label.date"/></label>
	                        <div class="col-lg-3">
	                        	<input id="taskforms_dstartprev" name="taskforms_dstartprev" type="text" class="form-control taskforms_dstartprev"  placeholder="JJ/MM/YYYY">
	                        </div>
	                        <label class="control-label col-lg-1"><s:text name="label.heure"/></label>
	                        <div class="col-lg-1">
	                        	<select id="taskforms_heuredstartprev" name="taskforms_heuredstartprev"  class="form-control">
	                        		<option value="00">00</option>
	                        		<option value="01">01</option>
	                        		<option value="02">02</option>
	                        		<option value="03">03</option>
	                        		<option value="04">04</option>
	                        		<option value="05">05</option>
	                        		<option value="06">06</option>
	                        		<option value="07">07</option>
	                        		<option value="08">08</option>
	                        		<option value="09" selected>09</option>
	                        		<option value="10">10</option>
	                        		<option value="11">11</option>
	                        		<option value="12">12</option>
	                        		<option value="13">13</option>
	                        		<option value="14">14</option>
	                        		<option value="15">15</option>
	                        		<option value="16">16</option>
	                        		<option value="17">17</option>
	                        		<option value="18">18</option>
	                        		<option value="19">19</option>
	                        		<option value="20">20</option>
	                        		<option value="21">21</option>
	                        		<option value="22">22</option>
	                        		<option value="23">23</option>
	                        	</select>
	                        </div>
	                        <div class="col-lg-1">
	                        	<select id="taskforms_mindstartprev" name="taskforms_mindstartprev" class="form-control" >
	                        		<option value="00">00</option>
	                        		<option value="15">15</option>
	                        		<option value="30">30</option>
	                        		<option value="45">45</option>
	                        	</select>
	                        </div>
	             </div>
	       </div>		
		</s:form>
		
    	<div class="col-lg-12">
            <div class="form-group">
<br><br>                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick="javascript:rollback();">
	                      </div>
	                      <div class="col-lg-1 ">
                         &nbsp;<input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick="validateForm();">
                       </div>
             </div>
		</div>
		<br><br><br><br><br><br><br><br><br>	
</div>
<script>
	document.location.href="#top";
</script>