<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"  %>

<br>
<div class="col-lg-12">
	<div class="col-lg-3"></div>
		<s:iterator begin="0" end="7" status="numDent">
	 <% String s = request.getParameter("secteur"); %>
	    <% if (s.equals("1")) { %> 
			<div class="col-lg-1 btn btn-metis-5 btn-flat" style="margin:1px;background-color:#ccc;color:#5E5E5E;"><s:property value="%{#numDent.count+10}"/></div>
	   <% } else if (s.equals("2")) { %>
			<div class="col-lg-1 btn btn-metis-5 btn-flat" style="margin:1px;background-color:#ccc;color:#5E5E5E;"><s:property value="%{#numDent.count+20}"/></div>
	   <% } else if (s.equals("3")) { %>
			<div class="col-lg-1 btn btn-metis-5 btn-flat" style="margin:1px;background-color:#ccc;color:#5E5E5E;"><s:property value="%{#numDent.count+30}"/></div>
	   <% } else { %>
			<div class="col-lg-1 btn btn-metis-5 btn-flat" style="margin:1px;background-color:#ccc;color:#5E5E5E;"><s:property value="%{#numDent.count+40}"/></div>
	   <% } %>
		</s:iterator>
	<div class="col-lg-1"></div>
</div>
<div class="col-lg-12">
	<s:iterator value="actesunitList" status="numActe">
		<div class="col-lg-3" >
			<input class="form-control btn btn-metis-5 btn-flat"  style="text-align:left;margin:1px;background-color:#444;color:#fff;" type="button" value="<s:property value='acte' />">
		</div>
	 <% String s = request.getParameter("secteur"); %>
	    <% if (s.equals("1")) { %> 
		<s:iterator begin="0" end="7" status="numDent">
	    	<div class="col-lg-1  btn  text-center" style="margin:1px;;">
				<input title="Acte : <s:property value="acte"/> - Dent n°<s:property value="%{#numDent.count+10}"/>" onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#numDent.count+10}"/>, <s:property value="idacte"/>);" 
					type="checkbox" id="dent<s:property value="%{#numDent.count+10}"/>-<s:property value="idacte"/>">
			</div>
		</s:iterator>
	   <% } else if (s.equals("2")) { %>
		<s:iterator begin="0" end="7" status="numDent">
	    	<div class="col-lg-1  btn  text-center" style="margin:1px;;">
				<input title="Acte : <s:property value="acte"/> - Dent n°<s:property value="%{#numDent.count+20}"/>" onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#numDent.count+20}"/>, <s:property value="idacte"/>);" 
					type="checkbox" id="dent<s:property value="%{#numDent.count+20}"/>-<s:property value="idacte"/>">
			</div>
		</s:iterator>
	   <% } else if (s.equals("3")) { %>
		<s:iterator begin="0" end="7" status="numDent">
	    	<div class="col-lg-1  btn  text-center" style="margin:1px;;">
				<input title="Acte : <s:property value="acte"/> - Dent n°<s:property value="%{#numDent.count+30}"/>" onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#numDent.count+30}"/>, <s:property value="idacte"/>);" 
					type="checkbox" id="dent<s:property value="%{#numDent.count+30}"/>-<s:property value="idacte"/>">
			</div>
		</s:iterator>
	   <% } else { %>
		<s:iterator begin="0" end="7" status="numDent">
	    	<div class="col-lg-1  btn  text-center" style="margin:1px;;">
				<input title="Acte : <s:property value="acte"/> - Dent n°<s:property value="%{#numDent.count+40}"/>" onclick="javascript:dentDent(this, <s:property value='phase.id' />, <s:property value="%{#numDent.count+40}"/>, <s:property value="idacte"/>);" 
					type="checkbox" id="dent<s:property value="%{#numDent.count+40}"/>-<s:property value="idacte"/>">
			</div>
		</s:iterator>
	   <% } %>
	</s:iterator>
</div>

<script type="text/javascript">
	document.location.href="#top";
	restore();
	 <% String s = request.getParameter("secteur"); %>
	    <% if (s.equals("1")) { %> 
		<s:iterator value="etapeList" status="status10">
			<s:if test="dent <= 18">
				dentChecked(<s:property value='dent' />, <s:property value='idacte' />);
			</s:if>
		</s:iterator>
	   <% } else if (s.equals("2")) { %>
		<s:iterator value="etapeList" status="status10">
			<s:if test="dent >= 21 && dent <= 28">
				dentChecked(<s:property value='dent' />, <s:property value='idacte' />);
			</s:if>
		</s:iterator>
	   <% } else if (s.equals("3")) { %>
		<s:iterator value="etapeList" status="status10">
			<s:if test="dent >= 31 && dent <= 38">
				dentChecked(<s:property value='dent' />, <s:property value='idacte' />);
			</s:if>
		</s:iterator>
	   <% } else { %>
		<s:iterator value="etapeList" status="status10">
			<s:if test="dent >= 41 && dent <= 48">
				dentChecked(<s:property value='dent' />, <s:property value='idacte' />);
			</s:if>
		</s:iterator>
	   <% } %>
	restore();
</script>
