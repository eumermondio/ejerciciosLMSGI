<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/primerDia1DAW">
        <xsl:call-template name="css"/>
        <html>
            <head>
                <title>Primer dia</title>
            </head>
            <body>
                <table width="100%" border="1">
                    <xsl:for-each select="/primerDia1DAW/horario/dia">
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i" select="1"/>
                        </xsl:call-template>
                        <p/>
                    </xsl:for-each>
                </table>

                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
            </body>
        </html>

    </xsl:template>

    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 6">
            <tr>
                <td style="background: blue; color: white;">
                    <xsl:value-of select="$i"/>
                </td>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i">
                        <xsl:value-of select="$i"/>
                    </xsl:with-param>
                    <xsl:with-param name="j">1</xsl:with-param>
                </xsl:call-template>
            </tr>
            <xsl:call-template name="bucleForFila">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i + 1"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <xsl:template name="bucleForColumna">
        <xsl:param name="i"/>
        <xsl:param name="j"/>
        <xsl:if test="$j &lt;= 5">
            <xsl:call-template name="celda">
                <xsl:with-param name="x">
                    <xsl:value-of select="$j"/>
                </xsl:with-param>
                <xsl:with-param name="y">
                    <xsl:value-of select="$i"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="bucleForColumna">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i"/>
                </xsl:with-param>
                <xsl:with-param name="j">
                    <xsl:value-of select="$j + 1"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="hora">
               <xsl:value-of select="."/>
            </xsl:for-each>
        </td>
    </xsl:template>

 <!--   <xsl:template name="imagenTanque">
        <xsl:param name="jugador"/>
        <img width="40%" src="{/juegoTanques/tanques/imagenTanque[@jugador = $jugador]}"/>
    </xsl:template>
-->
    <xsl:template name="css">
        <style>
            th {
                color: white;
                background-color: blue;
            }</style>
    </xsl:template>
</xsl:stylesheet>
