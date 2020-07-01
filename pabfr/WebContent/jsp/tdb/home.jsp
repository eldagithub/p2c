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
function    todoNew(what){
	if (what == "ct_late") this.$("#calendar").load("<%=request.getContextPath()%>/tdb/lateTsk");
	else if (what == "ct_today") this.$("#calendar").load("<%=request.getContextPath()%>/tdb/todayTsk");
	else if (what == "ct_future") this.$("#calendar").load("<%=request.getContextPath()%>/tdb/futureTsk");
	else if (what == "top3_longest") this.$("#calendar").load("<%=request.getContextPath()%>/jsp/tdb/list_top3_longest.jsp");
	else if (what == "top3_fastest") this.$("#calendar").load("<%=request.getContextPath()%>/jsp/tdb/list_top3_fastest.jsp");
	else if (what == "lss_leadtime") this.$("#calendar").load("<%=request.getContextPath()%>/jsp/tdb/list_lss_leadtime.jsp");
	else if (what == "lss_reworking") this.$("#calendar").load("<%=request.getContextPath()%>/jsp/tdb/list_lss_reworking.jsp");
	else if (what == "lss_waiting") this.$("#calendar").load("<%=request.getContextPath()%>/jsp/tdb/list_lss_waiting.jsp");
}
function loadSubtitle(what){
	document.getElementById("dahsboard_subtitle").innerHTML = what;
}
</script>


<body>
<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
              <div class="col-lg-7">
                    <p class="lead"><s:text name="dashboard_page.calendar.title"/></p>
                    <p class="text-muted"><span id="dahsboard_subtitle"></span></p>
			  </div>
	          <div class="col-lg-5">
	          	<a href="#" class="btn btn-metis-5 btn-flat btn-margin bg-990000" onclick="javascript:todoNew('ct_late');"><s:text name="dashboard_page.tasks.late"/></a>&nbsp;<a href="#" class="btn btn-metis-5 btn-flat btn-margin bg-1A616F"  onclick="javascript:todoNew('ct_today');"><s:text name="dashboard_page.tasks.in_progress"/></a>&nbsp;<a href="#" class="btn btn-metis-5 btn-flat btn-margin bg-707070"  onclick="javascript:todoNew('ct_future');"><s:text name="dashboard_page.tasks.to_be_started"/></a>&nbsp;
	          </div>
 				<br>
			<div class="col-lg-12">
				<hr>
			</div>
		 </div>



    <div id="calendar"></div>
    
<script type="text/javascript">
	this.$("#calendar").load("<%=request.getContextPath()%>/tdb/todayTsk");
</script>

<br>
</div>
</body>

<script type="text/javascript">
	restore();
</script>

