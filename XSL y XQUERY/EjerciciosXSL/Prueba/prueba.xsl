<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/videoclub">
        <xsl:call-template name="css"/>

        <html>
            <head>
                <title> Videoclub </title>
            </head>
            <body>
                <div style="width: 1000px; margin: 0 auto;">

                    <table border="1" width="100%">

                        <tr>
                            <th>Titulo</th>
                            <th>Pegi</th>
                            <th>Duracion/Plataforma</th>
                            <th>Alquiler diario</th>
                        </tr>

                        <xsl:for-each select="/videoclub/peliculas">
                            <xsl:for-each select="pelicula">
                                <xsl:sort select="@orden" order="ascending"/>
                                <tr>
                                    <xsl:attribute name="style">background: <xsl:choose>
                                            <xsl:when test="position() mod 2 = 1"> yellow; </xsl:when>
                                            <xsl:otherwise>beige;</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <td>
                                        <xsl:value-of select="."/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@pegi"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@duracion"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@alquilerDiario"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>

                        <xsl:apply-templates select="/videoclub/videojuegos"/>

                    </table>

                    <br/>
                    <br/>
                    <br/>
                    <br/>

                    <table border="1" width="100%">
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i" select="1"/>
                        </xsl:call-template>
                    </table>

                </div>
            </body>
        </html>

    </xsl:template>

    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 5">
            <tr>
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
            <xsl:for-each select="/videoclub/peliculas/pelicula">
                <xsl:if test="$x = @y and $y = @x">
                    <xsl:attribute name="style">background:beige;</xsl:attribute>
                    <xsl:call-template name="imagen">
                        <xsl:with-param name="imagen" select="@idImagen"/>
                    </xsl:call-template><br/>
                    <xsl:value-of select="."/><br/> Pegi: <xsl:value-of select="@pegi"/><br/>
                    Alquiler: <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="/videoclub/videojuegos/videoJuego">
                <xsl:if test="$x = @y and $y = @x">
                    <xsl:attribute name="style">background:lightgreen;</xsl:attribute>
                    <xsl:call-template name="imagen">
                        <xsl:with-param name="imagen" select="@idImagen"/>
                    </xsl:call-template><br/>
                    <xsl:value-of select="."/><br/> Pegi: <xsl:value-of select="@pegi"/><br/>
                    Alquiler: <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>

    <xsl:template name="imagen">
        <xsl:param name="imagen"/>
        <img src="{/videoclub/imagenes/imagen[$imagen = @id]}"/>
    </xsl:template>

    <xsl:template match="/videoclub/videojuegos">
        <xsl:for-each select="videoJuego">
            <xsl:sort select="@orden" order="ascending"/>
            <tr>
                <xsl:attribute name="style">background: <xsl:choose>
                        <xsl:when test="position() mod 2 = 1"> lightgreen; </xsl:when>
                        <xsl:otherwise>beige;</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <td>
                    <xsl:value-of select="."/>
                </td>
                <td>
                    <xsl:value-of select="@pegi"/>
                </td>
                <td>
                    <xsl:value-of select="@plataforma"/>
                </td>
                <td>
                    <xsl:value-of select="@alquilerDiario"/>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="css">
        <style type="text/css">
            body {
                font-family: Arial;
                font-size: 11px;
            }
            img {
                width: 100%;
            }
            th {
                background-color: blue;
                color: white;
            }</style>
    </xsl:template>
</xsl:stylesheet>
