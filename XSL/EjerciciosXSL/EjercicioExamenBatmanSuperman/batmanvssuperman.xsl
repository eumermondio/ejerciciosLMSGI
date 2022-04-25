<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/cine">
        <xsl:call-template name="css"/>
        <html>
            <head>
                <title> Batman Superman </title>
            </head>
            <body>
                <div style="width: 1000px; margin: 0 auto;">
                    <table border="1" width="100%">
                        <xsl:apply-templates select="sesiones/sesion"/>                       
                    </table>
                </div>
            </body>
        </html>

    </xsl:template>


    <xsl:template match="sesiones/sesion">
        <tr>
            <xsl:attribute name="style">background: <xsl:if
                test="position() mod 2 = 1"> lightblue; </xsl:if>
            </xsl:attribute>
            <td style="text-align:center;">
                Sesion <xsl:value-of select="position()"/>: <xsl:value-of select="@hora"/>
                <table border="1" style="margin:auto;">
                    <xsl:call-template name="bucleForFila">
                        <xsl:with-param name="i" select="1"/>
                    </xsl:call-template>
                </table>
            </td>
        </tr>
    </xsl:template>


    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 4">
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
        <xsl:if test="$j &lt;= 4">
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
            <xsl:choose>
                <xsl:when test="ocupado[$y = @fila and $x = @asiento]">
                    <img src="recursos/ocupado.png"/>
                </xsl:when>
                <xsl:otherwise>
                    <img src="recursos/libre.png"/>
                </xsl:otherwise>
            </xsl:choose>
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
