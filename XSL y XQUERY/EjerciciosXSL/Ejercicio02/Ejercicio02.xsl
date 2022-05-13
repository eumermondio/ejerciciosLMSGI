<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/navidad">
       
        <html>
            <head>
                <title>Navidad</title>
            </head>
            <body>
                <xsl:apply-templates select="almuerzo"/>
            </body>
        </html>
       
    </xsl:template>
<xsl:template match="almuerzo">
    <table border="1">
        <tr>
            <td><xsl:value-of select="primerPlato"/></td>
        </tr>
        <tr>
            <td><xsl:value-of select="segundoPlato"/></td>
        </tr>
        <tr>
            <td><xsl:value-of select="postre"/></td>
        </tr>
        <tr>
            <td><xsl:value-of select="bebida"/></td>
        </tr>
 
        <xsl:apply-templates select="sobremesa"></xsl:apply-templates>
    </table>
    <br/>
</xsl:template>  
<xsl:template match="sobremesa">
    <table border="1">
        <tr>
            <td><xsl:value-of select="primeraCopa"/></td>
        </tr>
        <tr>
            <td><xsl:value-of select="segundaCopa"/></td>
        </tr>
        <tr>
            <td><xsl:value-of select="terceraCopa"/></td>
        </tr>
    </table>
</xsl:template>
</xsl:stylesheet>