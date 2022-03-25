<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/juegoTanques">
       <xsl:call-template name="css"/>
        <html>
            <head>
                <title>Tanques</title>
            </head>
            <body>
                <table width="100%">
                    <tr>
                        <th>Jugada</th>
                        <th>Jugador</th>
                        <th>Tanque</th>
                        <th>Jugada</th>
                    </tr>
<xsl:for-each select="jugadasDescritas/jugada">
    <tr>
        <xsl:attribute name="style">background:
            <xsl:choose>
                <xsl:when test="position() mod 2 = 1"> #00FAFF;</xsl:when>
                <xsl:otherwise> #00CAFF</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <td><xsl:value-of select="position()"/></td>
        <td><xsl:value-of select="@jugador"/></td>
        <td>.</td>
        <td><xsl:value-of select="@desc"/></td>
    </tr>
</xsl:for-each>
                                        
                </table>
            </body>
        </html>
       
    </xsl:template>

    <xsl:template name="css">
        <style>
            th {
            color:white;
            background-color:blue;
            }
        </style>
    </xsl:template>
</xsl:stylesheet>