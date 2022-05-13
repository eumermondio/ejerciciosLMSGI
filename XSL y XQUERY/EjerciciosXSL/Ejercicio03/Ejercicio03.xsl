<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/biblioteca">
        
        <html>
            <head>
                <title>Biblioteca</title>
            </head>
            <body>
                <h1>Nuestra Biblioteca</h1>
                <ul>
                <xsl:for-each select="libro">
                    <li><xsl:value-of select="titulo"/> - (<xsl:value-of select="fechaPublicacion/@año"/>) - <xsl:value-of select="autor"/> - (<xsl:value-of select="autor/@fechaNacimiento"/>)
                    </li>
                </xsl:for-each>
                </ul>
            </body>
        </html>
        
    </xsl:template>
    
</xsl:stylesheet>