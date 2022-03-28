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
        <td><xsl:call-template name="imagenTanque">
            <xsl:with-param name="jugador" select="@jugador"></xsl:with-param>
        </xsl:call-template></td>
        <td><xsl:value-of select="@desc"/></td>
    </tr>
</xsl:for-each>
                                        
                </table>
                <br/><br/><br/><br/><br/><br/><br/>
                <br/><br/><br/><br/><br/><br/><br/>
                <br/><br/><br/><br/><br/><br/><br/>
                
                
                <table border="1">
                    
                    <tr>
                        <th></th>
                        <th>1</th> 
                        <th>2</th> 
                        <th>3</th> 
                        <th>4</th> 
                        <th>5</th> 
                        <th>6</th> 
                        <th>7</th> 
                        <th>8</th> 
                    </tr>
                    
                    <tr>
                        <th>1</th>
   <xsl:call-template name="casilla">
       <xsl:with-param name="x" select="0"/>
       <xsl:with-param name="y" select="0"/>
   </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="1"/>
                            <xsl:with-param name="y" select="0"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="2"/>
                            <xsl:with-param name="y" select="0"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="3"/>
                            <xsl:with-param name="y" select="0"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="4"/>
                            <xsl:with-param name="y" select="0"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="5"/>
                            <xsl:with-param name="y" select="0"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="6"/>
                            <xsl:with-param name="y" select="0"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="7"/>
                            <xsl:with-param name="y" select="0"/>
                        </xsl:call-template>
                    
                    </tr>
                    
                    <tr>
                        <th>2</th>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="0"/>
                            <xsl:with-param name="y" select="1"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="1"/>
                            <xsl:with-param name="y" select="1"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="2"/>
                            <xsl:with-param name="y" select="1"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="3"/>
                            <xsl:with-param name="y" select="1"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="4"/>
                            <xsl:with-param name="y" select="1"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="5"/>
                            <xsl:with-param name="y" select="1"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="6"/>
                            <xsl:with-param name="y" select="1"/>
                        </xsl:call-template>
                        <xsl:call-template name="casilla">
                            <xsl:with-param name="x" select="7"/>
                            <xsl:with-param name="y" select="1"/>
                        </xsl:call-template>
                    </tr>
                    
                    <tr>
                        <th>3</th>
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td>  
                    </tr>
                    
                    <tr>
                        <th>4</th>
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td>  
                    </tr>
                    
                    <tr>
                        <th>5</th>
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td>  
                    </tr>
                    
                    <tr>
                        <th>6</th>
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td>  
                    </tr>
                    
                    <tr>
                        <th>7</th>
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td>  
                    </tr>
                    
                    <tr>
                        <th>8</th>
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td> 
                        <td></td>  
                    </tr>
                    
                    
                </table>
                
            </body>
        </html>
       
    </xsl:template>

    <xsl:template name="casilla">
        <xsl:param name="x"/>
        <xsl:param name="y"/>
        <td>
            <xsl:for-each select="/juegoTanques/jugadasGraficas/jugadasGrafica/posicion">
                <xsl:if test="$x = @x and $y = @y">
                AA
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>


<xsl:template name="imagenTanque">
    <xsl:param name="jugador"/>
    <img width="40%" src="{/juegoTanques/tanques/imagenTanque[@jugador = $jugador]}"></img>
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