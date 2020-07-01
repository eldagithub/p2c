<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:set var="inp" value="0" />
<s:set var="inpc" value="0" />

<div class="inner bg-light lter">
		<br>
        <div class="row form-horizontal">
            <div class="col-lg-12">
                  <p class="lead"><s:text name="process_page.activate_phases"/></p>
                  <hr>
	  		</div>

            <div class="col-lg-12">
			<s:if test="phaseList.size() > 0">
				<s:iterator value="phaseList">
					<s:if test="status == 'in_progress'">
						<s:set var="inp" value="%{ordre}" />
					</s:if>
					<s:if test="status == 'completed'">
						<s:if test="ordre > #inpc "> <s:set var="inpc" value="%{ordre}" /> </s:if>
					</s:if>
				</s:iterator>
				
				<s:iterator value="phaseList" status="phaseStatus">
                      <div class="form-group">
                        <label class="control-label col-lg-5"><s:property value="nom" /></label>
                        <div class="col-lg-7">
                          <div class="checkbox">
                            <label>            
	                          <input onchange="phaseActive(<s:property value="id"/>, this);" type="checkbox" 
									<s:if test="active == 'yes'">  checked    </s:if>
									<s:if test="obligatoire == 'yes'">	   checked disabled="disabled"    </s:if>
									<s:if test="status != 'to_be_started' && status != 'in_progress_init'">	   disabled="disabled"  </s:if>
									<s:if test="ordre < #inpc "> disabled="disabled" </s:if>
									<s:if test="ordre < #inp "> disabled="disabled" </s:if>                          
	                          >
                          </label>
                          </div>
                          <br>
                        </div>
                      </div>
				</s:iterator>
			</s:if>
			</div>
	    	<div class="col-lg-12">
                      <div class="form-group">
                       <label class="control-label col-lg-5"></label>
	                      <div class="col-lg-1 ">
	                      <br>
	                        <input type="submit" value="<s:text name="button.label.validate"/>" class="btn btn-primary" onclick="processRead(<s:property value="process.id" />);">
	                      </div>
                      </div>
			</div>
		</div>
</div>
<div id="foo" style="display: none"></div>

