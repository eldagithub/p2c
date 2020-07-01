<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="inner bg-light lter">
<br>
          <div class="row form-horizontal">
          	<div class="col-lg-12">
                    <p class="lead"><s:text name="admin_page.admin_account.components.title"/></p>
 				<br>
				<hr>
			</div>
		 </div>
		          <div class="row">
				            <div class="col-md-4 col-sm-6 col-xs-12">
					            <div class="info-box bg-303030 box_clickable" title="<s:text name="admin_page.admin_account.title"/>" onclick='javascript:goTo("<%=request.getContextPath()%>/jsp/adm/admin_account.jsp");'>
					                <span class="info-box-icon"><i class="fa fa-puzzle-piece"></i></span>
					                <div class="info-box-content box_wrapable">
					                  <span class="info-box-number"><s:text name="admin_page.admin_account.title"/></span>
					                  <span class="info-box-text"><s:text name="admin_page.admin_account.subtitle"/></span>
					                </div><!-- /.info-box-content box_wrapable -->
				              	</div><!-- /.info-box -->
				            </div><!-- /.col -->								
				            <div class="col-md-4 col-sm-6 col-xs-12">
					            <div class="info-box bg-303030 box_clickable" title="<s:text name="admin_page.admin_account.acte_etapes_mngt.title"/>" onclick='javascript:goTo("<%=request.getContextPath()%>/ref/listRefEtape");'>
					                <span class="info-box-icon"><i class="fa fa-puzzle-piece"></i></span>
					                <div class="info-box-content box_wrapable">
					                  <span class="info-box-number"><s:text name="admin_page.admin_account.acte_etapes_mngt.title"/></span>
					                  <span class="info-box-text"><s:text name="admin_page.admin_account.acte_etapes_mngt.subtitle"/></span>
					                </div><!-- /.info-box-content box_wrapable -->
				              	</div><!-- /.info-box -->
				            </div><!-- /.col -->	
<s:if test="#session.UserSessionKey.name == 'elmos'">							
				            <div class="col-md-4 col-sm-6 col-xs-12">
					            <div class="info-box bg-303030 box_clickable" title="<s:text name="admin_page.admin_account.metaprocess_mngt.title"/>" onclick='javascript:goTo("<%=request.getContextPath()%>/ref/listRefProcess");'>
					                <span class="info-box-icon"><i class="fa fa-puzzle-piece"></i></span>
					                <div class="info-box-content box_wrapable">
					                  <span class="info-box-number"><s:text name="admin_page.admin_account.metaprocess_mngt.title"/></span>
					                  <span class="info-box-text"><s:text name="admin_page.admin_account.metaprocess_mngt.subtitle"/></span>
					                </div><!-- /.info-box-content box_wrapable -->
				              	</div><!-- /.info-box -->
				            </div><!-- /.col -->
</s:if>								
				            <!-- 
				            <div class="col-md-4 col-sm-6 col-xs-12">
					            <div class="info-box bg-303030 box_clickable" title="<s:text name="admin_page.admin_account.profiles_mngt.title"/>"  onclick='javascript:goTo("<%=request.getContextPath()%>/jsp/adm/profiles_mngt.jsp");'>
					                <span class="info-box-icon"><i class="fa fa-puzzle-piece"></i></span>
					                <div class="info-box-content box_wrapable">
					                  <span class="info-box-number"><s:text name="admin_page.admin_account.profiles_mngt.title"/></span>
					                  <span class="info-box-text"><s:text name="admin_page.admin_account.profiles_mngt.subtitle"/></span>
					                </div>
				              	</div>
				            </div>								
				            <div class="col-md-4 col-sm-6 col-xs-12">
					            <div class="info-box bg-707070" title="<s:text name="admin_page.admin_account.contract_mngt.title"/>">
					                <span class="info-box-icon"><i class="fa fa-puzzle-piece"></i></span>
					                <div class="info-box-content box_wrapable">
					                  <span class="info-box-number"><s:text name="admin_page.admin_account.contract_mngt.title"/></span>
					                  <span class="info-box-text"><s:text name="admin_page.admin_account.contract_mngt.subtitle"/></span>
					                </div>
				              	</div>
				            </div>								
				            <div class="col-md-4 col-sm-6 col-xs-12">
					            <div class="info-box bg-707070" title="<s:text name="admin_page.admin_account.api.title"/>" onclick='javascript:goTo("<%=request.getContextPath()%>/jsp/adm/api_mngt.jsp");'>
					                <span class="info-box-icon"><i class="fa fa-puzzle-piece"></i></span>
					                <div class="info-box-content box_wrapable">
					                  <span class="info-box-number"><s:text name="admin_page.admin_account.api.title"/></span>
					                  <span>
				              	</div>
				            </div>	
				            -->							
					</div>
</div>	

<script type="text/javascript">
	restore();
</script>
