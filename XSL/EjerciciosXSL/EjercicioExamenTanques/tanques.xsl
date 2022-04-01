<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
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
                            <xsl:attribute name="style">background: <xsl:choose>
                                    <xsl:when test="position() mod 2 = 1"> #00FAFF;</xsl:when>
                                    <xsl:otherwise> #00CAFF</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <td>
                                <xsl:value-of select="position()"/>
                            </td>
                            <td>
                                <xsl:value-of select="@jugador"/>
                            </td>
                            <td>
                                <xsl:call-template name="imagenTanque">
                                    <xsl:with-param name="jugador" select="@jugador"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:value-of select="@desc"/>
                            </td>
                        </tr>
                    </xsl:for-each>

                </table>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>

                <xsl:for-each select="jugadasGraficas/jugadaGrafica">
                    <table border="1">
                        <tr style="background: blue; color: white;">
                            <td/>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>8</td>
                        </tr>
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i" select="1"/>
                        </xsl:call-template>
                    </table>
                    <p/>
                </xsl:for-each>
            </body>
        </html>

    </xsl:template>

    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 8">
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


    <xsl:template name="celda">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="posicion">
                <xsl:if test="$x = @x and $y = @y">
                    <xsl:choose>
                        <xsl:when test="@tipo = 'tanque'">
                            <xsl:attribute name="style">background: red;</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="style">background: black;</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>

    <xsl:template name="casilla">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="/juegoTanques/jugadasGraficas/jugadasGrafica/posicion">
                <xsl:if test="$x = @x and $y = @y"> AA </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>


    <xsl:template name="imagenTanque">
        <xsl:param name="jugador"/>
        <img width="40%" src="{/juegoTanques/tanques/imagenTanque[@jugador = $jugador]}"/>
    </xsl:template>



    <xsl:template name="css">
        <style>
            th {
                color: white;
                background-color: blue;
            }</style>
    </xsl:template>
</xsl:stylesheet>
