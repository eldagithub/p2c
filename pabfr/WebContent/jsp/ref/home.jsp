<%@ taglib prefix="s" uri="/struts-tags"%>
<span id="top"></span>
<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
              <div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.title"/></p>
                    <p class="text-muted"><s:text name="admin_page.subtitle"/></p>
				<hr>
			</div>
		 </div>


          <div class="row">
	      <s:if test="#session.UserSessionKey.profile == 'full'">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box bg-303030 box_clickable" onclick='javascript:goTo("<%=request.getContextPath()%>/adm/listU");'>
                <span class="info-box-icon"><i class="fa fa-database"></i></span>
                <div class="info-box-content">
                  <span class="info-box-number"><s:text name="admin_page.subtitle.active_directory"/></span>
                  <span class="info-box-text">Comptes Utilisateurs</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          </s:if>
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box bg-303030 box_clickable" onclick='javascript:goTo("<%=request.getContextPath()%>/ref/listProgram?objet.categorie=PROGRAMME");'>
                <span class="info-box-icon"><i class="fa fa-database"></i></span>
                <div class="info-box-content">
                  <span class="info-box-number">Annuaire</span>
                  <span class="info-box-text"><s:text name="repository2.Name"/>S</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box bg-303030 box_clickable" onclick='javascript:goTo("<%=request.getContextPath()%>/ref/listGare?objet.categorie=GARE");'>
                <span class="info-box-icon"><i class="fa fa-database"></i></span>
                <div class="info-box-content">
                  <span class="info-box-number">Liste des</span>
                  <span class="info-box-text"><s:text name="repository1.Name"/>S</span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

		</div>


<br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>	

<script type="text/javascript">
	restore();
	document.location.href="#top";
</script>