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
                    <tr>
                        <td/>
                        <td>8:30-9:30</td>
                        <td>9:30-10:30</td>
                        <td>10:30-11:30</td>
                        <td>12:00-13:00</td>
                        <td>13:00-14:00</td>
                        <td>14:00-15:00</td>
                    </tr>
                    <xsl:for-each select="horario/dia">
                        <tr>
                            <td>
                                <xsl:value-of select="@desc"/>
                            </td>
                            <xsl:for-each select="hora">
                                <xsl:sort select="@orden" order="ascending"/>
                                <td>
                                    <xsl:attribute name="style">
                                        <xsl:if test="position() mod 2 = 1"> background:lightblue;
                                        </xsl:if>
                                    </xsl:attribute>
                                    <xsl:value-of select="."/>
                                </td>
                            </xsl:for-each>
                        </tr>
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

                <table border="1" with="100%">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i" select="1"/>
                    </xsl:call-template>
                </table>

            </body>
        </html>

    </xsl:template>

    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 11">
            <tr>
                <xsl:call-template name="bucleForColumna">
                    <xsl:with-param name="i">
                        <xsl:value-of select="$i"/>
                    </xsl:with-param>
                    <xsl:with-param name="j" select="1"/>
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
        <xsl:if test="$j &lt;= 8">
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

    <xsl:template name="colorCelda">
        <xsl:param name="tipo"/>
        <xsl:for-each select="/primerDia1DAW/estructuraAula/color">
            <xsl:if test="$tipo = @tipo">
                <xsl:attribute name="style">background:#<xsl:value-of select="."/>;</xsl:attribute>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="/primerDia1DAW/estructuraAula/bloque">
                <xsl:if test="$x = @x and $y = @y">
                    <xsl:call-template name="colorCelda">
                        <xsl:with-param name="tipo" select="@tipo"/>
                    </xsl:call-template>
                    <xsl:value-of select="@tipo"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="/primerDia1DAW/alumnado/alumno">
                <xsl:if test="$x = @x and $y = @y">
                    <xsl:choose>
                        <xsl:when test="@sexo = 'H'">
                            <xsl:attribute name="style">background:red;</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="style">background:blue;</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:value-of select="."/>
                    <xsl:call-template name="imagenAlumnos">
                        <xsl:with-param name="sexo" select="@sexo"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>

    <xsl:template name="imagenAlumnos">
        <xsl:param name="sexo"/>
        <xsl:for-each select="../imagen">
            <xsl:if test="@sexo = $sexo">
                <img src="{.}" width="20%"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="css">
        <style>
            th {
                color: white;
                background-color: blue;
            }</style>
    </xsl:template>
</xsl:stylesheet>
