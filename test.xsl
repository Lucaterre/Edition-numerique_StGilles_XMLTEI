<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="//titleStmt/title[@type = 'main_title']"/>- <xsl:value-of
                        select="//titleStmt/title[@type = 'subtitle']"/>
                </title>
      
            </head>
            <body>
                <h1>Edition électronique en XML-TEI de la <xsl:value-of select="//titleStmt/title[@type='main_title']"/> - <xsl:value-of select="//titleStmt/title[@type='subtitle']"/></h1>
                <hr/>
                <!-- <span> pour les métadonnées -->
                <span class="metadonnées">
                    <p id="date"><i><xsl:value-of select="//head/origDate"/></i></p>
                    <h2 id="titre">La vie de Saint Gilles</h2>
                    <p id="Orig"><b>Orig.</b> Paris, Bnf, Departement des manuscrits, Ms.fr.411, f.173a-f.173c</p>
                    
                </span>
            <xsl:apply-templates select="//text"/>
            </body>
        </html>
        </xsl:template>
    
    <xsl:template match="//text">
            <table width="98%" border="0">
                <tr valign="top">
                    <th width="10%"/>
                    <th valign="middle" align="left" width="45%"> Texte original </th>
                    <th valign="middle" align="left" width="45%"> Traduction </th>
                </tr>
                <tr valign="top">
                    <td width="10%"></td>
                    <td width="10%">
                        <div style="height:500pt;overflow:auto">
                        <xsl:apply-templates select="//text/body/div/div"/>
                        </div>
                    </td>
                    <td width="10%">
                        <div style="height:500pt;overflow:auto">
                            <xsl:apply-templates select="//text/body/div/div"/>
                        </div>
                    </td>
                </tr>
            </table>
        
    </xsl:template>
    
    <xsl:template match="div" mode="normalize">

          
          <xsl:copy-of select="p"/>
      
    </xsl:template>




</xsl:stylesheet>
