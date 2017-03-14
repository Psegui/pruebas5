<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
<style rel="stylesheet" type="text/css">
table{width:100%;border:1px solid}
th{bth {
padding: 5px;
font-size: 16px;
background-color: #83aec0;
background-image: url(img/fondo_th.png);
background-repeat: repeat-x;
color: #FFFFFF;
border-right-width: 1px;
border-bottom-width: 1px;
border-right-style: solid;
border-bottom-style: solid;
border-right-color: #558FA6;
border-bottom-color: #558FA6;
font-family: “Trebuchet MS”, Arial;
text-transform: uppercase;
}
td,tr,{border:1px solid;padding:2px;vertical-align:top}
span{color:green;padding-left:5px}
</style>
</head>
<body>
  <h2>Corrección</h2>
  <table>
    <tr>
      <th>Pregunta</th>
      <th>Opción</th>
      <th>Respuesta</th>
    </tr>
    <xsl:for-each select="questions/question">      
    <tr>
      <td><xsl:value-of select="title"/></td>
      <td>
       <xsl:for-each select="answer">
        <xsl:choose>
         <xsl:when test="../type = 'text'">
          <span><xsl:value-of select="text()"/></span>
         </xsl:when>
        </xsl:choose>         
       </xsl:for-each>
       <xsl:for-each select="option">
         <xsl:variable name="optposition" select="position()-1"/>
        Opción<xsl:value-of select="$optposition+1"/>: <xsl:value-of select="text()"/>
         <xsl:for-each select="../answer">
          <xsl:variable name="correctanswer" select="text()"/>
          <xsl:if test="$optposition=$correctanswer">
            <span>&#x2713;</span>
          </xsl:if>
         </xsl:for-each><br/><br/>
       </xsl:for-each>
      </td>
      <td>
       <xsl:for-each select="useranswer">
        <xsl:variable name="useranswers" select="text()"/>
        <xsl:value-of select="text()"/>
        <xsl:for-each select="../answer">
          <xsl:choose>
           <xsl:when test="../type = 'text'">
            <xsl:variable name="correctanswertext" select="text()"/>
            <xsl:if test="$useranswers=$correctanswertext">
              <span>&#x2713;</span>
            </xsl:if>
           </xsl:when>
           <xsl:otherwise>
            <xsl:variable name="correctanswer" select="text()+1"/>
            <xsl:if test="$useranswers=$correctanswer">
              <span>&#x2713;</span>
            </xsl:if>
           </xsl:otherwise>
          </xsl:choose>
         </xsl:for-each><br/><br/>
       </xsl:for-each>       
     </td>
    </tr>
    </xsl:for-each>
  </table>
 </body>
 </html>
</xsl:template>

</xsl:stylesheet>
