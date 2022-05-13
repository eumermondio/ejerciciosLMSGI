<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/partidoBaloncesto">
        <xsl:call-template name="css"/>
        <html>
            <head>
                <title> Baloncesto </title>
            </head>
            <body>
                <div style="width: 1000px; margin: 0 auto;">

                    <h1 align="center">Baloncesto: Baloncesto Lucena - Unicaja Baloncesto</h1>
                    <table border="1" width="100%">

                        <tr>
                            <th>Equipo</th>
                            <th>Jugador</th>
                            <th>Dorsal</th>
                            <th>Apodo</th>
                            <th>Puntos</th>
                            <th>Rebotes</th>
                            <th>Asistencias</th>
                        </tr>

                        <xsl:for-each select="/partidoBaloncesto/equipo">
                            <xsl:for-each select="jugador">
                                <xsl:sort select="@nombre" order="ascending"></xsl:sort>
                                <tr>
                                    <xsl:attribute name="style">
                                        <xsl:if test="position() mod 2 = 1 and ../@tipo = 'Local'">
                                            background:lightblue; </xsl:if>
                                        <xsl:if
                                            test="position() mod 2 = 1 and ../@tipo = 'Visitante'">
                                            background:lightgreen; </xsl:if>
                                    </xsl:attribute>
                                    <td>
                                        <img src="{../@imagen}"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@nombre"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@dorsal"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@apodo"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@puntos"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@rebotes"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@asistencias"/>
                                    </td>

                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                    <br/>
                    <br/>
                    <xsl:for-each select="/partidoBaloncesto/pista">
                        <table width="100%" style="background: url('{.}') no-repeat;"
                            id="tablaCancha">
                            <xsl:call-template name="bucleForFila">
                                <xsl:with-param name="i" select="1"/>
                            </xsl:call-template>
                        </table>
                    </xsl:for-each>
                    <br/>
                    <br/>
                    <table border="1" width="100%">

                        <tr>
                            <th>Tiempo</th>
                            <th>Jugador</th>
                            <th>Apodo</th>
                            <th>Descripción</th>
                            <th>Icono</th>
                        </tr>
                        <xsl:for-each select="/partidoBaloncesto/historico/entrada">
                            <tr>
                                <td>
                                    <xsl:value-of select="@tiempo"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@jugador"/>
                                </td>
                                <td>
                                    <xsl:call-template name="jugadoresApodo">
                                        <xsl:with-param name="jugador">
                                            <xsl:value-of select="@jugador"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                                <td>
                                    <xsl:call-template name="imagenesHistorico">
                                        <xsl:with-param name="tipo">
                                            <xsl:value-of select="@tipo"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>

    </xsl:template>


    <xsl:template name="imagenesHistorico">
        <xsl:param name="tipo"/>
        <xsl:for-each select="/partidoBaloncesto/historico/imagen">
            <xsl:if test="$tipo = @tipo">
               <img src="{.}"></img>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="jugadoresApodo">
        <xsl:param name="jugador"/>
        <xsl:for-each select="/partidoBaloncesto/equipo/jugador">
            <xsl:if test="$jugador = @nombre">
                <xsl:value-of select="@apodo"/>
            </xsl:if>
        </xsl:for-each>
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
        <xsl:if test="$j &lt;= 10">
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
            <xsl:for-each select="/partidoBaloncesto/equipo/jugador">
                <xsl:if test="$x = @posicionX and $y = @posicionY">
                    <img src="{../@imagen}"/>
                    <xsl:value-of select="@nombre"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>

    <xsl:template name="css">
        <style type="text/css">
            body {
                font-family: Arial;
                font-size: 11px;
            }
            
            table img {
                width: 40px;
            }
            
            th {
                background: #1e3356;
                color: #FFFFFF;
            }
            
            #tablaCancha {
                color: #eff4fc;
            }
            
            ol,
            ul
            {
                margin-top: 10px;
                margin-left: 0px;
            }
            
            #menu li
            {
                margin-left: 0px;
                display: inline;
                list-style-type: none;
                padding: 10px 50px;
            }
            
            .noticia {
                /* border: #000 solid 1px; */
                padding: 10px 5px;
                float: left;
                width: 338px;
            }
            
            .noticia img {
                width: 338px;
            }
            
            .noticiaDobleAncho {
                /* border: #000 solid 1px; */
                padding: 10px 5px;
                float: left;
                width: 690px;
            }
            
            .noticiaDobleAncho img {
                width: 690px;
            }
            
            .fechaNoticia {
                color: #A3A34B;
            }
            
            .comentariosNoticia {
                color: #A3A34B;
                padding-left: 20px;
            }
            
            .divPublicidad {
                /* border: #000 solid 1px; */
                padding: 10px 5px;
                float: right;
                width: 280px;
            }
            
            .divPublicidad img {
                width: 200px;
            }</style>
    </xsl:template>
</xsl:stylesheet>
