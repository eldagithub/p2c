<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/tdb/tdb.css" type="text/css" media="all" />
<script>
function overPodium(id){
	document.getElementById("podium_details"+id).style.display="block";
	document.getElementById("podium_details"+id).className="  row form-horizontal podium_details_in ";
}
function outPodium(id){
	document.getElementById("podium_details"+id).style.display="none";
}
function overRefPhase(id){
}
function outRefPhase(id){
}

</script>

<body>
<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
              <div class="col-lg-8">
                    <p class="lead"><s:text name="dashboard_page.label.top3_dashboard"/></p>
                    <p class="text-muted"><s:text name="dashboard_page.label.fastest_process"/></p>
			  </div>
	          <div class="col-lg-4">
	          	<a href="#" class="btn btn-metis-5 btn-flat btn-margin bg-990000" onclick='$("#page_content").load("<%=request.getContextPath()%>/jsp/tdb/list_top3_longest.jsp");'><s:text name="dashboard_page.label.longest_process"/></a>&nbsp;<a href="#" class="btn btn-metis-5 btn-flat btn-margin bg-1A616F"  onclick='$("#page_content").load("<%=request.getContextPath()%>/jsp/tdb/list_top3_fastest.jsp");'><s:text name="dashboard_page.label.fastest_process"/></a>&nbsp;
	          </div>
 				<br>
			<div class="col-lg-12">
				<hr>
			</div>
		 </div>

		<s:iterator status="item" begin="1" end="3">
		<div class="row form-horizontal podium_picture">
            <div class="col-lg-2">
				<div class="podium top1"  onmouseover="overPodium(<s:property value="#item.count" />);" onmouseout="outPodium(<s:property value="#item.count" />);"></div>
				<br><br>Process n°<s:property value="#item.count" />
			</div>
		</div>
		<div class="row form-horizontal podium_picture">
            <div class="col-lg-12" id="podium_picture<s:property value="#item.count" />">
            	<script>
            		this.$("#podium_picture<s:property value="#item.count" />").load('<%=request.getContextPath()%>/ref/listRefPhase2?refProcess.idref='+<s:property value='#session.DFAULTREFPROCESS' />);
            	</script>
            </div>
		</div>
		<div class="row form-horizontal podium_details col-lg-12 hidden-xs" id="podium_details<s:property value="#item.count" />">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
				<hr>
							Business Lines | Xxxxx<br>
							Responsable : Reporting XXxxxx - AAaaa BBbbbb<br>
							Other details : Lorem ipsum ....<br>
            </div>
		</div>
		</s:iterator>
<br>
</div>
</body>

<script type="text/javascript">
	restore();
</script>



