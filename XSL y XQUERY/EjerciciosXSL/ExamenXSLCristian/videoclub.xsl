<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/videoclub">
        <xsl:call-template name="css"/>
        <html>
            <head>
                <title>
                    <xsl:value-of select="@nombre"/>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="@nombre"/>
                </h1>
                <table border="1" width="100%">
                    <tr>
                        <th>Titulo</th>
                        <th>Pegi</th>
                        <th>Duracion/Plataforma</th>
                        <th>Alquiler diario</th>
                    </tr>
                    <xsl:apply-templates select="/videoclub/Peliculas"/>
                    <xsl:for-each select="/videoclub/videojuegos">
                        <xsl:for-each select="videoJuego">
                            <xsl:sort select="@order" order="ascending"/>
                            <tr>
                                <xsl:attribute name="style">background: <xsl:choose>
                                        <xsl:when test="position() mod 2 = 1"> #9eff8f; </xsl:when>
                                        <xsl:otherwise>#dcffd6;</xsl:otherwise>
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
                    </xsl:for-each>
                </table>
                <br/>
                <br/>
                <table border="1">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i" select="1"/>
                    </xsl:call-template>
                </table>


                <xsl:for-each select="/videoclub/videojuegos/videoJuego">
                    <xsl:sort select="@pegi" order="descending"/>
                    <xsl:if test="position() = 1">El juego con mas PEGI: <xsl:value-of select="."/></xsl:if>
                </xsl:for-each>
                <br/>
                <xsl:for-each select="/videoclub/Peliculas/pelicula">
                    <xsl:sort select="@duracionEnMinutos" order="ascending"/>
                    <xsl:if test="position() = 1">La peli mas corta: <xsl:value-of select="@titulo"/></xsl:if>
                </xsl:for-each>


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
            <xsl:for-each select="/videoclub/Peliculas/pelicula">
                <xsl:if test="$x = coordenadas/@y and $y = coordenadas/@x">
                    <xsl:call-template name="colorCeldas">
                        <xsl:with-param name="id" select="'peliculas'"/>
                    </xsl:call-template>
                    <xsl:call-template name="imagenes">
                        <xsl:with-param name="img" select="@idimg"/>
                    </xsl:call-template><br/>
                    <xsl:value-of select="@titulo"/><br/> Pegi: <xsl:value-of select="@pegi"/><br/>
                    Alquiler: <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="/videoclub/videojuegos/videoJuego">
                <xsl:if test="$x = @y and $y = @x">
                    <xsl:call-template name="colorCeldas">
                        <xsl:with-param name="id" select="'videojuegos'"/>
                    </xsl:call-template>
                    <xsl:call-template name="imagenes">
                        <xsl:with-param name="img" select="idImg/@valor"/>
                    </xsl:call-template><br/>
                    <xsl:value-of select="."/><br/> Pegi: <xsl:value-of select="@pegi"/><br/>
                    Alquiler: <xsl:value-of select="@alquilerDiario"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>

    <xsl:template name="imagenes">
        <xsl:param name="img"/>
        <img src="{/videoclub/bancoDeImagenes/imagen[$img = @identificador]}"/>
    </xsl:template>

    <xsl:template name="colorCeldas">
        <xsl:param name="id"/>
        <xsl:attribute name="style">background:#<xsl:value-of
                select="/videoclub/bancoDeImagenes/color[@identificador = $id]"/>;</xsl:attribute>
    </xsl:template>

    <xsl:template match="/videoclub/Peliculas">
        <xsl:for-each select="pelicula">
            <xsl:sort select="@order" order="ascending"/>
            <tr>
                <xsl:attribute name="style">background: <xsl:choose>
                        <xsl:when test="position() mod 2 = 1"> #ffda75; </xsl:when>
                        <xsl:otherwise>beige;</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <td>
                    <xsl:value-of select="@titulo"/>
                </td>
                <td>
                    <xsl:value-of select="@pegi"/>
                </td>
                <td>
                    <xsl:value-of select="@duracionEnMinutos"/>
                </td>
                <td>
                    <xsl:value-of select="@alquilerDiario"/>
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="css">
        <style type="text/css">
            img {
                width: 50%;
            }
            h1 {
                text-align: center;
            }
            th {
                color: white;
                background-color: blue;
            }</style>
    </xsl:template>
</xsl:stylesheet>
