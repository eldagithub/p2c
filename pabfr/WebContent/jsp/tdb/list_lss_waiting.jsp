<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/tdb/tdb.css" type="text/css" media="all" />
<script>
	function overRefPhase(id){
		if (id == 0){
			document.getElementById("phase_details").innerHTML="<hr><b>Délais d'attente totaux du process</b><br> Min : 2j<br> Max : 10j<br> Avg : 6j<br> Ecart-type : 5j";
		}else{
			document.getElementById("phase_details").innerHTML="<hr><b>Délaais d'attente de la phase n°"+id+"</b><br> Min : 1j<br> Max : 2j<br> Avg : 1,5<br> Ecart-type : 2";
		}
	}
	function outRefPhase(id){
		document.getElementById("phase_details").innerHTML="";
	}
</script>


<body>
<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
              <div class="col-lg-9">
                    <p class="lead"><s:text name="dashboard_page.label.sigma_kpis"/></p>
                    <p class="text-muted"><s:text name="dashboard_page.label.waiting"/></p>
			  </div>
	          <div class="col-lg-3">
	          	<a href="#" class="btn btn-metis-5 btn-flat btn-margin bg-990000" onclick='$("#page_content").load("<%=request.getContextPath()%>/jsp/tdb/list_lss_leadtime.jsp");'><s:text name="dashboard_page.label.leadtime"/></a>&nbsp;<a href="#" class="btn btn-metis-5 btn-flat btn-margin bg-1A616F"  onclick='$("#page_content").load("<%=request.getContextPath()%>/jsp/tdb/list_lss_reworking.jsp");'><s:text name="dashboard_page.label.reworking"/></a>&nbsp;&nbsp;<a href="#" class="btn btn-metis-5 btn-flat btn-margin bg-707070"  onclick='$("#page_content").load("<%=request.getContextPath()%>/jsp/tdb/list_lss_waiting.jsp");'><s:text name="dashboard_page.label.waiting"/></a>&nbsp;
	          </div>
 				<br>
			<div class="col-lg-12">
				<hr>
			</div>
		 </div>


		<s:iterator status="item" begin="1" end="1">
		<div class="row form-horizontal podium_picture">
            <div class="col-lg-12" id="podium_picture<s:property value="#item.count" />">
            	<script>
            		this.$("#podium_picture<s:property value="#item.count" />").load('<%=request.getContextPath()%>/ref/listRefPhase2?refProcess.idref='+<s:property value='#session.DFAULTREFPROCESS' />);
            	</script>
            </div>
		</div>
		<div class="row form-horizontal col-lg-12 hidden-xs" id="podium_details<s:property value="#item.count" />">
            <div class="col-lg-4"></div>
            <div class="col-lg-4" id="phase_details">
            </div>
		</div>
		</s:iterator>









<br><br><br>

<br>
</div>
</body>

<script type="text/javascript">
	restore();
	document.getElementById("phase_details").innerHTML="<hr><b>Délais d'attente totaux du process</b><br> Min : 2j<br> Max : 10j<br> Avg : 6j<br> Ecart-type : 5j";
</script>



