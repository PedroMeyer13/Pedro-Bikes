<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
       <table id="menuTable" border="1" class="indent">
            <thead>
                <tr>
                    <th colspan="3">Pedro Bikes</th>
                </tr>
                <tr>
                    <th>Select</th>
                    <th>Bikes</th>
                    <th>Price per Day</th>
                </tr>
            </thead>
              <tbody>
                <xsl:for-each select="/BikeOptions/section">
                    <tr>
                        <td colspan="3">
                            <xsl:value-of select="@name" />
                        </td>
                    </tr>
                    <xsl:for-each select="option">
                        <tr id="{position()}">
                            <xsl:attribute name="kids">
                                <xsl:value-of select="boolean(@kids)" />
                            </xsl:attribute>
                            <td align="center">
                                <input name="item0" type="checkbox" />
                            </td>
                            <td>
                                <xsl:value-of select="item" />
                            </td>
                            <td align="right">
                                <xsl:value-of select="price" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:transform>