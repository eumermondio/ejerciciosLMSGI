<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/gormitis">
       <xsl:call-template name="css"/>
        <html>
            <head>
                <title>Gormiti</title>
            </head>
            <body>
                <table>
                    <tr>
                        <th></th>
                        <th>Gormiti</th>
                        <th>Tribu</th>
                    </tr>
<xsl:for-each select="gormiti">
    <tr>
        <xsl:attribute name="style">background:
            <xsl:choose>
                <xsl:when test="position() mod 2 = 1"> #00FAFF;</xsl:when>
                <xsl:otherwise> #000AFF</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <td><xsl:value-of select="position()"/></td>
        <td><img src="{.}"/></td>
        <td><xsl:value-of select="@tribu"/></td>
    </tr>
</xsl:for-each>
                </table>
            </body>
        </html>
       
    </xsl:template>
    <xsl:template name="css">
        <style>
            img {
            width:50px;
            }
        </style>
    </xsl:template>
</xsl:stylesheet>