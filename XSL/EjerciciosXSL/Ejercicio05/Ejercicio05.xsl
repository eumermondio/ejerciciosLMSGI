<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/factura">
<html>
    <head>
        <title>Biblioteca</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <td>
                    <h1>Datos de cliente</h1>
                    <p>N_Fac: <xsl:value-of select="@n_fac"/></p>
                </td>
                <td>
                    <h1>Datos de empresa</h1>
                </td>
            </tr>
        </table>
    </body>
</html>
    </xsl:template>
    
</xsl:stylesheet>