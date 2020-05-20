<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<csv_data>
			<xsl:text disable-output-escaping="no">REGION,PURPOSE_CODE,ITEM_NUMBER,PRODUCT_TYPE,ITEM_DESCRIPTION,ITEM_STATUS,UNIT_WEIGHT,WEIGHT_UOM_CODE,UNIT_LENGTH,UNIT_WIDTH,UNIT_HEIGHT,DIMENSION,PRIMARY_UOM_CODE,HTS_CODE,ATTRIBUTE1,ATTRIBUTE2,ATTRIBUTE3,ATTRIBUTE4,ATTRIBUTE5,BATCH_ID,UNIT_COST
</xsl:text>
	
			<xsl:for-each select="type/HEADER">
				<xsl:value-of
					select="concat(REGION,',',PURPOSE_CODE,',',ITEM_NUMBER,',',PRODUCT_TYPE,',',ITEM_DESCRIPTION,',',ITEM_STATUS,',',
					UNIT_WEIGHT,',',WEIGHT_UOM_CODE,',',UNIT_LENGTH,',',UNIT_WIDTH,',',UNIT_HEIGHT,',',DIMENSION,',',PRIMARY_UOM_CODE,
					',',HTS_CODE,',',ATTRIBUTE1,',',ATTRIBUTE2,',',ATTRIBUTE3,',',ATTRIBUTE4,',',ATTRIBUTE5,',',BATCH_ID,',',UNIT_COST,
					'&#xA;')" />
			</xsl:for-each>
		</csv_data>
	</xsl:template>
</xsl:stylesheet>