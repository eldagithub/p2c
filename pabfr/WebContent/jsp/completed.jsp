<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="inner bg-light lter">

        <div class="row">
              <div class="col-lg-12">
                    <p class="lead"><br><s:text name="completed_page.message"/></p>
              </div><!-- /.col-lg-12 -->
                      <div class="form-group">
                       <label class="control-label col-lg-6"></label>
	                      <div class="col-lg-1 ">
	                        <input type="submit" value="<s:text name="button.label.back"/>" class="btn btn-primary"  onclick='location.href="<%=request.getContextPath()%>/";'>
	                      </div>
                      </div>
		</div>
	    <br>&nbsp;
			
</div>              