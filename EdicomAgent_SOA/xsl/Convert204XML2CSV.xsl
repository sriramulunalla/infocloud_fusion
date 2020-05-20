<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<csv_data>
	
			<xsl:for-each select="type/HEADER"> 
				<xsl:value-of
					select="concat(Item,',',Item_Description,',',DELIVERY_NUMBER,',',Shipment_Date,',',Expected_Delivery_Date,',',SO,',',Line,',',Customer_PO,',',Req_Qty,',',UOM,',',Shipped_Qty,',',Shipping_Instructions,',',Packing_Instructions,',',Feight_Method_Code,',',Ship_Method_Code,',',Carrier_Code,',',Shipping_WhereHouse,',',Subinv,',',Ship_Address1,',',Ship_Address2,',',Ship_Address3,',',Ship_City,',',Ship_Region,',',Ship_PostalCode,',',Ship_from_Country,',',SHIP_TO_CUSTOMER_NAME,',',Ship_to_Address1,',',Ship_to_Address2,',',Ship_to_Address3,',',Ship_to_City,',',Ship_to_Region,',',Ship_to_Postal_Code,',',Ship_to_Country,',',BillToAddress1,',',BillToAddress2,',',BillToAddress3,',',BillToCity,',',BillToRegion,',',BillToPostalcode,',',BillToCountry,',',Waybill,',',VAT,',',OrderType,',',Blank_One,',',Blank_Two,',',Blank_Three,',',Blank_Four,',',ShipmentPriority,',',Ship_To_Address_ID,',',PACKING_SLIP,',',ShipToContactName,',',ShipToContactPhone,',',HeaderAttachments,',',ParentItemNumber,',',BOMQty,',',Destination_Project_ID,',',Destination_Project_Name,
					'&#xA;')" />
			</xsl:for-each>
		</csv_data>
	</xsl:template>
</xsl:stylesheet>