<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='<%=request.getContextPath()%>/css/fullcalendar.css' />
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src='<%=request.getContextPath()%>/js/moment.js'></script>
<script src='<%=request.getContextPath()%>/js/fullcalendar.js'></script>
<script src='<%=request.getContextPath()%>/js/language/calendar_fr.js'></script>
</head>



	<script type="text/javascript">


	$(document).ready(function() {

	    // page is now ready, initialize the calendar..
	    $('#calendar').fullCalendar({
	        // put your options and callbacks her
	        lang:'fr',
	        events: [

		        <s:iterator value="pptList" status="processStatus">        
			        {
			        	title: document.getElementById("todo_title_<s:property escape='false' value='%{#processStatus.count}'  />").value,
			            start: document.getElementById("todo_sdate_<s:property escape='false' value='%{#processStatus.count}'  />").value,
			            end: document.getElementById("todo_edate_<s:property escape='false' value='%{#processStatus.count}'  />").value,
			            url:'<s:property value="process.getId()" />',
	                    color: '#1A616F'
	                },
				</s:iterator>
                
		    ],
		    eventClick: function(event) {
		        if (event.url) {
		            processRead(event.url);
		            return false;
		        }
		    }
	    });
	});
</script>


<s:if test="pptList.size() > 0">
	<s:form name="postForm"  action="#"  method="post"  >
		<s:iterator value="pptList" status="processStatus">
			<input type="hidden" id="todo_title_<s:property value="%{#processStatus.count}"  />" value="N°<s:property value='process.getId()' /> - <s:property value="process.getProgramme()" /> | <s:property value='process.getGare()' /> - <s:property value="process.getPhaseencours()" /> : <s:property escape="false" value='tache.getNom()'  />" />
			<input type="hidden" id="todo_sdate_<s:property value="%{#processStatus.count}"  />" value="<s:date name="tache.getDstartprev()" format="yyyy-MM-dd" />" />
			<input type="hidden" id="todo_edate_<s:property value="%{#processStatus.count}"  />" value="<s:date name="tache.getDfinprev()" format="yyyy-MM-dd" />" />
		</s:iterator>		
	</s:form>
	<script>
		loadSubtitle("<s:text name="dashboard_page.tasks.late"/>");
	</script>
</s:if> <s:else>
	<script>
		loadSubtitle("<s:text name="dashboard_page.calendar.no_tasks"/>");
	</script>
</s:else>

<script type="text/javascript">
	restore();
</script>


