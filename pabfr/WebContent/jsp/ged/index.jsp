<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

  
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<body>

Please select the file you want to upload:

 <s:form action="/ged/upload" method="post" enctype="multipart/form-data" theme="simple">  
  <s:actionerror cssClass="errorMessage"/>
  <s:fielderror cssClass="error"/>
      <s:file name="file" label="File"/>
     <s:submit/>   
 </s:form>

</body>
</html>