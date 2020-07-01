<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"  %>

<br>
<div class="col-lg-12">
	<div class="col-lg-2"></div>
	<div class="col-lg-5">
			<s:iterator begin="0" end="7" status="numDent">
				<div class="col-lg-1 btn btn-metis-5 btn-flat" style="margin:1px;background-color:#ccc;color:#5E5E5E;"><s:property value="%{#numDent.count+10}"/></div>
			</s:iterator>
	</div>
	<div class="col-lg-5">
			<s:iterator begin="0" end="7" status="numDent">
				<div class="col-lg-1 btn btn-metis-5 btn-flat" style="margin:1px;background-color:#ccc;color:#5E5E5E;"><s:property value="%{#numDent.count+20}"/></div>
			</s:iterator>
	</div>
</div>
<div class="col-lg-12">
		<s:iterator value="actesunitList" status="numActe">
			<div class="col-lg-2" >
				<input class="form-control btn btn-metis-5 btn-flat"  style="text-align:left;margin:1px;background-color:#444;color:#fff;" type="button" value="<s:property value='acte' />">
			</div>
			<div class="col-lg-5">
				<s:iterator begin="0" end="7" status="numDent">
			    	<div class="col-lg-1  btn  text-center" style="margin:1px;;">
						<input title="Acte : <s:property value="acte"/> - Dent n°<s:property value="%{#numDent.count+10}"/>" onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#numDent.count+10}"/>, <s:property value="idacte"/>);" 
							type="checkbox" id="dent<s:property value="%{#numDent.count+10}"/>-<s:property value="idacte"/>">
					</div>
				</s:iterator>
			</div>
			<div class="col-lg-5">
				<s:iterator begin="0" end="7" status="numDent">
			    	<div class="col-lg-1  btn  text-center" style="margin:1px;;">
					<input title="Acte : <s:property value="acte"/> - Dent n°<s:property value="%{#numDent.count+20}"/>" onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#numDent.count+20}"/>, <s:property value="idacte"/>);" 
						type="checkbox" id="dent<s:property value="%{#numDent.count+20}"/>-<s:property value="idacte"/>">
					</div>
				</s:iterator>
			</div>
			
			
		</s:iterator>
</div>








<div class="col-lg-12">
	<br><br><br>
</div>
<div class="col-lg-12">
	<div class="col-lg-2"></div>
	<div class="col-lg-5">
			<s:iterator begin="0" end="7" status="numDent">
				<div class="col-lg-1 btn btn-metis-5 btn-flat" style="margin:1px;background-color:#ccc;color:#5E5E5E;"><s:property value="%{#numDent.count+40}"/></div>
			</s:iterator>
	</div>
	<div class="col-lg-5">
			<s:iterator begin="0" end="7" status="numDent">
				<div class="col-lg-1 btn btn-metis-5 btn-flat" style="margin:1px;background-color:#ccc;color:#5E5E5E;"><s:property value="%{#numDent.count+30}"/></div>
			</s:iterator>
	</div>
</div>
<div class="col-lg-12">
		<s:iterator value="actesunitList" status="numActe">
			<div class="col-lg-2" >
				<input class="form-control btn btn-metis-5 btn-flat"  style="text-align:left;margin:1px;background-color:#444;color:#fff;" type="button" value="<s:property value='acte' />">
			</div>
			<div class="col-lg-5">
				<s:iterator begin="0" end="7" status="numDent">
			    	<div class="col-lg-1  btn  text-center" style="margin:1px;;">
				<input title="Acte : <s:property value="acte"/> - Dent n°<s:property value="%{#numDent.count+40}"/>" onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#numDent.count+40}"/>, <s:property value="idacte"/>);" 
					type="checkbox" id="dent<s:property value="%{#numDent.count+40}"/>-<s:property value="idacte"/>">
					</div>
				</s:iterator>
			</div>
			<div class="col-lg-5">
				<s:iterator begin="0" end="7" status="numDent">
			    	<div class="col-lg-1  btn  text-center" style="margin:1px;;">
				<input title="Acte : <s:property value="acte"/> - Dent n°<s:property value="%{#numDent.count+30}"/>" onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#numDent.count+30}"/>, <s:property value="idacte"/>);" 
					type="checkbox" id="dent<s:property value="%{#numDent.count+30}"/>-<s:property value="idacte"/>">
					</div>
				</s:iterator>
			</div>
			
			
		</s:iterator>
</div>

				
<div class="col-lg-12" style="width:100%;;margin:0px;padding:0px;margin-bottom:40px;">
<br><br><br><br>
	<s:iterator value="actesallList"  status="status1">
		<div class="col-lg-2"><input class="form-control btn btn-metis-5 btn-flat text-left"  style="margin:1px;background-color:#ccc;color:#5E5E5E;" type="button" value="<s:property value='acte' />"></div>
		<div class="col-lg-1" title="<s:property value='acte' />"><input type="checkbox" onclick="javascript:dentDent2(this,<s:property value='phase.id' />, 0, <s:property value='idacte' />);" 
		  			 id="dent0-<s:property value='idacte' />" ></div>
	</s:iterator>
</div>


<script type="text/javascript">
	document.location.href="#top";
	restore();
		<s:iterator value="etapeList" status="status10">
				dentChecked(<s:property value='dent' />, <s:property value='idacte' />);
		</s:iterator>
	restore();
</script>
