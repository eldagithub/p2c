<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.fr.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-datepicker3.min.css">

<script>
	function validateForm(){
		var y=NonVide(document.forms['pForm3'].description.value);
		var x=NonVide(document.forms['pForm3'].dendprev.value);
		var z=CheckDate(document.forms['pForm3'].dendprev.value);
		
		if(z==1){
			if (x && y){
					goTo('<%=request.getContextPath()%>/jsp/completed.jsp');
					$("#todo").load('<%=request.getContextPath()%>/todo/add?idobj=' + document.forms["pForm3"]["idobj"].value + '&dendprev=' + document.forms["pForm3"]["dendprev"].value + '&description=' + escape(document.forms["pForm3"]["description"].value) );
			}else{
				alert('<s:text name="label.unvalidated_form"/>');
			}
		}
	}
	function NonVide(c){
		if (c==''){return false;}else{return true;}
	}
</script>
<div class="inner bg-light lter">
<br>

          <div class="row form-horizontal">
              <div class="col-lg-12">
                    <p class="lead"><s:text name="todo_page.new_note"/></p>
					<hr>
<s:form name="pForm3" action="#">
					
                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="todo_page.process_selected"/></label>
                        <div class="col-lg-8">
                          <select class="form-control"
								name="idobj" onchange="javascript: todoListObj();">
									<s:if test="processList.size() > 0">
										<s:iterator value="processList" status="processStatus">
											<option value="<s:property value='id' />" >N°<s:property value='id' /> - <s:property
													value="programme" /> |
												<s:property value="gare" />
											</option>
										</s:iterator>
									</s:if>
				
							</select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-lg-4"><s:text name="todo_page.deadline"/> * </label>
                        <div class="col-lg-8"><input type="text" id="datepicker" name="dendprev" placeholder="JJ/MM/YYYY" class="form-control datepicker"></div>
                      </div>
                      
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4"><s:text name="todo_page.message"/></label>
                        <div class="col-lg-8">
                          <textarea id="text4" class="form-control" name="description" ></textarea>
                        </div>
                      </div><!-- /.form-group -->
                      <div class="form-group">
                        <label for="text4" class="control-label col-lg-4"></label>
                        <div class="col-lg-8">
                          <p class=" col-lg-4 text-muted"><s:text name="label.required_field"/></p>
                        </div>
                      </div><!-- /.form-group -->
</s:form>
                      <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                        <input type="button" value="<s:text name="button.label.back"/>" class="btn btn-metis-5 btn-flat"  onclick='goTo("<%=request.getContextPath()%>/prc/changeRefprocess?default_refprocess=<s:property value='#session.DFAULTREFPROCESS' />");'>
	                      </div>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary"  onclick="javascript:validateForm();">
	                      </div>
                      </div>
              </div><!-- /.col-lg-12 -->
		</div>

<br>
</div>	


 

 
<script type="text/javascript">

restore();

$('.datepicker').datepicker({
    language: "fr",
    weekStart: "1",
    format:"dd/mm/yyyy", 
    orientation: "bottom left"
});
 
</script>
 