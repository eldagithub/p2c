<%@ page contentType="text/html;charset=ISO-8859-1" language="java" isErrorPage="true"%>
<html>
<head>
<title>Error Page</title>
<style>


a {text-decoration: none; font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #3A76B1}

a:hover {color: #FFBB35; text-decoration: none}

.body {  background-color: #FFFFFF}

.titre {  font-family: Arial, Helvetica, sans-serif; font-size: 14pt; font-weight: bold; color: #0066CC; background-color: #CFE0FE}
.titrefoot {  font-family: Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold; color: #000000; background-color: #CFE0FE}

.ctt { font-family: Arial, Helvetica, sans-serif; font-size: 10pt; color: #333399; background-color: #E6E6FF }

.ct {  font-family: Arial, Helvetica, sans-serif; font-size: 10pt; color: #000000}
.ct1 {  font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: #333399; background-color: #CFE0FE}
</style>

</head>
<body>
<br><br><br>

<TABLE width="70%" align="center">
    <TBODY>
        <TR>
            <TD class="titre" align="center">Erreur</TD>
        </TR>
    </TBODY>
</TABLE>

<TABLE width="70%" cellspacing="2" align="center">
    <TBODY>
        <TR class="ctt">
            <TD width="10%" nowrap  class="ct1">Message</TD>
            <TD width="90%" class="ctt"><%= exception.toString() %></TD>
        </TR>
        <TR class="ctt">
            <TD width="10%" nowrap  class="ct1">servlet Name</TD>
            <TD width="90%" class="ctt"><%= exception.getClass() %></TD>
        </TR>
        <TR class="ctt">
            <TD width="10%" nowrap class="ct1">Stack trace</TD>
            <TD width="90%" class="ctt"><%= exception.getCause() %></TD>
        </TR>
    </TBODY>
</TABLE>
<TABLE width="70%" align="center">
    <TBODY>
        <TR>
            <TD class="titrefoot" align="center">Merci de prendre contact avec votre administrateur</TD>
        </TR>
    </TBODY>
</TABLE>
<br><br><br>

<div align="center">
<p><a href="<%=request.getContextPath()%>/">retour &agrave; l'application</a></p>
</div>

<script type="text/javascript">
	restore();
</script>





</body>
</html>
