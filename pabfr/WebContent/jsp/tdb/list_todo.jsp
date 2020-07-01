<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
              <div class="col-lg-12">
                    <p class="lead">Tableau de bord</p>
                    <p class="text-muted"><i class="fa fa-list fa-2x" style="vertical-align:middle;"></i>&nbsp;&nbsp;&nbsp;Ma TODO du jour</p>
			  </div>
 				<br>
			<div class="col-lg-12">
				<hr>
			</div>
		 </div>

          <!-- row -->
          <div class="row">
            <div class="col-md-12">
              <!-- The time line -->
              <ul class="timeline" id="list_todo_late">
              </ul>
              <ul class="timeline" id="list_todo_today">
              </ul>
            </div><!-- /.col -->
          </div><!-- /.row -->
</div>

<script type="text/javascript">
	restore();
	this.$("#list_todo_late").load("<%=request.getContextPath()%>/tdb/lateTodoTsk");
	this.$("#list_todo_today").load("<%=request.getContextPath()%>/tdb/todayTodoTsk");
</script>
