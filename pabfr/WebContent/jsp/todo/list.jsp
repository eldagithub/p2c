<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script>
	function todoListObj () {
	this.$("#todo").load('<%=request.getContextPath()%>/todo/list?idobj=' + document.forms["pForm2"]["idobj"].value);
	}
	
	function todoUpdate (id, type) {
		this.$("#todo").load('<%=request.getContextPath()%>/todo/update?todo.id=' + id +'&todo.typeobj=' + type + '&todo.status=completed' );
	}
</script>
 	<div id="todo">

        <div class="well well-small">
          <button class="btn btn-metis-5 btn-block" onclick='filAriane("<s:text name="todo_page.title"/>");javascript:goTo("<%=request.getContextPath()%>/todo/toAdd");'> <s:text name="button.label.new"/></button>
        </div>
	    
	    <div class="well well-small">        
			<s:if test="todoMap.size() > 0">
					<s:iterator value="todoMap" var="lbl" status="cnt">
						<s:if test="#lbl.key == 'En retard'">
					        <button class="btn btn-inverse btn-block"><s:text name="todo_page.late"/></button>
							<s:iterator value="value">
						        <div class="alert alert-danger">
						          <button type="button" class="close" data-dismiss="alert" onclick="javascript:todoUpdate(<s:property value='id' />, 'Delete') ;">&times;</button>
						          <button type="button" class="close" data-dismiss="alert"onclick="javascript:todoUpdate(<s:property value='id' />, 'Status') ;" style="font-size:16px;padding-top:2px;">&#10003;</button>
						          <strong><s:property value='typeobj' /></strong>  <span class="inlinesparkline pull-right"><s:date name="dendprev" format="dd/MM/yyyy" /></span> <br>
						          <s:property value='description' />
						        </div>
							</s:iterator>			
						</s:if>
					</s:iterator>
			</s:if>
	        
			<s:if test="todoMap.size() > 0">
					<s:iterator value="todoMap" var="lbl">
						<s:if test="#lbl.key == 'Dans 1 semaine'">
					        <button class="btn btn-inverse btn-block"><s:text name="todo_page.in_progress"/></button>
							<s:iterator value="value">
						        <div class="alert alert-success">
						          <button type="button" class="close" data-dismiss="alert" onclick="javascript:todoUpdate(<s:property value='id' />, 'Delete') ;">&times;</button>
						          <button type="button" class="close" data-dismiss="alert"onclick="javascript:todoUpdate(<s:property value='id' />, 'Status') ;" style="font-size:16px;padding-top:2px;">&#10003;</button>
						          <strong><s:property value='typeobj' /></strong>  <span class="inlinesparkline pull-right"><s:date name="dendprev" format="dd/MM/yyyy" /></span> <br>
						          <s:property value='description' />
						        </div>
							</s:iterator>			
						</s:if>
					</s:iterator>
			</s:if>
	        
			<s:if test="todoMap.size() > 0">
					<s:iterator value="todoMap" var="lbl">
						<s:if test="#lbl.key == 'Dans +1 semaine'">
					        <button class="btn btn-inverse btn-block"><s:text name="todo_page.coming_soon"/></button>
							<s:iterator value="value">
						        <div class="alert alert-success2">
						          <button type="button" class="close" data-dismiss="alert" onclick="javascript:todoUpdate(<s:property value='id' />, 'Delete') ;">&times;</button>
						          <button type="button" class="close" data-dismiss="alert"onclick="javascript:todoUpdate(<s:property value='id' />, 'Status') ;" style="font-size:16px;padding-top:2px;">&#10003;</button>
						          <strong><s:property value='typeobj' /></strong>  <span class="inlinesparkline pull-right"><s:date name="dendprev" format="dd/MM/yyyy" /></span> <br>
						          <s:property value='description' />
						        </div>
							</s:iterator>			
						</s:if>
					</s:iterator>
			</s:if>
	        
			<s:if test="todoMap.size() > 0">
					<s:iterator value="todoMap" var="lbl">
						<s:if test="#lbl.key == 'Terminé'">
					        <button class="btn btn-inverse btn-block"><s:text name="todo_page.completed"/></button>
							<s:iterator value="value">
						        <div class="alert alert-completed">
						          <button type="button" class="close" data-dismiss="alert" onclick="javascript:todoUpdate(<s:property value='id' />, 'Delete') ;">&times;</button>
						          <strong><s:property value='typeobj' /></strong>  <span class="inlinesparkline pull-right"><s:date name="dendprev" format="dd/MM/yyyy" /></span> <br>
						          <s:property value='description' />
						        </div>
							</s:iterator>			
						</s:if>
					</s:iterator>
			</s:if>

		</div>
	</div>

<script type="text/javascript">
	restore();
</script>
	
	