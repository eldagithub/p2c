<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
function validateForm(){
	var x=CheckDate(document.getElementById("dfinprev").value);
	if (x==1){
		$("#taskforms").load('<%=request.getContextPath()%>/prc/taskUpdate?id=' + document.getElementById("taskforms_id").value
				+ '&idphase=' + document.getElementById("taskforms_idphase").value
				+ '&dfinprev=' + document.getElementById("dfinprev").value
		);
		document.getElementById("phaseList").style.display="block";	 	
		document.getElementById("tacheList").style.display="block";
		document.getElementById("taskforms").innerHTML="";
		document.getElementById("gedList").style.display="block";
	}
}

$( "#dfinprev" ).click(function() {
	   $( "#dfinprev" ).datepicker(
	    		{
	    			  firstDay: 1,
	    			  dateFormat: "dd/mm/yy",
	    			  monthNames: [ <s:text name="label.month_names"/> ],
	    			  dayNamesMin: [ <s:text name="label.week_names"/> ]
	    		}
	    );
	$( "#dfinprev" ).datepicker("show");
});
</script>



	<div class="row form-horizontal">
    	<div class="col-lg-12">
	        	<br><p class="lead"><s:text name="process_page.task.change_end_date_title"/></p>
			<hr>
		</div>

		<s:form name="pForm" action="#">
			<input type="hidden" id="taskforms_id" name="id" value="<%= request.getParameter("id") %>">
			<input type="hidden" id="taskforms_idphase" name="idphase" value="<%= request.getParameter("idphase") %>">

		  	<div class="col-lg-12">
	            <div class="form-group">
	                        <label class="control-label col-lg-2"><s:text name="label.date"/></label>
	                        <div class="col-lg-8">
	                        	<input id="dfinprev" name="dfinprev" type="text" id="text1" class="form-control"  placeholder="JJ/MM/YYYY">
	                        </div>
	             </div>
	       </div>		
		</s:form>
		<br><br>
    	<div class="col-lg-12">
            <div class="form-group">
                       <label class="control-label col-lg-5"></label>
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
