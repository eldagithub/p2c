<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
</script>
<style>
	.big_letter{
		font-weight:bold;
		font-size:22px;
	}
</style>

<s:if test="processList.size() > 0">

 <table class="table responsive-table" style="margin-left:40px;width:1050px;">
   <thead>
     <tr>
       <td style="width:100px"><b>N°</b></td>
       <td style="width:200px"><b>Patient</b></td>
       <td style="width:50px"><b>Spécialité</b></td>
       <td style="width:50px"><b>Date fin TTT</b></td>
       <td style="width:50px"><b>Phase en cours</b></td>
       <td class="hidden-xs" style="width:50px"></td>
     </tr>
   </thead>
   <tbody>

	<s:iterator value="processList" status="processStatus">
		<tr>
			<td><s:property value="id" /></td>		
			<td><s:property value="programme" /></td>		
			<td><s:property value="gare" /></td>		
			<td><s:date name="dfinprev" format="dd/MM/yyyy"/></td>		
			<td><s:property value="phaseencours" /></td>		
			<td></td>		
		</tr>
	</s:iterator>

   </tbody>
 </table>
</s:if>







<s:else>
          <div class="col-lg-2"></div>
  	<div class="col-lg-8">Vous n'avez pas de plans de traitement pour cette requête.</div>
</s:else>
 
 
 <script type="text/javascript">
	restore();
</script>


