<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>

<body>
	The file was uploaded successfully! =
	<s:property value="fileFileName"/>
	
	
	
	<h3>Struts 2 file download example</h3>
  <s:url id="fileDownload" namespace="/ged" action="download?ged.id=%{ged.id}"></s:url>
   <h4>
     Download file - <s:a href="%{fileDownload}">MyFile.xls</s:a>
   </h4>
	
</body>

</html>